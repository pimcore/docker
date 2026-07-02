#!/usr/bin/env bash
set -uo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "${HERE}/../../.." && pwd)"
export PATH="${HERE}/stubs:${PATH}"
fail=0
assert_contains() { # <file-or-string> <needle> <msg>
    if printf '%s' "$1" | grep -qF -- "$2"; then echo "  ok: $3"; else echo "  FAIL: $3 (missing '$2')"; fail=1; fi
}
assert_file() { [ -e "$1" ] && echo "  ok: $2 exists" || { echo "  FAIL: $2 missing"; fail=1; }; }
assert_no_file() { [ ! -e "$1" ] && echo "  ok: $2 absent" || { echo "  FAIL: $2 should be absent"; fail=1; }; }

echo "== attach-sbom.sh =="
work="$(mktemp -d)"; echo '{}' > "${work}/s.spdx.json"

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
wA="$(mktemp -d)"; setup_variant "$wA" default
outA="$(GATE_SEVERITY=CRITICAL,HIGH STUB_FIXABLE=yes STUB_GATE=pass run_gate "$wA" default)"; rcA=$?
[ "$rcA" = 0 ] && echo "  ok: A exit 0" || { echo "  FAIL: A exit $rcA"; fail=1; }
assert_file "$wA/.docker-state/default/hardened_image.txt" "A hardened_image"
assert_file "$wA/.docker-state/default/hardened_tags.txt"  "A hardened_tags"
assert_file "$wA/.docker-state/default/hardened_sbom.txt"  "A hardened_sbom"
assert_no_file "$wA/.docker-state/default/gate_failed.txt" "A gate_failed"
assert_contains "$(cat "$wA/.docker-state/default/hardened_tags.txt")" "hardened-amd64" "A tags carry -hardened"

# Scenario B: gate fails -> plain only, marker written, exit 0
wB="$(mktemp -d)"; setup_variant "$wB" max
outB="$(GATE_SEVERITY=CRITICAL,HIGH STUB_FIXABLE=yes STUB_GATE=fail run_gate "$wB" max)"; rcB=$?
[ "$rcB" = 0 ] && echo "  ok: B exit 0 (does not abort step)" || { echo "  FAIL: B exit $rcB"; fail=1; }
assert_file    "$wB/.docker-state/max/gate_failed.txt"   "B gate_failed marker"
assert_no_file "$wB/.docker-state/max/hardened_image.txt" "B hardened_image"
assert_contains "$outB" "::error::" "B emits ::error::"

# Scenario C: nothing fixable -> hardened mirrors plain, gate passes
wC="$(mktemp -d)"; setup_variant "$wC" min
outC="$(GATE_SEVERITY=CRITICAL,HIGH STUB_FIXABLE=no STUB_GATE=pass run_gate "$wC" min)"; rcC=$?
[ "$rcC" = 0 ] && echo "  ok: C exit 0" || { echo "  FAIL: C exit $rcC"; fail=1; }
assert_file "$wC/.docker-state/min/hardened_image.txt" "C hardened_image (mirror)"
assert_no_file "$wC/.docker-state/min/gate_failed.txt" "C gate_failed"

# Scenario D: gate disabled (NONE) -> hardened published without gate scan
wD="$(mktemp -d)"; setup_variant "$wD" debug
outD="$(GATE_SEVERITY=NONE STUB_FIXABLE=yes run_gate "$wD" debug)"; rcD=$?
assert_file "$wD/.docker-state/debug/hardened_image.txt" "D hardened_image (NONE)"

echo; [ "$fail" = "0" ] && echo "ALL TESTS PASSED" || echo "TESTS FAILED"
exit "$fail"
