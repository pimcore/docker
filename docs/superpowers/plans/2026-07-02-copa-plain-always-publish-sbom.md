# Copa plain-always-publish + SBOM Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make plain images always publish (even with CVEs) while `-hardened` tags publish only when they pass the severity gate, and generate a legally-required SPDX SBOM for every published image.

**Architecture:** The `release.yml` workflow builds plain images, then (for `hardened: true` entries) scans+patches+gates each variant. The gate logic and SBOM attachment are extracted into `.github/scripts/*.sh` so they are unit-testable with stubbed `trivy`/`copa`/`docker`/`oras`. A gate failure writes a per-variant marker and skips only that variant's hardened tags; a final step turns the job red after pushes. SBOMs are generated with Trivy (SPDX-JSON) and attached to pushed images as OCI referrers via `oras`.

**Tech Stack:** GitHub Actions, Bash 5, Trivy, Copacetic (Copa), oras, jq, Docker Buildx.

## Global Constraints

- Registry / image name: `pimcore/pimcore` (Docker Hub) and `ghcr.io/pimcore/pimcore` (verbatim).
- `-hardened` produced **only** for `hardened: true` matrix entries (`v1.6`, `v2.3`, `v3.8`, `v4.2`, `v5.1`); dev/rolling lines stay plain-only.
- Plain images **always publish**, even with CVEs. Only `-hardened` is gated.
- SBOM format: **SPDX-JSON** (`trivy image --format spdx-json`), for every published image, per architecture.
- `oras attach` is **non-fatal** — a registry rejecting referrers must only warn.
- Severity gate is a **threshold**: `fail_on_severity` normalises to an inclusive list (`HIGH` → `HIGH,CRITICAL`); `NONE` disables it. (Already implemented inline as `GATE_SEVERITY` — do not remove.)
- Copa `-t` takes a **full image reference** (`${IMAGE_NAME}:...`), not a bare tag.
- Pinned tool versions live in `env:` (`COPA_VERSION`, `BUILDKIT_VERSION`); add `ORAS_VERSION`, `ACTIONLINT_VERSION` the same way.
- Shell: every extracted script starts with `#!/usr/bin/env bash` and `set -euo pipefail`.

---

## File Structure

- `.github/scripts/attach-sbom.sh` (new) — attach one SBOM to one image ref via `oras`, non-fatal.
- `.github/scripts/scan-patch-gate.sh` (new) — per-variant scan → patch/mirror → gate → on pass: write hardened outputs + hardened SBOM; on fail: write `gate_failed.txt`, skip hardened outputs, exit 0.
- `.github/scripts/tests/stubs/{trivy,copa,docker,oras}` (new) — arg-inspecting stubs on `PATH`.
- `.github/scripts/tests/run.sh` (new) — stub-driven test runner for the two scripts.
- `.github/workflows/release.yml` (modify) — install split, plain SBOM, wire gate script, push-attach, final fail step, `fail-fast: false`, `process-tags` `always()`.
- `.github/workflows/test.yml` (modify) — add a fast `scripts` job running actionlint + `run.sh`.
- `README.md` (modify) — rewrite "Hardened images" section.
- `docs/superpowers/specs/2026-06-15-hardened-image-tag-design.md` (modify) — supersession note.

---

### Task 1: `attach-sbom.sh` (non-fatal SBOM attach)

**Files:**
- Create: `.github/scripts/attach-sbom.sh`
- Create: `.github/scripts/tests/stubs/oras`
- Create: `.github/scripts/tests/run.sh` (started here, extended in Task 2)

**Interfaces:**
- Produces: `attach-sbom.sh <image-ref> <sbom-file>` — always exits 0; prints `Attached ...` on success, `::warning::...` on failure/missing file.

- [ ] **Step 1: Write the stub `oras` and the failing test**

Create `.github/scripts/tests/stubs/oras`:

```bash
#!/usr/bin/env bash
# Stub oras: succeeds unless STUB_ORAS=fail. Records the call for assertions.
echo "oras $*" >> "${STUB_LOG:-/dev/null}"
if [ "${STUB_ORAS:-ok}" = "fail" ]; then
    echo "stub oras: simulated referrer rejection" >&2
    exit 1
fi
exit 0
```

Create `.github/scripts/tests/run.sh`:

```bash
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
```

- [ ] **Step 2: Make stubs + runner executable and run to verify it fails**

Run:
```bash
chmod +x .github/scripts/tests/stubs/oras .github/scripts/tests/run.sh
.github/scripts/tests/run.sh; echo "exit=$?"
```
Expected: FAIL — `attach-sbom.sh` does not exist yet (`No such file or directory`), `exit=1`.

- [ ] **Step 3: Write `attach-sbom.sh`**

Create `.github/scripts/attach-sbom.sh`:

```bash
#!/usr/bin/env bash
# Attach an SPDX SBOM to a pushed image as an OCI referrer.
# Non-fatal: a registry that rejects referrers must not break publishing.
set -euo pipefail

ref="${1:?usage: attach-sbom.sh <image-ref> <sbom-file>}"
sbom="${2:?usage: attach-sbom.sh <image-ref> <sbom-file>}"

if [ ! -s "$sbom" ]; then
    echo "::warning::SBOM '$sbom' missing or empty; skipping attach for ${ref}"
    exit 0
fi

if oras attach --artifact-type application/spdx+json "$ref" "${sbom}:application/spdx+json"; then
    echo "Attached SBOM ${sbom} to ${ref}"
else
    echo "::warning::Failed to attach SBOM to ${ref} (registry may not support OCI referrers)"
fi
exit 0
```

- [ ] **Step 4: Run the test to verify it passes**

Run:
```bash
chmod +x .github/scripts/attach-sbom.sh
.github/scripts/tests/run.sh; echo "exit=$?"
```
Expected: PASS — all `attach-sbom.sh` assertions `ok`, `ALL TESTS PASSED`, `exit=0`.

- [ ] **Step 5: bash -n both scripts**

Run:
```bash
bash -n .github/scripts/attach-sbom.sh && bash -n .github/scripts/tests/run.sh && echo "SYNTAX OK"
```
Expected: `SYNTAX OK`.

- [ ] **Step 6: Commit**

```bash
git add .github/scripts/attach-sbom.sh .github/scripts/tests/run.sh .github/scripts/tests/stubs/oras
git commit -m "Add non-fatal SBOM attach helper (oras) with stub tests"
```

---

### Task 2: `scan-patch-gate.sh` (per-variant gate with plain-always-publish)

**Files:**
- Create: `.github/scripts/scan-patch-gate.sh`
- Create: `.github/scripts/tests/stubs/{trivy,copa,docker}`
- Modify: `.github/scripts/tests/run.sh` (append the gate scenarios)

**Interfaces:**
- Consumes (env): `IMAGE_NAME`, `ARCH_TAG`, `GATE_SEVERITY`, optional `STATE_DIR` (default `.docker-state`), `SBOM_DIR` (default `sboms`), `REPORT_DIR` (default `trivy-reports`), `BUILDKIT_ADDR` (default `tcp://127.0.0.1:8888`), `GITHUB_STEP_SUMMARY`.
- Consumes (files): `${STATE_DIR}/<variant>/{plain_image,base_tag,version,tag,plain_tags}.txt`.
- Produces on pass: `${STATE_DIR}/<variant>/{hardened_image,hardened_tags,hardened_sbom}.txt`, the hardened SPDX in `${SBOM_DIR}/`, a Trivy report in `${REPORT_DIR}/`. Produces on fail: `${STATE_DIR}/<variant>/gate_failed.txt`; removes any hardened outputs. **Always exits 0** unless a genuine infra error (missing state file) occurs.

- [ ] **Step 1: Write the stubs**

Create `.github/scripts/tests/stubs/trivy`:

```bash
#!/usr/bin/env bash
# Stub trivy. Scenario via env: STUB_FIXABLE=yes|no (initial OS scan),
# STUB_GATE=pass|fail (severity-filtered gate scan). SPDX just writes a minimal doc.
out=""; sev=""; fmt=""
while [ $# -gt 0 ]; do
    case "$1" in
        -o) out="$2"; shift 2;;
        --severity) sev="$2"; shift 2;;
        --format) fmt="$2"; shift 2;;
        *) shift;;
    esac
done
case "$fmt" in
    spdx-json) printf '{"spdxVersion":"SPDX-2.3","packages":[{"name":"libc6","versionInfo":"2.36-1"}]}\n' > "$out"; exit 0;;
    table) echo "stub trivy table report" > "$out"; exit 0;;
esac
# JSON vulnerability scan
if [ -n "$sev" ]; then
    [ "${STUB_GATE:-pass}" = "fail" ] && v='[{"VulnerabilityID":"CVE-GATE"}]' || v='[]'
else
    [ "${STUB_FIXABLE:-yes}" = "no" ] && v='[]' || v='[{"VulnerabilityID":"CVE-FIX"}]'
fi
printf '{"Results":[{"Vulnerabilities":%s}]}\n' "$v" > "$out"
exit 0
```

Create `.github/scripts/tests/stubs/copa`:

```bash
#!/usr/bin/env bash
echo "copa $*" >> "${STUB_LOG:-/dev/null}"
[ "${STUB_COPA:-ok}" = "fail" ] && { echo "stub copa: simulated failure" >&2; exit 1; }
exit 0
```

Create `.github/scripts/tests/stubs/docker`:

```bash
#!/usr/bin/env bash
# Stub docker: 'image inspect' exists-check exits 0; with --format prints a fake id.
if [ "$1 $2" = "image inspect" ]; then
    if printf '%s ' "$@" | grep -q -- '--format'; then echo "sha256:deadbeefcafe0000"; fi
    exit 0
fi
exit 0
```

- [ ] **Step 2: Append gate scenarios to `run.sh`**

Add before the final summary lines (`echo; [ "$fail" = "0" ] ...`) in `.github/scripts/tests/run.sh`:

```bash
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
```

- [ ] **Step 3: Run tests to verify the new scenarios fail**

Run:
```bash
chmod +x .github/scripts/tests/stubs/trivy .github/scripts/tests/stubs/copa .github/scripts/tests/stubs/docker
.github/scripts/tests/run.sh; echo "exit=$?"
```
Expected: FAIL — `scan-patch-gate.sh` not found; scenario A–D assertions FAIL; `exit=1`.

- [ ] **Step 4: Write `scan-patch-gate.sh`**

Create `.github/scripts/scan-patch-gate.sh`:

```bash
#!/usr/bin/env bash
# Per-variant: scan the plain image, patch with Copa (or mirror if nothing fixable),
# gate the hardened image on GATE_SEVERITY, and -- only if it passes -- publish the
# hardened outputs and generate its SPDX SBOM. A gate failure (or scan/patch error)
# writes gate_failed.txt, skips the hardened outputs, and exits 0 so the plain image
# still ships and other variants continue. Genuine infra errors abort (set -e).
set -euo pipefail

variant="${1:?usage: scan-patch-gate.sh <variant>}"
: "${IMAGE_NAME:?}"; : "${ARCH_TAG:?}"; : "${GATE_SEVERITY:?}"
STATE_DIR="${STATE_DIR:-.docker-state}"
SBOM_DIR="${SBOM_DIR:-sboms}"
REPORT_DIR="${REPORT_DIR:-trivy-reports}"
BUILDKIT_ADDR="${BUILDKIT_ADDR:-tcp://127.0.0.1:8888}"
vdir="${STATE_DIR}/${variant}"
mkdir -p "$SBOM_DIR" "$REPORT_DIR"

PLAIN_IMAGE=$(< "${vdir}/plain_image.txt")
BASE_TAG=$(< "${vdir}/base_tag.txt")
VERSION=$(< "${vdir}/version.txt")
TAG=$(< "${vdir}/tag.txt")
HARDENED_IMAGE="${IMAGE_NAME}:${BASE_TAG}-${VERSION}-hardened-${ARCH_TAG}"
report="/tmp/spg-${variant}.json"

fail_gate() { # <reason> -- record + skip hardened, but let plain ship
    echo "::error::${variant}: $1"
    { echo "## Gate failed: ${HARDENED_IMAGE}"; echo ""; echo "$1"; echo ""; } >> "${GITHUB_STEP_SUMMARY:-/dev/null}"
    echo "$1" > "${vdir}/gate_failed.txt"
    rm -f "${vdir}/hardened_image.txt" "${vdir}/hardened_tags.txt" "${vdir}/hardened_sbom.txt"
    rm -f "$report"
    exit 0
}

echo "Scanning plain image ${PLAIN_IMAGE} for OS vulnerabilities"
trivy image --pkg-types os --ignore-unfixed --format json -o "$report" "${PLAIN_IMAGE}" \
    || fail_gate "Trivy scan of plain image failed"

if [ -s "$report" ] && jq -e '.Results[]? | select(.Vulnerabilities != null and (.Vulnerabilities | length > 0))' "$report" > /dev/null 2>&1; then
    copa patch -i "${PLAIN_IMAGE}" -r "$report" -t "${HARDENED_IMAGE}" -a "${BUILDKIT_ADDR}" \
        || fail_gate "Copa patch failed"
    docker image inspect "${HARDENED_IMAGE}" > /dev/null 2>&1 \
        || fail_gate "Hardened image not found after copa patch"
    echo "Successfully patched ${PLAIN_IMAGE} into ${HARDENED_IMAGE}"
else
    echo "No fixable OS vulnerabilities found; hardened image mirrors plain"
    docker tag "${PLAIN_IMAGE}" "${HARDENED_IMAGE}"
fi
rm -f "$report"

if [ "$GATE_SEVERITY" != "NONE" ]; then
    echo "Running post-patch scan (fail on ${GATE_SEVERITY})"
    IMAGE_HASH=$(docker image inspect "${HARDENED_IMAGE}" --format '{{.Id}}' | sed 's/sha256://' | head -c 12)
    REPORT_JSON="${REPORT_DIR}/${TAG}-hardened_${IMAGE_HASH}.json"
    REPORT_TXT="${REPORT_DIR}/${TAG}-hardened_${IMAGE_HASH}.txt"

    trivy image --pkg-types os --ignore-unfixed --severity "$GATE_SEVERITY" \
        --format json -o "${REPORT_JSON}" "${HARDENED_IMAGE}" \
        || fail_gate "Trivy gate scan failed"

    trivy image --pkg-types os --ignore-unfixed --severity "$GATE_SEVERITY" \
        --format table -o "/tmp/spg-${variant}.txt" "${HARDENED_IMAGE}" || true
    cp "/tmp/spg-${variant}.txt" "${REPORT_TXT}" 2>/dev/null || true
    {
        echo "## Trivy Scan: ${HARDENED_IMAGE}"
        echo ""
        echo "### OS Vulnerabilities (${GATE_SEVERITY})"
        echo '```'
        cat "/tmp/spg-${variant}.txt" 2>/dev/null || echo "No results"
        echo '```'
        echo ""
    } >> "${GITHUB_STEP_SUMMARY:-/dev/null}"
    rm -f "/tmp/spg-${variant}.txt"

    if jq -e '.Results[]? | select((.Vulnerabilities // []) | length > 0)' "${REPORT_JSON}" > /dev/null; then
        fail_gate "unfixed ${GATE_SEVERITY} vulnerabilities remain after patching"
    fi
fi

# Gate passed (or disabled): publish hardened tags + SBOM.
while IFS= read -r plain_tag; do
    echo "${plain_tag%-${ARCH_TAG}}-hardened-${ARCH_TAG}"
done < "${vdir}/plain_tags.txt" > "${vdir}/hardened_tags.txt"
echo "${HARDENED_IMAGE}" > "${vdir}/hardened_image.txt"

HARDENED_SBOM="${SBOM_DIR}/${BASE_TAG}-${VERSION}-hardened-${ARCH_TAG}.spdx.json"
trivy image --format spdx-json -o "${HARDENED_SBOM}" "${HARDENED_IMAGE}"
echo "${HARDENED_SBOM}" > "${vdir}/hardened_sbom.txt"
echo "Published hardened outputs for ${variant}"
```

- [ ] **Step 5: Run tests to verify they pass**

Run:
```bash
chmod +x .github/scripts/scan-patch-gate.sh
.github/scripts/tests/run.sh; echo "exit=$?"
```
Expected: PASS — every scenario A–D `ok`, `ALL TESTS PASSED`, `exit=0`.

- [ ] **Step 6: bash -n**

Run:
```bash
bash -n .github/scripts/scan-patch-gate.sh && echo "SYNTAX OK"
```
Expected: `SYNTAX OK`.

- [ ] **Step 7: Commit**

```bash
git add .github/scripts/scan-patch-gate.sh .github/scripts/tests/
git commit -m "Add scan-patch-gate script: plain always ships, hardened gated, per-variant markers + SBOM"
```

---

### Task 3: Wire scripts into `release.yml` — installs, plain SBOM, gate step, fail-fast

**Files:**
- Modify: `.github/workflows/release.yml`

**Interfaces:**
- Consumes: `.github/scripts/scan-patch-gate.sh`, `.github/scripts/attach-sbom.sh` (Task 4 uses attach).
- Produces: plain SBOMs in `sboms/`, `.docker-state/<variant>/plain_sbom.txt`; hardened outputs via the script.

- [ ] **Step 1: Add pinned versions to `env:`**

Modify the top-level `env:` block (after `BUILDKIT_VERSION`):

```yaml
env:
    IMAGE_NAME: pimcore/pimcore
    COPA_VERSION: "0.14.1"
    BUILDKIT_VERSION: "0.30.0"
    ORAS_VERSION: "1.2.0"
    TRIVY_DB_REPOSITORY: "ghcr.io/aquasecurity/trivy-db:2"
```

- [ ] **Step 2: Add `fail-fast: false` to the matrix**

Modify `strategy:` under the `build-php` job:

```yaml
        strategy:
            fail-fast: false
            matrix:
```

- [ ] **Step 3: Split the install step — Trivy + oras unconditional; Copa hardened-only**

Replace the single `Install Copa and Trivy` step (`if: matrix.build.hardened`) with two steps. First, an unconditional install (place it before `Build plain images`):

```yaml
            -   name: Install Trivy and oras
                run: |
                    set -eux
                    sudo apt-get update
                    sudo apt-get install -y wget curl apt-transport-https gnupg lsb-release jq
                    wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null
                    echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb generic main" | sudo tee /etc/apt/sources.list.d/trivy.list
                    sudo apt-get update
                    sudo apt-get install -y trivy

                    ORAS_ARCH="$(dpkg --print-architecture)"
                    curl -fsSL -o oras.tar.gz "https://github.com/oras-project/oras/releases/download/v${ORAS_VERSION}/oras_${ORAS_VERSION}_linux_${ORAS_ARCH}.tar.gz"
                    curl -fsSL -o oras_checksums.txt "https://github.com/oras-project/oras/releases/download/v${ORAS_VERSION}/oras_${ORAS_VERSION}_checksums.txt"
                    EXPECTED_SHA=$(grep -F "oras_${ORAS_VERSION}_linux_${ORAS_ARCH}.tar.gz" oras_checksums.txt | awk '{print $1}')
                    ACTUAL_SHA=$(sha256sum oras.tar.gz | awk '{print $1}')
                    if [ "$EXPECTED_SHA" != "$ACTUAL_SHA" ]; then
                        echo "::error::oras checksum mismatch! Expected ${EXPECTED_SHA}, got ${ACTUAL_SHA}"
                        exit 1
                    fi
                    tar -xzf oras.tar.gz oras
                    sudo mv oras /usr/local/bin/oras
                    rm oras.tar.gz oras_checksums.txt
```

Then a Copa-only step (keep `if: matrix.build.hardened`), containing only the Copa install block from the old step (the Trivy block is now above):

```yaml
            -   name: Install Copa
                if: ${{ matrix.build.hardened }}
                run: |
                    set -eux
                    COPA_ARCH="$(dpkg --print-architecture)"
                    curl -fsSL -o copa.tar.gz "https://github.com/project-copacetic/copacetic/releases/download/v${COPA_VERSION}/copa_${COPA_VERSION}_linux_${COPA_ARCH}.tar.gz"
                    curl -fsSL -o copacetic_checksums.txt "https://github.com/project-copacetic/copacetic/releases/download/v${COPA_VERSION}/copacetic_checksums.txt"
                    EXPECTED_SHA=$(grep -F "copa_${COPA_VERSION}_linux_${COPA_ARCH}.tar.gz" copacetic_checksums.txt | awk '{print $1}')
                    ACTUAL_SHA=$(sha256sum copa.tar.gz | awk '{print $1}')
                    if [ "$EXPECTED_SHA" != "$ACTUAL_SHA" ]; then
                        echo "::error::Copa checksum mismatch! Expected ${EXPECTED_SHA}, got ${ACTUAL_SHA}"
                        exit 1
                    fi
                    tar -xzf copa.tar.gz copa
                    sudo mv copa /usr/local/bin/copa
                    rm copa.tar.gz copacetic_checksums.txt
```

Leave the `Start buildkit daemon` step unchanged (`if: matrix.build.hardened`).

- [ ] **Step 4: Generate the plain SBOM in the `Build plain images` step**

In `.github/workflows/release.yml`, inside the `Build plain images` `run:` loop, immediately after the `docker build --load ... --tag "${PLAIN_IMAGE}" .` command (still inside the `for imageVariant` loop), append:

```bash
                        mkdir -p sboms
                        PLAIN_SBOM="sboms/${TAG}.spdx.json"
                        trivy image --format spdx-json -o "${PLAIN_SBOM}" "${PLAIN_IMAGE}"
                        echo "${PLAIN_SBOM}" > ".docker-state/${imageVariant}/plain_sbom.txt"
```

- [ ] **Step 5: Replace the gate loop body with a call to the script**

In the `Scan, patch, and gate hardened images` step, keep the env block and the inline `GATE_SEVERITY` normalisation (lines defining `SEVERITY_ORDER` … `fi`). Replace the `for imageVariant ... done` loop (everything from `mapfile -t imageVariants` onward) with:

```bash
                    export IMAGE_NAME GATE_SEVERITY ARCH_TAG TRIVY_DB_REPOSITORY
                    export BUILDKIT_ADDR="tcp://127.0.0.1:8888"

                    mapfile -t imageVariants < .docker-state/variants.txt
                    for imageVariant in "${imageVariants[@]}"; do
                        .github/scripts/scan-patch-gate.sh "${imageVariant}"
                    done
```

(`ARCH_TAG` is already in this step's `env:`; `GATE_SEVERITY` is set by the inline normalisation above; `export` makes them visible to the script.)

- [ ] **Step 6: Install actionlint and lint the workflow**

Run:
```bash
ALINT=/tmp/actionlint
curl -fsSL -o /tmp/actionlint.tar.gz https://github.com/rhysd/actionlint/releases/download/v1.7.7/actionlint_1.7.7_linux_amd64.tar.gz
tar -xzf /tmp/actionlint.tar.gz -C /tmp actionlint
"$ALINT" -color .github/workflows/release.yml; echo "actionlint exit=$?"
```
Expected: `actionlint exit=0` (no errors). If shellcheck-style warnings appear inside `run:` blocks, fix them.

- [ ] **Step 7: bash -n the changed run-blocks**

Run:
```bash
for step in "Build plain images" "Scan, patch, and gate hardened images"; do
  START=$(grep -n "name: ${step}" .github/workflows/release.yml | head -1 | cut -d: -f1)
  END=$(awk -v s="$START" 'NR>s && /^            -   name:/{print NR; exit}' .github/workflows/release.yml)
  awk -v s="$START" -v e="$((END-1))" 'NR>=s && NR<=e' .github/workflows/release.yml \
    | sed -E 's/\$\{\{[^}]*\}\}/x/g' | sed -n '/run: |/,$p' | tail -n +2 > /tmp/blk.sh
  bash -n /tmp/blk.sh && echo "OK: ${step}" || echo "SYNTAX FAIL: ${step}"
done
```
Expected: `OK: Build plain images` and `OK: Scan, patch, and gate hardened images`.

- [ ] **Step 8: Commit**

```bash
git add .github/workflows/release.yml
git commit -m "release.yml: unconditional Trivy+oras, plain SBOM, delegate gate to script, fail-fast: false"
```

---

### Task 4: `release.yml` — push-step SBOM attach, deferred fail step, process-tags always()

**Files:**
- Modify: `.github/workflows/release.yml`

**Interfaces:**
- Consumes: `.github/scripts/attach-sbom.sh`; `.docker-state/<variant>/{plain_sbom,hardened_image,hardened_sbom,tag}.txt`; `gate_failed.txt` markers.

- [ ] **Step 1: Attach SBOMs after push in the `Tag, push, and aggregate` step**

In the `Tag, push, and aggregate` step's loop, the block currently reads plain/hardened state. Add reading `TAG` and the SBOM paths at the top of the loop body (next to the existing `PLAIN_IMAGE=$(< ...)`):

```bash
                        TAG=$(< ".docker-state/${imageVariant}/tag.txt")
                        PLAIN_SBOM=$(< ".docker-state/${imageVariant}/plain_sbom.txt")
```

Then, inside the existing `if [[ "$PUSH" == "true" ]]; then` block, after the `printf ... | xargs -P 4 ... docker push` line (and before/after the aggregation loop is fine), add the attach calls:

```bash
                            # Attach the SPDX SBOM to each pushed image (once per digest per registry).
                            .github/scripts/attach-sbom.sh "${PLAIN_IMAGE}" "${PLAIN_SBOM}"
                            .github/scripts/attach-sbom.sh "ghcr.io/pimcore/pimcore:${TAG}" "${PLAIN_SBOM}"
                            if [ -n "${HARDENED_IMAGE}" ] && [ -f ".docker-state/${imageVariant}/hardened_sbom.txt" ]; then
                                HARDENED_SBOM=$(< ".docker-state/${imageVariant}/hardened_sbom.txt")
                                HARDENED_TAG="${HARDENED_IMAGE#${IMAGE_NAME}:}"
                                .github/scripts/attach-sbom.sh "${HARDENED_IMAGE}" "${HARDENED_SBOM}"
                                .github/scripts/attach-sbom.sh "ghcr.io/pimcore/pimcore:${HARDENED_TAG}" "${HARDENED_SBOM}"
                            fi
```

(`HARDENED_IMAGE` is already set earlier in this loop to `""` or the value from `hardened_image.txt`, so a gate-failed variant — which has no `hardened_image.txt` — skips the hardened attach automatically.)

- [ ] **Step 2: Add the deferred "Fail if severity gate failed" step**

Add this step **after** `Upload aggregated tags` (so pushes, report upload, and tag upload all run first), still inside the `build-php` job:

```yaml
            -   name: Fail if severity gate failed
                if: ${{ matrix.build.hardened }}
                run: |
                    if compgen -G '.docker-state/*/gate_failed.txt' > /dev/null; then
                        echo "The following variants failed the severity gate; their -hardened tags were NOT published:"
                        grep -H . .docker-state/*/gate_failed.txt
                        echo "::error::One or more variants failed the severity gate (plain images were published as-is)"
                        exit 1
                    fi
                    echo "All hardened variants passed the severity gate."
```

- [ ] **Step 3: Make `process-tags` run even if a leg failed**

Modify the `process-tags` job condition:

```yaml
    process-tags:
        runs-on: ubuntu-22.04
        needs: build-php
        if: ${{ always() && (github.event_name != 'workflow_dispatch' || inputs.publish) }}
```

- [ ] **Step 4: actionlint**

Run:
```bash
/tmp/actionlint -color .github/workflows/release.yml; echo "actionlint exit=$?"
```
Expected: `actionlint exit=0`.

- [ ] **Step 5: bash -n the push step**

Run:
```bash
START=$(grep -n "name: Tag, push, and aggregate" .github/workflows/release.yml | head -1 | cut -d: -f1)
END=$(awk -v s="$START" 'NR>s && /^            -   name:/{print NR; exit}' .github/workflows/release.yml)
awk -v s="$START" -v e="$((END-1))" 'NR>=s && NR<=e' .github/workflows/release.yml \
  | sed -E 's/\$\{\{[^}]*\}\}/x/g' | sed -n '/run: |/,$p' | tail -n +2 > /tmp/push.sh
bash -n /tmp/push.sh && echo "SYNTAX OK"
```
Expected: `SYNTAX OK`.

- [ ] **Step 6: Commit**

```bash
git add .github/workflows/release.yml
git commit -m "release.yml: attach SBOMs on push, defer gate failure to end, run process-tags on always()"
```

---

### Task 5: Add a fast `scripts` test job to `test.yml`

**Files:**
- Modify: `.github/workflows/test.yml`

- [ ] **Step 1: Add the job**

Add a second job to `.github/workflows/test.yml` (sibling of the existing `test` job):

```yaml
    scripts:
        runs-on: ubuntu-latest
        steps:
            -   uses: actions/checkout@v5
            -   name: Install actionlint
                run: |
                    curl -fsSL -o actionlint.tar.gz https://github.com/rhysd/actionlint/releases/download/v1.7.7/actionlint_1.7.7_linux_amd64.tar.gz
                    tar -xzf actionlint.tar.gz actionlint
                    sudo mv actionlint /usr/local/bin/actionlint
            -   name: Lint workflows
                run: actionlint -color
            -   name: Run script unit tests
                run: .github/scripts/tests/run.sh
```

- [ ] **Step 2: Verify the job's script test passes locally**

Run:
```bash
.github/scripts/tests/run.sh; echo "exit=$?"
```
Expected: `ALL TESTS PASSED`, `exit=0`.

- [ ] **Step 3: actionlint the edited test.yml**

Run:
```bash
/tmp/actionlint -color .github/workflows/test.yml; echo "actionlint exit=$?"
```
Expected: `actionlint exit=0`.

- [ ] **Step 4: Commit**

```bash
git add .github/workflows/test.yml
git commit -m "test.yml: add scripts job running actionlint and script unit tests"
```

---

### Task 6: README — rewrite the "Hardened images" section

**Files:**
- Modify: `README.md`

- [ ] **Step 1: Replace the section**

Replace the current `## Hardened images` section in `README.md` (from the `## Hardened images` heading up to the next `## ` heading) with:

```markdown
## Hardened images
For our stable release tags we publish each image in two flavors so you can choose your trade-off:

- **plain** (default, unsuffixed) – the image exactly as built from the Dockerfile, e.g. `php8.5-debug-v5`. It is published as-is and may carry known OS-level CVEs.
- **hardened** (`-hardened` suffix) – the same image with OS-level CVEs patched in via [Copacetic (Copa)](https://github.com/project-copacetic/copacetic), e.g. `php8.5-debug-v5-hardened`.

**What hardening does:** after the plain image is built, it is scanned with [Trivy](https://github.com/aquasecurity/trivy) and Copa applies the available Debian security updates for OS-level packages as an extra image layer. PHP, its extensions, and all application-level content are identical to the plain image — only OS package versions differ.

**Scope & guarantees:**
- `-hardened` exists for **stable release tags only**; development tags (`-dev`) are published plain-only.
- The plain tag **always publishes**, even when CVEs remain.
- The `-hardened` tag publishes only when the patched image passes the vulnerability gate (`CRITICAL,HIGH` by default). If a fix is not yet available upstream, the gate fails and the `-hardened` tag temporarily stays at its previous version until the plain image can be patched clean — so a `-hardened` tag never regresses to a vulnerable state.

```text
php8.5-debug-v5          # plain image, as built (may contain CVEs)
php8.5-debug-v5-hardened # same image, OS CVEs patched with Copa, gate-clean
```

**SBOMs:** every published image (plain and hardened, per architecture) ships an SPDX SBOM, attached to the image in the registry as an OCI referrer and uploaded as a build artifact.
```

- [ ] **Step 2: Verify the section renders and links are intact**

Run:
```bash
grep -n "## Hardened images" README.md && grep -c "hardened" README.md
```
Expected: the heading is found once; `hardened` appears multiple times. Eyeball the block for correct Markdown (code fences balanced).

- [ ] **Step 3: Commit**

```bash
git add README.md
git commit -m "README: document Copa hardening, plain-always-publish gate semantics, and SBOMs"
```

---

### Task 7: Supersede decision 4 in the 2026-06-15 spec

**Files:**
- Modify: `docs/superpowers/specs/2026-06-15-hardened-image-tag-design.md`

- [ ] **Step 1: Add the supersession note**

Under "## Decisions (confirmed with maintainer)", append to decision 4 (the "Gate ordering = all-or-nothing per variant" item):

```markdown
> **Superseded 2026-07-02** (see `2026-07-02-copa-plain-always-publish-sbom-design.md`):
> the gate no longer blocks plain publishing. Plain images always publish; a hardened
> gate failure skips only that variant's `-hardened` tags and turns the job red at the end.
```

- [ ] **Step 2: Commit**

```bash
git add docs/superpowers/specs/2026-06-15-hardened-image-tag-design.md
git commit -m "spec: mark all-or-nothing gate decision superseded by 2026-07-02 spec"
```

---

## Self-Review

**Spec coverage:**
- Part 1 (gate restructure, markers, plain-always) → Task 2 (script) + Task 4 (deferred fail step) + Task 3 (fail-fast). ✅
- Part 1 resilience (`fail-fast: false`, `process-tags always()`) → Task 3 Step 2, Task 4 Step 3. ✅
- Part 2 (SBOM: Trivy on all legs, plain SBOM, hardened SBOM, oras attach) → Task 3 (installs + plain SBOM), Task 2 (hardened SBOM), Task 1 + Task 4 (attach). ✅
- Part 4 (README) → Task 6. ✅
- Part 5 (spec supersession) → Task 7. ✅
- Testability (stub-driven gate simulation, SBOM attach swallow, actionlint) → Tasks 1, 2, 5. ✅
- Part 3 (package docs job) → **out of scope** for this plan (follow-up PR), per spec. ✅

**Placeholder scan:** none — all steps carry full code/commands.

**Type/name consistency:** state files (`plain_image.txt`, `base_tag.txt`, `version.txt`, `tag.txt`, `plain_tags.txt`, `plain_sbom.txt`, `hardened_image.txt`, `hardened_tags.txt`, `hardened_sbom.txt`, `gate_failed.txt`) are written and read with identical names across Tasks 2–4. `scan-patch-gate.sh` env contract (`IMAGE_NAME`, `ARCH_TAG`, `GATE_SEVERITY`, `BUILDKIT_ADDR`) matches the exports added in Task 3 Step 5. `attach-sbom.sh <ref> <file>` signature matches its calls in Task 4 Step 1.

**Known follow-ups (not blocking):** Part 3 package-docs job; optional cosign signing of SBOMs.

---

### Task 8: Split the publish path so plain ships before the gate (added 2026-07-02)

**Why:** the final review found that the single `Tag, push, and aggregate` step runs
*after* the gate step with the implicit `if: success()`, so an unforeseen non-zero exit of
the gate step would skip publishing the already-built plain images. Decision: make "plain
always ships" ironclad by pushing plain **before** the gate and hardened **after** it.

**Files:**
- Modify: `.github/workflows/release.yml`

**Interfaces:** unchanged — same `.docker-state/<variant>/*.txt` files and
`.github/scripts/attach-sbom.sh`. Scripts are NOT modified; the existing unit tests remain
valid.

- [ ] **Step 1: Add `Push plain images` immediately after `Build plain images` (before `Scan, patch, and gate hardened images`)**

```yaml
            -   name: Push plain images
                env:
                    ARCH_TAG: ${{ contains(matrix.runner, 'arm') && 'arm64' || 'amd64' }}
                    PUSH: ${{ github.event_name != 'workflow_dispatch' || inputs.publish }}
                run: |
                    set -eux

                    mapfile -t imageVariants < .docker-state/variants.txt

                    for imageVariant in "${imageVariants[@]}"; do
                        PLAIN_IMAGE=$(< ".docker-state/${imageVariant}/plain_image.txt")
                        TAG=$(< ".docker-state/${imageVariant}/tag.txt")
                        PLAIN_SBOM=$(< ".docker-state/${imageVariant}/plain_sbom.txt")
                        mapfile -t PLAIN_TAGS < ".docker-state/${imageVariant}/plain_tags.txt"

                        for plain_tag in "${PLAIN_TAGS[@]}"; do
                            if [ "$plain_tag" != "$PLAIN_IMAGE" ]; then
                                docker tag "$PLAIN_IMAGE" "$plain_tag"
                            fi
                        done

                        # Plain ships unconditionally, before the gate ever runs.
                        # Do NOT rmi here: the gate step patches this image into the hardened one.
                        if [[ "$PUSH" == "true" ]]; then
                            printf '%s\n' "${PLAIN_TAGS[@]}" | xargs -P 4 -I {} docker push "{}"

                            .github/scripts/attach-sbom.sh "${PLAIN_IMAGE}" "${PLAIN_SBOM}"
                            .github/scripts/attach-sbom.sh "ghcr.io/pimcore/pimcore:${TAG}" "${PLAIN_SBOM}"

                            for tag in "${PLAIN_TAGS[@]}"; do
                                logical_tag="${tag//-arm64/}"
                                logical_tag="${logical_tag//-amd64/}"
                                echo "$logical_tag" >> aggregated_tags.txt
                            done
                        fi
                    done
```

- [ ] **Step 2: Replace the `Tag, push, and aggregate` step with `Push hardened images` (placed after `Scan, patch, and gate hardened images`)**

Delete the entire existing `Tag, push, and aggregate` step and put this in its place:

```yaml
            -   name: Push hardened images
                if: ${{ matrix.build.hardened }}
                env:
                    ARCH_TAG: ${{ contains(matrix.runner, 'arm') && 'arm64' || 'amd64' }}
                    PUSH: ${{ github.event_name != 'workflow_dispatch' || inputs.publish }}
                run: |
                    set -eux

                    mapfile -t imageVariants < .docker-state/variants.txt

                    for imageVariant in "${imageVariants[@]}"; do
                        # Variants whose gate failed have no hardened_image.txt -> skip (plain already shipped).
                        [ -f ".docker-state/${imageVariant}/hardened_image.txt" ] || continue

                        HARDENED_IMAGE=$(< ".docker-state/${imageVariant}/hardened_image.txt")
                        HARDENED_SBOM=$(< ".docker-state/${imageVariant}/hardened_sbom.txt")
                        mapfile -t HARDENED_TAGS < ".docker-state/${imageVariant}/hardened_tags.txt"

                        for hardened_tag in "${HARDENED_TAGS[@]}"; do
                            if [ "$hardened_tag" != "$HARDENED_IMAGE" ]; then
                                docker tag "$HARDENED_IMAGE" "$hardened_tag"
                            fi
                        done

                        if [[ "$PUSH" == "true" ]]; then
                            printf '%s\n' "${HARDENED_TAGS[@]}" | xargs -P 4 -I {} docker push "{}"

                            HARDENED_TAG="${HARDENED_IMAGE#${IMAGE_NAME}:}"
                            .github/scripts/attach-sbom.sh "${HARDENED_IMAGE}" "${HARDENED_SBOM}"
                            .github/scripts/attach-sbom.sh "ghcr.io/pimcore/pimcore:${HARDENED_TAG}" "${HARDENED_SBOM}"

                            for tag in "${HARDENED_TAGS[@]}"; do
                                logical_tag="${tag//-arm64/}"
                                logical_tag="${logical_tag//-amd64/}"
                                echo "$logical_tag" >> aggregated_tags.txt
                            done
                        fi
                    done
```

- [ ] **Step 3: Add `Clean up images` (after `Push hardened images`, before `Stop buildkit daemon`)**

```yaml
            -   name: Clean up images
                if: ${{ always() }}
                run: |
                    set -u
                    [ -f .docker-state/variants.txt ] || exit 0
                    mapfile -t imageVariants < .docker-state/variants.txt
                    for imageVariant in "${imageVariants[@]}"; do
                        for tf in plain_tags hardened_tags; do
                            f=".docker-state/${imageVariant}/${tf}.txt"
                            [ -f "$f" ] || continue
                            while IFS= read -r t; do docker rmi "$t" 2>/dev/null || true; done < "$f"
                        done
                        for imf in plain_image hardened_image; do
                            f=".docker-state/${imageVariant}/${imf}.txt"
                            [ -f "$f" ] && docker rmi "$(< "$f")" 2>/dev/null || true
                        done
                    done
```

- [ ] **Step 4: Confirm step order and leave the rest untouched**

The `build-php` job step order must now be: `Build plain images` → `Push plain images` →
`Scan, patch, and gate hardened images` → `Push hardened images` → `Clean up images` →
`Stop buildkit daemon` → `Upload trivy reports` → `Upload SBOMs` → `Upload aggregated
tags` → `Fail if severity gate failed`. Do not change any step other than the three
added/replaced here. `process-tags` (with its `always() && github.repository == 'pimcore/docker' && …` guard) is untouched.

- [ ] **Step 5: Lint and syntax-check**

Run:
```bash
ALINT=$(command -v actionlint || echo /tmp/actionlint)
"$ALINT" .github/workflows/release.yml; echo "actionlint exit=$?"
for step in "Push plain images" "Push hardened images" "Clean up images"; do
  START=$(grep -n "name: ${step}" .github/workflows/release.yml | head -1 | cut -d: -f1)
  END=$(awk -v s="$START" 'NR>s && /^            -   name:/{print NR; exit}' .github/workflows/release.yml)
  awk -v s="$START" -v e="$((END-1))" 'NR>=s && NR<=e' .github/workflows/release.yml \
    | sed -E 's/\$\{\{[^}]*\}\}/x/g' | sed -n '/run: |/,$p' | tail -n +2 > /tmp/blk.sh
  bash -n /tmp/blk.sh && echo "OK: ${step}" || echo "SYNTAX FAIL: ${step}"
done
.github/scripts/tests/run.sh >/dev/null 2>&1 && echo "script unit tests still pass" || echo "SCRIPT TESTS FAIL"
```
Expected: `actionlint exit=0`; `OK:` for all three steps; script unit tests still pass (scripts unchanged).

- [ ] **Step 6: Commit**

```bash
git add .github/workflows/release.yml
git commit -m "release.yml: push plain before the gate, hardened after (plain always ships)"
```
