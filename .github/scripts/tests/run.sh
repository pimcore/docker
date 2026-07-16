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

echo "== attach-sbom.sh =="
work="$(mktemp -d)"; tmpdirs+=("$work"); echo '{}' > "${work}/s.spdx.json"

# success path
out="$(STUB_ORAS=ok "${ROOT}/.github/scripts/attach-sbom.sh" pimcore/pimcore:php8.5-v5-amd64 "${work}/s.spdx.json" 2>&1)"; rc=$?
assert_contains "$out" "Attached" "success prints Attached"
[ "$rc" = "0" ] && echo "  ok: exit 0 on success" || { echo "  FAIL: exit $rc"; fail=1; }

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
    ( cd "$1" && IMAGE_NAME=pimcore/pimcore ARCH_TAG=amd64 \
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
assert_contains "$logA" "format=json severity=CRITICAL,HIGH image=pimcore/pimcore:php8.5-default-v5.1-hardened-amd64" "A post-patch GATE scan targeted the HARDENED image"
assert_contains "$logA" "format=spdx-json severity= image=pimcore/pimcore:php8.5-default-v5.1-hardened-amd64" "A SPDX SBOM generation targeted the HARDENED image"

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

echo; [ "$fail" = "0" ] && echo "ALL TESTS PASSED" || echo "TESTS FAILED"
exit "$fail"
