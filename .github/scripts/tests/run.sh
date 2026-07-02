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

echo; [ "$fail" = "0" ] && echo "ALL TESTS PASSED" || echo "TESTS FAILED"
exit "$fail"
