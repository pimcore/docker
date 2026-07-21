#!/usr/bin/env bash
set -uo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "${HERE}/../../.." && pwd)"
export PATH="${HERE}/stubs:${PATH}"

# The real scripts (and these tests' assertions) depend on real jq for JSON
# validation/queries; the stubs deliberately do not stub jq. Fail clearly
# rather than let jq-not-found surface as a confusing mid-scenario error.
if ! command -v jq >/dev/null 2>&1; then
    echo "FAIL: 'jq' is required to run scan-patch-gate.sh (and these tests) but was not found on PATH." >&2
    exit 1
fi

# Collect every scenario temp dir/file so repeated local runs don't litter /tmp.
tmpdirs=()
cleanup() {
    local d
    for d in "${tmpdirs[@]}"; do
        [ -n "$d" ] && rm -rf "$d"
    done
}
trap cleanup EXIT

fail=0
assert_contains() { # <file-or-string> <needle> <msg>
    if printf '%s' "$1" | grep -qF -- "$2"; then echo "  ok: $3"; else echo "  FAIL: $3 (missing '$2')"; fail=1; fi
}
assert_not_contains() { # <file-or-string> <needle> <msg>
    if printf '%s' "$1" | grep -qF -- "$2"; then echo "  FAIL: $3 (unexpectedly found '$2')"; fail=1; else echo "  ok: $3"; fi
}
assert_eq() { # <actual> <expected> <msg>
    if [ "$1" = "$2" ]; then echo "  ok: $3"; else echo "  FAIL: $3 (expected: [$2] got: [$1])"; fail=1; fi
}
assert_file() { [ -e "$1" ] && echo "  ok: $2 exists" || { echo "  FAIL: $2 missing"; fail=1; }; }
assert_no_file() { [ ! -e "$1" ] && echo "  ok: $2 absent" || { echo "  FAIL: $2 should be absent"; fail=1; }; }
assert_nonempty_file() { [ -s "$1" ] && echo "  ok: $2 non-empty" || { echo "  FAIL: $2 missing or empty"; fail=1; }; }
assert_no_glob() { # <glob-pattern> <msg>  (true if nothing matches the pattern)
    local matches
    matches="$(compgen -G "$1" 2>/dev/null || true)"
    [ -z "$matches" ] && echo "  ok: $2" || { echo "  FAIL: $2 (found: $matches)"; fail=1; }
}

echo "== normalize-severity.sh =="
nsErr="$(mktemp)"; tmpdirs+=("$nsErr")
run_norm() { # <input>; sets NS_OUT (stdout) and NS_RC (exit code); stderr captured to $nsErr
    NS_OUT="$("${ROOT}/.github/scripts/normalize-severity.sh" "$1" 2>"$nsErr")"; NS_RC=$?
}

run_norm "CRITICAL,HIGH"
assert_eq "$NS_OUT" "HIGH,CRITICAL" "normalize CRITICAL,HIGH -> HIGH,CRITICAL"
assert_eq "$NS_RC" "0" "normalize CRITICAL,HIGH exit 0"

run_norm "HIGH"
assert_eq "$NS_OUT" "HIGH,CRITICAL" "normalize HIGH -> HIGH,CRITICAL (threshold expansion)"
assert_eq "$NS_RC" "0" "normalize HIGH exit 0"

run_norm "none"
assert_eq "$NS_OUT" "NONE" "normalize lowercase 'none' -> NONE"
assert_eq "$NS_RC" "0" "normalize 'none' exit 0"

run_norm "None"
assert_eq "$NS_OUT" "NONE" "normalize 'None' -> NONE"
assert_eq "$NS_RC" "0" "normalize 'None' exit 0"

run_norm "medium"
assert_eq "$NS_OUT" "MEDIUM,HIGH,CRITICAL" "normalize 'medium' -> MEDIUM,HIGH,CRITICAL (expansion + case-insensitive)"
assert_eq "$NS_RC" "0" "normalize 'medium' exit 0"

run_norm "critical,low"
assert_eq "$NS_OUT" "LOW,MEDIUM,HIGH,CRITICAL" "normalize 'critical,low' -> LOW,MEDIUM,HIGH,CRITICAL (lowest member wins)"
assert_eq "$NS_RC" "0" "normalize 'critical,low' exit 0"

run_norm ","
assert_eq "$NS_RC" "1" "normalize ',' exits 1"
assert_contains "$(cat "$nsErr")" "names no valid severity" "normalize ',' stderr names no valid severity"

run_norm "BOGUS"
assert_eq "$NS_RC" "1" "normalize 'BOGUS' exits 1"
assert_contains "$(cat "$nsErr")" "Invalid fail_on_severity value" "normalize 'BOGUS' stderr flags invalid value"

echo "== attach-sbom.sh =="
work="$(mktemp -d)"; tmpdirs+=("$work"); echo '{}' > "${work}/s.spdx.json"

# success path
orasLog="$(mktemp)"; tmpdirs+=("$orasLog")
out="$(STUB_ORAS=ok STUB_LOG="$orasLog" "${ROOT}/.github/scripts/attach-sbom.sh" pimcore/pimcore:php8.5-v5-amd64 "${work}/s.spdx.json" 2>&1)"; rc=$?
assert_contains "$out" "Attached" "success prints Attached"
[ "$rc" = "0" ] && echo "  ok: exit 0 on success" || { echo "  FAIL: exit $rc"; fail=1; }
orasCallLog="$(cat "$orasLog" 2>/dev/null)"
assert_contains "$orasCallLog" "attach --artifact-type application/spdx+json" "oras invoked with attach --artifact-type application/spdx+json"
assert_contains "$orasCallLog" "${work}/s.spdx.json:application/spdx+json" "oras blob arg carries :application/spdx+json media-type suffix"
# oras needs a fully-qualified registry: a bare Docker Hub ref must be prefixed docker.io/
# (else oras reads "pimcore" as the registry host and the attach is silently lost).
assert_contains "$orasCallLog" "attach --artifact-type application/spdx+json docker.io/pimcore/pimcore:php8.5-v5-amd64" "bare Docker Hub ref qualified to docker.io for oras"

# a ref that already carries a registry host (ghcr.io/...) is left untouched
ghLog="$(mktemp)"; tmpdirs+=("$ghLog")
STUB_ORAS=ok STUB_LOG="$ghLog" "${ROOT}/.github/scripts/attach-sbom.sh" ghcr.io/pimcore/pimcore:php8.5-v5-amd64 "${work}/s.spdx.json" >/dev/null 2>&1
ghCallLog="$(cat "$ghLog" 2>/dev/null)"
assert_contains "$ghCallLog" "attach --artifact-type application/spdx+json ghcr.io/pimcore/pimcore:php8.5-v5-amd64" "ghcr.io ref left unqualified (already a registry host)"
assert_not_contains "$ghCallLog" "docker.io/ghcr.io" "ghcr.io ref not double-prefixed with docker.io"

# single-component ref (no slash) is an official image -> docker.io/library/<name>
scLog="$(mktemp)"; tmpdirs+=("$scLog")
STUB_ORAS=ok STUB_LOG="$scLog" "${ROOT}/.github/scripts/attach-sbom.sh" alpine:latest "${work}/s.spdx.json" >/dev/null 2>&1
assert_contains "$(cat "$scLog")" "attach --artifact-type application/spdx+json docker.io/library/alpine:latest" "single-component ref -> docker.io/library/"

# localhost is a registry host -> left as-is (not rewritten to Docker Hub)
lhLog="$(mktemp)"; tmpdirs+=("$lhLog")
STUB_ORAS=ok STUB_LOG="$lhLog" "${ROOT}/.github/scripts/attach-sbom.sh" localhost/repo:tag "${work}/s.spdx.json" >/dev/null 2>&1
assert_contains "$(cat "$lhLog")" "attach --artifact-type application/spdx+json localhost/repo:tag" "localhost recognized as registry host (left as-is)"
assert_not_contains "$(cat "$lhLog")" "docker.io/localhost" "localhost ref not prefixed with docker.io"

# failure path is swallowed
out="$(STUB_ORAS=fail "${ROOT}/.github/scripts/attach-sbom.sh" pimcore/pimcore:php8.5-v5-amd64 "${work}/s.spdx.json" 2>&1)"; rc=$?
assert_contains "$out" "::warning::" "failure prints warning"
[ "$rc" = "0" ] && echo "  ok: exit 0 on failure" || { echo "  FAIL: exit $rc"; fail=1; }

# missing file
out="$("${ROOT}/.github/scripts/attach-sbom.sh" pimcore/pimcore:x /nope.json 2>&1)"; rc=$?
assert_contains "$out" "::warning::" "missing file warns"
[ "$rc" = "0" ] && echo "  ok: exit 0 on missing file" || { echo "  FAIL: exit $rc"; fail=1; }

echo "== scan-patch-gate.sh =="
setup_variant() { # <dir> <variant>
    local d="$1/.docker-state/$2"; mkdir -p "$d"
    echo "pimcore/pimcore:php8.5-$2-v5.1-amd64" > "$d/plain_image.txt"
    echo "php8.5-$2"   > "$d/base_tag.txt"
    echo "v5.1"        > "$d/version.txt"
    echo "php8.5-$2-v5.1-amd64" > "$d/tag.txt"
    printf '%s\n' \
        "pimcore/pimcore:php8.5-$2-v5.1-amd64" \
        "ghcr.io/pimcore/pimcore:php8.5-$2-v5.1-amd64" > "$d/plain_tags.txt"
}
run_gate() { # runs scan-patch-gate.sh in <dir> with env already exported
    # RETRY_MAX=1: the with-retry.sh wrapper around trivy runs the command exactly
    # once here (no sleeps, behaviour identical to the unwrapped call). with-retry's
    # own retry/backoff is covered by its dedicated tests below.
    ( cd "$1" && IMAGE_NAME=pimcore/pimcore ARCH_TAG=amd64 RETRY_MAX=1 \
        "${ROOT}/.github/scripts/scan-patch-gate.sh" "$2" ) 2>&1
}

# Scenario A: fixable vulns, gate passes -> hardened published
wA="$(mktemp -d)"; tmpdirs+=("$wA"); setup_variant "$wA" default
outA="$(GATE_SEVERITY=CRITICAL,HIGH STUB_FIXABLE=yes STUB_GATE=pass STUB_LOG="$wA/stub.log" run_gate "$wA" default)"; rcA=$?
[ "$rcA" = 0 ] && echo "  ok: A exit 0" || { echo "  FAIL: A exit $rcA"; fail=1; }
assert_file "$wA/.docker-state/default/hardened_image.txt" "A hardened_image"
assert_file "$wA/.docker-state/default/hardened_tags.txt"  "A hardened_tags"
assert_file "$wA/.docker-state/default/hardened_sbom.txt"  "A hardened_sbom"
assert_no_file "$wA/.docker-state/default/gate_failed.txt" "A gate_failed"

# Exact content, not a substring: a derivation regression that drops a tag
# (or mangles the suffix swap) must fail this.
expectedA_tags=$'pimcore/pimcore:php8.5-default-v5.1-hardened-amd64\nghcr.io/pimcore/pimcore:php8.5-default-v5.1-hardened-amd64'
assert_eq "$(cat "$wA/.docker-state/default/hardened_tags.txt")" "$expectedA_tags" "A hardened_tags exact derived content (both tags)"

logA="$(cat "$wA/stub.log" 2>/dev/null)"
assert_contains "$logA" "-t pimcore/pimcore:php8.5-default-v5.1-hardened-amd64" "A copa invoked with full hardened image reference"
assert_not_contains "$logA" " -a " "A copa invoked WITHOUT -a when BUILDKIT_ADDR unset (containerd store / default connection)"
assert_contains "$logA" "format=json severity=CRITICAL,HIGH image=pimcore/pimcore:php8.5-default-v5.1-hardened-amd64" "A post-patch GATE scan targeted the HARDENED image"
assert_contains "$logA" "format=spdx-json severity= image=pimcore/pimcore:php8.5-default-v5.1-hardened-amd64" "A SPDX SBOM generation targeted the HARDENED image"

# R4: the gate scan must retain --ignore-unfixed and --pkg-types os in the RAW
# invocation (not just the parsed summary above) -- dropping either would let
# already-unfixed-upstream or non-OS vulnerabilities leak past the gate silently.
gateRawA="$(grep -- '--format json' "$wA/stub.log" | grep -- '--severity' | grep 'hardened')"
assert_contains "$gateRawA" "--ignore-unfixed" "A raw gate scan invocation carries --ignore-unfixed"
assert_contains "$gateRawA" "--pkg-types os" "A raw gate scan invocation carries --pkg-types os"

# Scenario B: gate fails -> plain only, marker written, exit 0
wB="$(mktemp -d)"; tmpdirs+=("$wB"); setup_variant "$wB" max
summaryB="$(mktemp)"; tmpdirs+=("$summaryB")
outB="$(GATE_SEVERITY=CRITICAL,HIGH STUB_FIXABLE=yes STUB_GATE=fail STUB_LOG="$wB/stub.log" GITHUB_STEP_SUMMARY="$summaryB" run_gate "$wB" max)"; rcB=$?
[ "$rcB" = 0 ] && echo "  ok: B exit 0 (does not abort step)" || { echo "  FAIL: B exit $rcB"; fail=1; }
assert_file    "$wB/.docker-state/max/gate_failed.txt"   "B gate_failed marker"
assert_no_file "$wB/.docker-state/max/hardened_image.txt" "B hardened_image"
assert_contains "$outB" "::error::" "B emits ::error::"
assert_nonempty_file "$wB/.docker-state/max/gate_failed.txt" "B gate_failed marker content"
assert_contains "$(cat "$wB/.docker-state/max/gate_failed.txt")" "unfixed" "B gate_failed contains the failure reason"
assert_contains "$(cat "$summaryB")" "## Gate failed:" "B step summary recorded the gate-failure section"

# Scenario C: nothing fixable -> hardened mirrors plain, gate passes
wC="$(mktemp -d)"; tmpdirs+=("$wC"); setup_variant "$wC" min
outC="$(GATE_SEVERITY=CRITICAL,HIGH STUB_FIXABLE=no STUB_GATE=pass STUB_LOG="$wC/stub.log" run_gate "$wC" min)"; rcC=$?
[ "$rcC" = 0 ] && echo "  ok: C exit 0" || { echo "  FAIL: C exit $rcC"; fail=1; }
assert_file "$wC/.docker-state/min/hardened_image.txt" "C hardened_image (mirror)"
assert_no_file "$wC/.docker-state/min/gate_failed.txt" "C gate_failed"
logC="$(cat "$wC/stub.log" 2>/dev/null)"
assert_not_contains "$logC" "copa patch" "C copa NOT invoked (nothing fixable)"
assert_contains "$logC" "docker tag pimcore/pimcore:php8.5-min-v5.1-amd64 pimcore/pimcore:php8.5-min-v5.1-hardened-amd64" "C docker tag mirrors plain -> hardened in correct order"

# Scenario D: gate disabled (NONE) -> hardened published without gate scan
wD="$(mktemp -d)"; tmpdirs+=("$wD"); setup_variant "$wD" debug
outD="$(GATE_SEVERITY=NONE STUB_FIXABLE=yes STUB_GATE=fail STUB_LOG="$wD/stub.log" run_gate "$wD" debug)"; rcD=$?
[ "$rcD" = 0 ] && echo "  ok: D exit 0" || { echo "  FAIL: D exit $rcD"; fail=1; }
assert_file "$wD/.docker-state/debug/hardened_image.txt" "D hardened_image (NONE)"
assert_file "$wD/.docker-state/debug/hardened_tags.txt" "D hardened_tags (NONE)"
assert_file "$wD/.docker-state/debug/hardened_sbom.txt" "D hardened_sbom (NONE)"
# STUB_GATE=fail would have produced gate_failed.txt (and skipped the hardened
# markers above) had the gate scan actually run; its absence plus the markers
# above prove the gate scan was skipped for GATE_SEVERITY=NONE.
assert_no_file "$wD/.docker-state/debug/gate_failed.txt" "D gate_failed absent (gate was skipped despite STUB_GATE=fail)"
assert_no_glob "$wD/trivy-reports/*hardened*" "D no gate report written under trivy-reports/ (gate scan skipped)"

# Scenario E: copa patch fails -> contained via fail_gate, not a hard abort
wE="$(mktemp -d)"; tmpdirs+=("$wE"); setup_variant "$wE" copafail
outE="$(GATE_SEVERITY=CRITICAL,HIGH STUB_FIXABLE=yes STUB_COPA=fail STUB_LOG="$wE/stub.log" run_gate "$wE" copafail)"; rcE=$?
[ "$rcE" = 0 ] && echo "  ok: E exit 0 (copa failure contained)" || { echo "  FAIL: E exit $rcE"; fail=1; }
assert_file "$wE/.docker-state/copafail/gate_failed.txt" "E gate_failed marker"
assert_no_file "$wE/.docker-state/copafail/hardened_image.txt" "E hardened_image absent"
assert_contains "$(cat "$wE/.docker-state/copafail/gate_failed.txt")" "Copa patch failed" "E gate_failed reason mentions copa failure"

# Scenario F: initial Trivy report is malformed JSON -> fail-closed, not a hard abort
wF="$(mktemp -d)"; tmpdirs+=("$wF"); setup_variant "$wF" badjson
outF="$(GATE_SEVERITY=CRITICAL,HIGH STUB_BADJSON=1 STUB_LOG="$wF/stub.log" run_gate "$wF" badjson)"; rcF=$?
[ "$rcF" = 0 ] && echo "  ok: F exit 0 (malformed report contained)" || { echo "  FAIL: F exit $rcF"; fail=1; }
assert_file "$wF/.docker-state/badjson/gate_failed.txt" "F gate_failed marker"
assert_no_file "$wF/.docker-state/badjson/hardened_image.txt" "F hardened_image absent"
assert_contains "$(cat "$wF/.docker-state/badjson/gate_failed.txt")" "not valid JSON" "F gate_failed reason mentions invalid JSON"

# Scenario G: BUILDKIT_ADDR set -> copa receives -a <addr> (rollback / standalone buildkitd path)
wG="$(mktemp -d)"; tmpdirs+=("$wG"); setup_variant "$wG" default
outG="$(BUILDKIT_ADDR=tcp://127.0.0.1:8888 GATE_SEVERITY=CRITICAL,HIGH STUB_FIXABLE=yes STUB_GATE=pass STUB_LOG="$wG/stub.log" run_gate "$wG" default)"; rcG=$?
[ "$rcG" = 0 ] && echo "  ok: G exit 0" || { echo "  FAIL: G exit $rcG"; fail=1; }
logG="$(cat "$wG/stub.log" 2>/dev/null)"
assert_contains "$logG" "-a tcp://127.0.0.1:8888" "G copa receives -a <addr> when BUILDKIT_ADDR set"

# Scenario H: the POST-PATCH gate report is malformed JSON -> fail-closed at the gate
# jq-empty check (line ~90). Distinct from Scenario F, which corrupts the INITIAL plain
# scan; here the initial scan is valid and fixable, copa patches, and only the gate report
# is bad -- exercising the second fail-closed branch that Scenario F cannot reach.
wH="$(mktemp -d)"; tmpdirs+=("$wH"); setup_variant "$wH" gatebadjson
outH="$(GATE_SEVERITY=CRITICAL,HIGH STUB_FIXABLE=yes STUB_BADJSON_GATE=1 STUB_LOG="$wH/stub.log" run_gate "$wH" gatebadjson)"; rcH=$?
[ "$rcH" = 0 ] && echo "  ok: H exit 0 (gate report malformed, contained)" || { echo "  FAIL: H exit $rcH"; fail=1; }
assert_file "$wH/.docker-state/gatebadjson/gate_failed.txt" "H gate_failed marker"
assert_no_file "$wH/.docker-state/gatebadjson/hardened_image.txt" "H hardened_image absent"
assert_contains "$(cat "$wH/.docker-state/gatebadjson/gate_failed.txt")" "gate report is not valid JSON" "H gate_failed reason mentions gate report invalid JSON"

# Scenario I: hardened SBOM generation fails after the gate passed. fail_gate must not leave
# a partial SBOM in the sboms/ dir (the always-runs artifact upload would otherwise expose a
# hardened SBOM for a variant that was never published).
wI="$(mktemp -d)"; tmpdirs+=("$wI"); setup_variant "$wI" sbomfail
outI="$(GATE_SEVERITY=CRITICAL,HIGH STUB_FIXABLE=yes STUB_GATE=pass STUB_SBOM=fail STUB_LOG="$wI/stub.log" run_gate "$wI" sbomfail)"; rcI=$?
[ "$rcI" = 0 ] && echo "  ok: I exit 0 (SBOM failure contained)" || { echo "  FAIL: I exit $rcI"; fail=1; }
assert_file "$wI/.docker-state/sbomfail/gate_failed.txt" "I gate_failed marker"
assert_no_file "$wI/.docker-state/sbomfail/hardened_image.txt" "I hardened_image absent"
assert_no_file "$wI/sboms/php8.5-sbomfail-v5.1-hardened-amd64.spdx.json" "I partial hardened SBOM removed from sboms/"
assert_contains "$(cat "$wI/.docker-state/sbomfail/gate_failed.txt")" "hardened SBOM generation failed" "I gate_failed reason mentions SBOM failure"

# --- merge-manifests.sh ---
echo "merge-manifests.sh:"
wM="$(mktemp -d)"; tmpdirs+=("$wM")
printf '%s\n' \
    "pimcore/pimcore:php8.5-v5.2-amd64" \
    "pimcore/pimcore:php8.5-v5.2-arm64" \
    "pimcore/pimcore:php8.5-latest-amd64" \
    "pimcore/pimcore:php8.5-onlyone-amd64" > "$wM/agg.txt"
logM="$wM/stub.log"
outM="$(AGG_FILE="$wM/agg.txt" STUB_LOG="$logM" "${ROOT}/.github/scripts/merge-manifests.sh")"; rcM=$?
[ "$rcM" = 0 ] && echo "  ok: M exit 0" || { echo "  FAIL: M exit $rcM"; fail=1; }
assert_contains "$(cat "$logM")" "buildx imagetools create --tag pimcore/pimcore:php8.5-v5.2 pimcore/pimcore:php8.5-v5.2-amd64 pimcore/pimcore:php8.5-v5.2-arm64" "M both-arch tag merged"
assert_not_contains "$outM" "Creating multi-arch manifest: pimcore/pimcore:php8.5-onlyone" "M single-arch tag skipped (not created)"
assert_contains "$outM" "Skipping pimcore/pimcore:php8.5-onlyone" "M single-arch tag reported as skipped"

# imagetools create failure -> non-zero exit
wMf="$(mktemp -d)"; tmpdirs+=("$wMf")
printf '%s\n' "pimcore/pimcore:x-amd64" "pimcore/pimcore:x-arm64" > "$wMf/agg.txt"
AGG_FILE="$wMf/agg.txt" STUB_IMAGETOOLS=fail STUB_LOG="$wMf/stub.log" "${ROOT}/.github/scripts/merge-manifests.sh"; rcMf=$?
[ "$rcMf" != 0 ] && echo "  ok: Mf exit non-zero on create failure" || { echo "  FAIL: Mf should fail"; fail=1; }

# Task 2: tag<TAB>sbom format -> attach both per-arch SBOMs to the logical tag
wS="$(mktemp -d)"; tmpdirs+=("$wS"); mkdir -p "$wS/sboms"
# NON-EMPTY: attach-sbom.sh skips empty SBOM files ([ ! -s ]), so an empty file
# would produce zero oras calls and a false test failure.
echo '{"spdxVersion":"SPDX-2.3"}' > "$wS/sboms/php8.5-v5.2-amd64.spdx.json"
echo '{"spdxVersion":"SPDX-2.3"}' > "$wS/sboms/php8.5-v5.2-arm64.spdx.json"
printf '%s\t%s\n' \
    "pimcore/pimcore:php8.5-v5.2-amd64" "sboms/php8.5-v5.2-amd64.spdx.json" \
    "pimcore/pimcore:php8.5-v5.2-arm64" "sboms/php8.5-v5.2-arm64.spdx.json" > "$wS/agg.txt"
logS="$wS/stub.log"
outS="$( cd "$wS" && AGG_FILE="$wS/agg.txt" STUB_LOG="$logS" STUB_ORAS=ok "${ROOT}/.github/scripts/merge-manifests.sh" )"; rcS=$?
[ "$rcS" = 0 ] && echo "  ok: S exit 0" || { echo "  FAIL: S exit $rcS"; fail=1; }
oras_attaches="$(grep -c 'attach' "$logS" 2>/dev/null || true)"
[ "${oras_attaches:-0}" = "2" ] && echo "  ok: S two SBOM referrers attached to logical tag" || { echo "  FAIL: S expected 2 attach calls, got ${oras_attaches:-0}"; fail=1; }
# Exact subject binding: each referrer must target the LOGICAL tag (no arch suffix),
# keyed to the matching per-arch SBOM. Catches a regression that attaches to the child
# (…-amd64/…-arm64) ref instead of the index -- which would defeat the whole feature.
assert_contains "$(cat "$logS")" "attach --artifact-type application/spdx+json docker.io/pimcore/pimcore:php8.5-v5.2 sboms/php8.5-v5.2-amd64.spdx.json" "S amd64 SBOM attached to the LOGICAL tag (docker.io-qualified)"
assert_contains "$(cat "$logS")" "attach --artifact-type application/spdx+json docker.io/pimcore/pimcore:php8.5-v5.2 sboms/php8.5-v5.2-arm64.spdx.json" "S arm64 SBOM attached to the LOGICAL tag (docker.io-qualified)"

echo "== with-retry.sh =="
WR="${ROOT}/.github/scripts/with-retry.sh"

# 1. success on the first try -> exit 0, command run once
cf1="$(mktemp)"; tmpdirs+=("$cf1"); echo 0 > "$cf1"
CF="$cf1" RETRY_DELAY=0 "$WR" bash -c 'echo $(( $(cat "$CF") + 1 )) > "$CF"' ; rc=$?
[ "$rc" = 0 ] && echo "  ok: success -> exit 0" || { echo "  FAIL: rc $rc"; fail=1; }
[ "$(cat "$cf1")" = 1 ] && echo "  ok: ran exactly once" || { echo "  FAIL: ran $(cat "$cf1")x"; fail=1; }

# 2. fails twice then succeeds (max 3) -> overall success, 3 attempts
cf2="$(mktemp)"; tmpdirs+=("$cf2"); echo 0 > "$cf2"
CF="$cf2" RETRY_DELAY=0 RETRY_MAX=3 "$WR" bash -c 'n=$(( $(cat "$CF") + 1 )); echo $n > "$CF"; [ "$n" -ge 3 ]'; rc=$?
[ "$rc" = 0 ] && echo "  ok: retries then succeeds -> exit 0" || { echo "  FAIL: rc $rc"; fail=1; }
[ "$(cat "$cf2")" = 3 ] && echo "  ok: took 3 attempts" || { echo "  FAIL: took $(cat "$cf2")"; fail=1; }

# 3. always fails -> returns the command's last exit code after RETRY_MAX attempts
cf3="$(mktemp)"; tmpdirs+=("$cf3"); echo 0 > "$cf3"
CF="$cf3" RETRY_DELAY=0 RETRY_MAX=2 "$WR" bash -c 'echo $(( $(cat "$CF") + 1 )) > "$CF"; exit 7'; rc=$?
[ "$rc" = 7 ] && echo "  ok: returns last exit code (7)" || { echo "  FAIL: rc $rc (want 7)"; fail=1; }
[ "$(cat "$cf3")" = 2 ] && echo "  ok: tried RETRY_MAX (2) times" || { echo "  FAIL: tried $(cat "$cf3")x"; fail=1; }

# 4. no command given -> usage error (exit 2), not a silent success
"$WR" >/dev/null 2>&1; rc=$?
[ "$rc" = 2 ] && echo "  ok: no-args -> exit 2 (usage)" || { echo "  FAIL: no-args rc $rc (want 2)"; fail=1; }

echo; [ "$fail" = "0" ] && echo "ALL TESTS PASSED" || echo "TESTS FAILED"
exit "$fail"
