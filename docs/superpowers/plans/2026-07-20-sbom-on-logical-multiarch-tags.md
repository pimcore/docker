# SBOM Referrers on Logical Multi-Arch Tags — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax.

**Goal:** Make the SBOM discoverable via `oras discover` on the logical multi-arch tags users pull (`php8.5-v5.2`, `-latest`, major, detailed), not only on the `…-amd64`/`…-arm64` child tags.

**Architecture:** Carry each image's per-arch SBOM path alongside its tag through `aggregated_tags.txt`; extract the `process-tags` merge loop into a testable script that, after creating each logical manifest, attaches both per-arch SBOMs to it as best-effort OCI referrers. Extract the oras install so `process-tags` can reuse it.

**Tech Stack:** GitHub Actions, Docker buildx imagetools, oras, bash, actionlint + shellcheck, stub-based bash unit tests.

## Global Constraints

- **SBOM attach stays best-effort / non-fatal.** A rejected referrer must never fail a job; the uploaded workflow artifact remains the authoritative SBOM copy. (`attach-sbom.sh` already behaves this way — do not change it.)
- **Two per-arch SBOM referrers per logical tag** (amd64 + arm64), not one merged SBOM.
- **All logical aliases covered** (`-latest`, major, detailed) — the SBOM path travels with every per-arch tag.
- **Behavior-preserving extraction:** Task 1 must not change what the workflow does; only where the code lives.
- **oras install reused, not duplicated:** the checksum-verified install logic lives in one script, called from both jobs. `ORAS_VERSION` env is the single source of the pinned version.
- Changed shell/workflow must pass `actionlint` + `shellcheck` (CI's "Lint workflows" + "Run script unit tests").

---

### Task 1: Extract oras install and the process-tags merge loop into scripts (behavior-preserving)

**Files:**
- Create: `.github/scripts/install-oras.sh`
- Create: `.github/scripts/merge-manifests.sh`
- Modify: `.github/workflows/release.yml` (build-php "Install Trivy and oras" step; process-tags job — add `_ci` checkout + call script)
- Test: `.github/scripts/tests/run.sh` (+ `.github/scripts/tests/stubs/docker` if not already present)

**Interfaces:**
- Produces: `install-oras.sh` (reads `ORAS_VERSION` from env, installs oras to `/usr/local/bin`). `merge-manifests.sh` (reads `AGG_FILE`, default `all_aggregated_tags.txt`; lines are bare per-arch tags; creates a logical manifest when both arches present; exits non-zero if any `imagetools create` failed).

- [ ] **Step 1: Create `install-oras.sh` from the existing build-php oras logic**

Move the oras portion of the current "Install Trivy and oras" step ([release.yml:127-144](.github/workflows/release.yml#L127-L144)) verbatim into a script:

```bash
#!/usr/bin/env bash
# Install oras (checksum-verified) to /usr/local/bin. Version from ORAS_VERSION.
set -euxo pipefail
: "${ORAS_VERSION:?ORAS_VERSION must be set}"
ORAS_ARCH="$(dpkg --print-architecture)"
curl -fsSL -o oras.tar.gz "https://github.com/oras-project/oras/releases/download/v${ORAS_VERSION}/oras_${ORAS_VERSION}_linux_${ORAS_ARCH}.tar.gz"
curl -fsSL -o oras_checksums.txt "https://github.com/oras-project/oras/releases/download/v${ORAS_VERSION}/oras_${ORAS_VERSION}_checksums.txt"
# Match the filename exactly ($2 == f): a substring match can also hit
# a sibling entry like *.tar.gz.sbom.json and return two hashes.
EXPECTED_SHA=$(awk -v f="oras_${ORAS_VERSION}_linux_${ORAS_ARCH}.tar.gz" '$2 == f {print $1}' oras_checksums.txt)
ACTUAL_SHA=$(sha256sum oras.tar.gz | awk '{print $1}')
if [ -z "$EXPECTED_SHA" ]; then
    echo "::error::No oras checksum entry for oras_${ORAS_VERSION}_linux_${ORAS_ARCH}.tar.gz"
    exit 1
fi
if [ "$EXPECTED_SHA" != "$ACTUAL_SHA" ]; then
    echo "::error::oras checksum mismatch! Expected ${EXPECTED_SHA}, got ${ACTUAL_SHA}"
    exit 1
fi
tar -xzf oras.tar.gz oras
sudo mv oras /usr/local/bin/oras
rm oras.tar.gz oras_checksums.txt
```

`chmod +x .github/scripts/install-oras.sh`.

- [ ] **Step 2: Point build-php at the script**

In the "Install Trivy and oras" step, replace the inlined oras block (lines 127-144) with a call, keeping the trivy install above it unchanged:

```yaml
                    # (trivy install lines above stay unchanged)
                    ORAS_VERSION="${ORAS_VERSION}" _ci/.github/scripts/install-oras.sh
```

(Confirm `_ci/.github/scripts` is already checked out in build-php — it is, via the "Check out CI scripts" step.)

- [ ] **Step 3: Create `merge-manifests.sh` as an exact move of the process-tags loop**

```bash
#!/usr/bin/env bash
# Merge per-arch tags pushed THIS run into logical multi-arch manifests.
# Reads AGG_FILE (default all_aggregated_tags.txt), one per-arch tag per line.
set -uo pipefail
AGG_FILE="${AGG_FILE:-all_aggregated_tags.txt}"

declare -A HAS_AMD64 HAS_ARM64 LOGICAL
while IFS= read -r t; do
    [ -z "$t" ] && continue
    case "$t" in
        *-amd64) lt="${t%-amd64}"; HAS_AMD64["$lt"]=1; LOGICAL["$lt"]=1 ;;
        *-arm64) lt="${t%-arm64}"; HAS_ARM64["$lt"]=1; LOGICAL["$lt"]=1 ;;
        *) echo "Skipping tag without arch suffix: $t" ;;
    esac
done < "$AGG_FILE"

failed=0
for lt in "${!LOGICAL[@]}"; do
    if [ -n "${HAS_AMD64[$lt]:-}" ] && [ -n "${HAS_ARM64[$lt]:-}" ]; then
        echo "Creating multi-arch manifest: $lt"
        if ! docker buildx imagetools create --tag "$lt" "${lt}-amd64" "${lt}-arm64"; then
            echo "::error::Failed to create multi-arch manifest for $lt"
            failed=1
        fi
    else
        echo "Skipping $lt: only one arch pushed this run (amd64=${HAS_AMD64[$lt]:-0} arm64=${HAS_ARM64[$lt]:-0}); previous manifest left unchanged"
    fi
done

if [ "$failed" -ne 0 ]; then
    echo "::error::One or more multi-arch manifests failed to publish"
    exit 1
fi
exit 0
```

`chmod +x`. This is the current inline logic verbatim.

- [ ] **Step 4: Rewire the process-tags job to check out scripts and call merge-manifests.sh**

In the `process-tags` job, add a CI-scripts checkout as the first step (mirroring build-php), and replace the inline merge loop in "Process tags" ([release.yml:420-461](.github/workflows/release.yml#L420-L461)) with the `cat` + script call:

```yaml
            -   name: Check out CI scripts from the workflow ref
                uses: actions/checkout@v5
                with:
                    path: _ci
                    sparse-checkout: .github/scripts
                    sparse-checkout-cone-mode: false
```
(place it before "Set up Docker Buildx")

And the "Process tags" run body becomes:
```bash
                    set -uo pipefail
                    find artifacts -type f -name "aggregated_tags.txt" -exec cat {} + > all_aggregated_tags.txt
                    _ci/.github/scripts/merge-manifests.sh
```

- [ ] **Step 5: Add a `docker` stub (if absent) and merge-manifests tests**

Check `.github/scripts/tests/stubs/` for a `docker` stub. If none handles `buildx imagetools create`, add/extend one that logs and honors a failure knob:

```bash
#!/usr/bin/env bash
echo "docker $*" >> "${STUB_LOG:-/dev/null}"
# imagetools create failure knob: STUB_IMAGETOOLS=fail
if [ "${1:-}" = "buildx" ] && [ "${2:-}" = "imagetools" ] && [ "${3:-}" = "create" ]; then
    [ "${STUB_IMAGETOOLS:-ok}" = "fail" ] && { echo "stub docker: imagetools create failed" >&2; exit 1; }
    exit 0
fi
exit 0
```
(If a `docker` stub already exists for the scan-patch-gate tests, extend it with the `imagetools create` branch rather than replacing it — preserve its existing `rmi`/`image inspect`/`tag` behavior.)

Add merge-manifests scenarios to `run.sh`:

```bash
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
```

- [ ] **Step 6: Run tests, actionlint, shellcheck**

Run:
```bash
.github/scripts/tests/run.sh
actionlint .github/workflows/release.yml
shellcheck .github/scripts/install-oras.sh .github/scripts/merge-manifests.sh
```
Expected: all tests pass; actionlint clean; shellcheck clean on the two new scripts. Mutation-check the "both-arch merged" and "create failure → non-zero" assertions (temporarily break each, confirm the test fails, restore).

- [ ] **Step 7: Commit**

```bash
git add .github/scripts/install-oras.sh .github/scripts/merge-manifests.sh .github/scripts/tests/ .github/workflows/release.yml
git commit -m "release: extract oras install + process-tags merge into tested scripts (no behavior change)"
```

---

### Task 2: Attach per-arch SBOMs to the logical tags

**Files:**
- Modify: `.github/workflows/release.yml` (plain + hardened aggregation; process-tags: install oras, download SBOMs)
- Modify: `.github/scripts/merge-manifests.sh` (parse `tag<TAB>sbom`, attach after create)
- Modify: `.github/scripts/tests/run.sh`
- Modify: `README.md`

**Interfaces:**
- Consumes: `merge-manifests.sh` from Task 1; `attach-sbom.sh` (existing: `attach-sbom.sh <image-ref> <sbom-file>`, best-effort).
- Produces: `aggregated_tags.txt` lines are now `<per-arch-tag><TAB><sbom-relpath>`.

- [ ] **Step 1: Write the failing test — attach invoked twice per logical tag**

Extend the merge-manifests scenario in `run.sh` so the agg file has the `tag<TAB>sbom` format and assert `attach-sbom` runs for the logical tag with both SBOMs. Because `merge-manifests.sh` calls the real `attach-sbom.sh`, which calls `oras`, assert against the `oras` stub log (an `oras` stub already exists for the attach-sbom tests):

```bash
# Task 2: tag<TAB>sbom format -> attach both per-arch SBOMs to the logical tag
wS="$(mktemp -d)"; tmpdirs+=("$wS"); mkdir -p "$wS/sboms"
: > "$wS/sboms/php8.5-v5.2-amd64.spdx.json"
: > "$wS/sboms/php8.5-v5.2-arm64.spdx.json"
printf '%s\t%s\n' \
    "pimcore/pimcore:php8.5-v5.2-amd64" "sboms/php8.5-v5.2-amd64.spdx.json" \
    "pimcore/pimcore:php8.5-v5.2-arm64" "sboms/php8.5-v5.2-arm64.spdx.json" > "$wS/agg.txt"
logS="$wS/stub.log"
outS="$( cd "$wS" && AGG_FILE="$wS/agg.txt" STUB_LOG="$logS" STUB_ORAS=ok "${ROOT}/.github/scripts/merge-manifests.sh" )"; rcS=$?
[ "$rcS" = 0 ] && echo "  ok: S exit 0" || { echo "  FAIL: S exit $rcS"; fail=1; }
oras_attaches="$(grep -c 'attach' "$logS" 2>/dev/null || echo 0)"
[ "$oras_attaches" = "2" ] && echo "  ok: S two SBOM referrers attached to logical tag" || { echo "  FAIL: S expected 2 attach calls, got $oras_attaches"; fail=1; }
assert_contains "$(cat "$logS")" "pimcore/pimcore:php8.5-v5.2" "S attach targeted the logical tag"
```

Run `.github/scripts/tests/run.sh` → expect FAIL (Task 1's script parses bare tags, ignores the sbom field, and does not attach). Capture the RED.

- [ ] **Step 2: Update `merge-manifests.sh` to parse the sbom field and attach**

```bash
#!/usr/bin/env bash
# Merge per-arch tags pushed THIS run into logical multi-arch manifests, and attach each
# image's per-arch SBOMs to the logical tag as best-effort OCI referrers.
# AGG_FILE lines: "<per-arch-tag>\t<sbom-relpath>".
set -uo pipefail
AGG_FILE="${AGG_FILE:-all_aggregated_tags.txt}"
HERE="$(cd "$(dirname "$0")" && pwd)"

declare -A HAS_AMD64 HAS_ARM64 LOGICAL SBOM_AMD64 SBOM_ARM64
while IFS=$'\t' read -r t sbom; do
    [ -z "$t" ] && continue
    case "$t" in
        *-amd64) lt="${t%-amd64}"; HAS_AMD64["$lt"]=1; LOGICAL["$lt"]=1; SBOM_AMD64["$lt"]="$sbom" ;;
        *-arm64) lt="${t%-arm64}"; HAS_ARM64["$lt"]=1; LOGICAL["$lt"]=1; SBOM_ARM64["$lt"]="$sbom" ;;
        *) echo "Skipping tag without arch suffix: $t" ;;
    esac
done < "$AGG_FILE"

failed=0
for lt in "${!LOGICAL[@]}"; do
    if [ -n "${HAS_AMD64[$lt]:-}" ] && [ -n "${HAS_ARM64[$lt]:-}" ]; then
        echo "Creating multi-arch manifest: $lt"
        if ! docker buildx imagetools create --tag "$lt" "${lt}-amd64" "${lt}-arm64"; then
            echo "::error::Failed to create multi-arch manifest for $lt"
            failed=1
            continue
        fi
        # Attach each per-arch SBOM to the logical (index) tag so `oras discover <logical-tag>`
        # finds it. Best-effort: attach-sbom.sh never fails the job.
        for sb in "${SBOM_AMD64[$lt]:-}" "${SBOM_ARM64[$lt]:-}"; do
            if [ -n "$sb" ] && [ -f "$sb" ]; then
                "$HERE/attach-sbom.sh" "$lt" "$sb"
            else
                echo "No SBOM file for $lt referrer (path: '${sb:-}') -- skipping (artifact copy still uploaded)"
            fi
        done
    else
        echo "Skipping $lt: only one arch pushed this run (amd64=${HAS_AMD64[$lt]:-0} arm64=${HAS_ARM64[$lt]:-0}); previous manifest left unchanged"
    fi
done

if [ "$failed" -ne 0 ]; then
    echo "::error::One or more multi-arch manifests failed to publish"
    exit 1
fi
exit 0
```

Run the tests → expect PASS (both prior scenarios still green — bare-tag lines now parse as `t` with empty `sbom`, which is skipped safely; and the new S scenario attaches twice). **Note:** Task 1's Scenario M uses bare tags with no tab — confirm they still merge (the `IFS=$'\t' read -r t sbom` reads the whole line into `t` when there's no tab, so `t` keeps the tag and `sbom` is empty → attach skipped, merge still happens). Verify M stays green; if not, adjust M to the tab format.

- [ ] **Step 3: Change build-php aggregation to write `tag<TAB>sbom`**

Plain push — replace [release.yml:249](.github/workflows/release.yml#L249):
```bash
                            for t in "${PLAIN_TAGS[@]}"; do
                                printf '%s\t%s\n' "$t" "${PLAIN_SBOM}"
                            done >> aggregated_tags.txt
```
(`PLAIN_SBOM` is already read at line 230.)

Hardened push — replace [release.yml:341](.github/workflows/release.yml#L341):
```bash
                            for t in "${HARDENED_TAGS[@]}"; do
                                printf '%s\t%s\n' "$t" "${HARDENED_SBOM}"
                            done >> aggregated_tags.txt
```
(`HARDENED_SBOM` is already read at line 323.)

- [ ] **Step 4: Wire process-tags to install oras and download the SBOMs**

In the `process-tags` job, after the CI-scripts checkout (Task 1) and Buildx setup, add:
```yaml
            -   name: Install oras
                run: ORAS_VERSION="${ORAS_VERSION}" _ci/.github/scripts/install-oras.sh
```
And add a SBOM download step before "Process tags":
```yaml
            -   name: Download SBOMs
                uses: actions/download-artifact@v8
                with:
                    path: sboms
                    pattern: sboms_*
                    merge-multiple: true
```
`ORAS_VERSION` is a top-level `env:` value, available to the job.

- [ ] **Step 5: Verify the downloaded SBOM layout matches the recorded relpath**

The recorded relpath is `sboms/<name>.spdx.json`. The "Upload SBOMs" step uses `path: sboms/`, so the artifact stores files at its root (`<name>.spdx.json`); `download-artifact` with `merge-multiple: true` + `path: sboms` places them at `sboms/<name>.spdx.json` — matching. Confirm by reading the current "Upload SBOMs" step ([release.yml:372-377](.github/workflows/release.yml#L372)). If the upload path nests differently, make the download path consistent so `sboms/<name>.spdx.json` resolves in the process-tags workdir. Document the confirmed layout in the task report.

- [ ] **Step 6: Update README**

Change the SBOM sentence (~[README.md:55](README.md#L55)) so the discovery claim is accurate for the logical tags, e.g.:
> **SBOMs:** every published image (plain and hardened, per architecture) ships an SPDX SBOM. It is always uploaded as a build artifact, and — where the registry supports OCI referrers — attached to the published image so it is discoverable with `oras discover` on the tag you pull (the multi-arch tag carries a referrer per architecture).

Match the surrounding README voice.

- [ ] **Step 7: Run tests, actionlint, shellcheck; mutation-check**

```bash
.github/scripts/tests/run.sh
actionlint .github/workflows/release.yml
shellcheck .github/scripts/merge-manifests.sh
```
All green/clean. Mutation-check the S scenario: temporarily make `merge-manifests.sh` attach only one SBOM (or none), confirm S fails (expects 2), restore.

- [ ] **Step 8: Commit**

```bash
git add .github/workflows/release.yml .github/scripts/merge-manifests.sh .github/scripts/tests/ README.md
git commit -m "release: attach per-arch SBOMs to logical multi-arch tags (oras discover now works on the tags users pull)"
```

---

## Validation (live, user-gated)

On a `publish: true` dispatch (or after merge), run `oras discover pimcore/pimcore:php8.5-v5.2`
and confirm two `application/spdx+json` referrers appear; repeat for a `-latest` alias.

## Self-Review

- **Spec coverage:** aggregation tag+sbom (T2 S3) ✓; extract merge (T1 S3) ✓; extract oras (T1 S1-2) ✓; attach per-arch SBOMs to logical tags (T2 S2) ✓; process-tags checkout+oras+download (T1 S4, T2 S4) ✓; best-effort retained (T2 S2, `attach-sbom.sh` untouched) ✓; README (T2 S6) ✓; tests incl. both-arches/one-arch/create-failure/attach-twice (T1 S5, T2 S1) ✓.
- **Placeholder scan:** none — full code in each step.
- **Type/name consistency:** `AGG_FILE`, `SBOM_AMD64/ARM64`, `HAS_AMD64/ARM64`, `LOGICAL`, `ORAS_VERSION`, `PLAIN_SBOM`, `HARDENED_SBOM`, `attach-sbom.sh <ref> <file>` consistent across tasks and the current files.
