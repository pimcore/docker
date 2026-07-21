# Known-CVEs / patch report — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** On publish, generate and commit `docs/known-cves.md` — per published stable image and arch: plain/hardened digests, CVEs fixed by Copa (old→new version), and residual known CVEs.

**Architecture:** For each `hardened: true` matrix leg the workflow captures push digests, runs a full Trivy JSON scan of the plain and hardened images, and uploads them + a `meta.json` as a `cve-report-data_*` artifact. A new `publish-cve-report` job downloads all of them, runs `generate-cve-report.sh` (pure parse+render, jq), and commits `docs/known-cves.md`.

**Tech Stack:** GitHub Actions, Bash 5, Trivy (JSON), jq, git.

## Global Constraints

- Scope: **hardened (stable) lines only** (`v1.6, v2.3, v3.8, v4.2, v5.2`); dev/`-dev` lines excluded and noted in the report.
- CVE source: `trivy image --format json` — **all severities, OS + library, NO `--ignore-unfixed`** (unfixable CVEs included). Separate from the Copa/gate scans.
- Per-arch (amd64, arm64) reported separately.
- Report is **two flat tables**: `Image digests` (full 64-char `sha256:` digests) and `CVEs` (one row per CVE; a **12-char** short digest pointer — plain for `fixed`, hardened for `residual`; `unpublished` when hardened not pushed).
- Status: `✅ fixed · <old> → <new>` or `⚠️ residual · <no fix | fix X available>`.
- Digests are captured only for images actually pushed (plain needs `PUSH`, hardened needs `PUSH_HARDENED`).
- Registry name verbatim: `pimcore/pimcore`. Every extracted script starts `#!/usr/bin/env bash` + `set -euo pipefail`.
- The report job runs on publish only: `if: ${{ always() && github.repository == 'pimcore/docker' && (github.event_name != 'workflow_dispatch' || inputs.publish) }}`.

## File structure

- `.github/scripts/generate-cve-report.sh` (new) — reads a data dir of `<key>.{meta.json,plain.json,hardened.json}`, prints `known-cves.md` to stdout. Single responsibility: parse + render.
- `.github/scripts/tests/fixtures/cve/` (new) — fixture meta + Trivy JSONs.
- `.github/scripts/tests/run.sh` (modify) — add generate-cve-report assertions.
- `.github/workflows/release.yml` (modify) — digest capture in the two push steps; new `Collect CVE report data` + `Upload CVE report data` steps; new `publish-cve-report` job.
- `README.md` (modify) — add "Known CVEs" section.

---

### Task 1: `generate-cve-report.sh` + tests

**Files:**
- Create: `.github/scripts/generate-cve-report.sh`
- Create: `.github/scripts/tests/fixtures/cve/v5.2-amd64.meta.json`, `.plain.json`, `.hardened.json`; `.../v5.2-debug-amd64.meta.json`, `.plain.json` (no hardened.json = gate-failed/unpublished case)
- Modify: `.github/scripts/tests/run.sh`

**Interfaces:**
- Produces: `generate-cve-report.sh <data-dir> <timestamp>` → Markdown on stdout. Exit 0. Reads `<data-dir>/*.meta.json` (`{image,variant,arch,plain_digest,hardened_digest}`) and, per key, `<key>.plain.json` / `<key>.hardened.json` (Trivy `--format json`). `hardened.json` absent ⇒ that image's CVEs are rendered as `⚠️ unpatched · hardened not produced`.

- [ ] **Step 1: Write the fixtures**

`.github/scripts/tests/fixtures/cve/v5.2-amd64.meta.json`:
```json
{"image":"php8.5-v5.2","variant":"default","arch":"amd64","plain_digest":"sha256:1f3a9c4e2b7d05a8c1e6f4b9d3072a5e8c1b6f0d4a7e2c9b5083f1d6a4c7e2b90","hardened_digest":"sha256:8ad4c17b93e0a5d2f4681c9b0e3a7d5c2b8f1069a4e7c3b05d9f28a1c6e4b0f37"}
```
`.github/scripts/tests/fixtures/cve/v5.2-amd64.plain.json` (a fixable CVE that Copa will remove, plus a residual one that stays):
```json
{"Results":[{"Vulnerabilities":[
{"VulnerabilityID":"CVE-2024-45491","Severity":"HIGH","PkgName":"libexpat1","InstalledVersion":"2.6.2-1","FixedVersion":"2.6.2-2+deb13u1"},
{"VulnerabilityID":"CVE-2025-6020","Severity":"HIGH","PkgName":"libpam0g","InstalledVersion":"1.5.3-7","FixedVersion":""}
]}]}
```
`.github/scripts/tests/fixtures/cve/v5.2-amd64.hardened.json` (the fixable one is gone; the no-fix one remains):
```json
{"Results":[{"Vulnerabilities":[
{"VulnerabilityID":"CVE-2025-6020","Severity":"HIGH","PkgName":"libpam0g","InstalledVersion":"1.5.3-7","FixedVersion":""}
]}]}
```
`.github/scripts/tests/fixtures/cve/v5.2-debug-amd64.meta.json` (hardened not published):
```json
{"image":"php8.5-debug-v5.2","variant":"debug","arch":"amd64","plain_digest":"sha256:44bec0a1d2e3f405162738495a6b7c8d9e0f1a2b3c4d5e6f7081920a3b4c5d6e7","hardened_digest":"unpublished"}
```
`.github/scripts/tests/fixtures/cve/v5.2-debug-amd64.plain.json`:
```json
{"Results":[{"Vulnerabilities":[
{"VulnerabilityID":"CVE-2024-7883","Severity":"MEDIUM","PkgName":"libxml2","InstalledVersion":"2.12.7+dfsg-3","FixedVersion":""}
]}]}
```

- [ ] **Step 2: Append the failing tests to `run.sh`** (before the final summary lines)

```bash
echo "== generate-cve-report.sh =="
CVE_FIX="${ROOT}/.github/scripts/tests/fixtures/cve"
CVE_OUT="$(bash "${ROOT}/.github/scripts/generate-cve-report.sh" "$CVE_FIX" "2026-07-16 02:41 UTC" 2>/tmp/cve-err)"; CVE_RC=$?
assert_eq "$CVE_RC" "0" "generate-cve-report exits 0"
# digests table: full digest for a published image
assert_contains "$CVE_OUT" "sha256:1f3a9c4e2b7d05a8c1e6f4b9d3072a5e8c1b6f0d4a7e2c9b5083f1d6a4c7e2b90" "full plain digest in digests table"
assert_contains "$CVE_OUT" "sha256:8ad4c17b93e0a5d2f4681c9b0e3a7d5c2b8f1069a4e7c3b05d9f28a1c6e4b0f37" "full hardened digest in digests table"
assert_contains "$CVE_OUT" "not published this run" "unpublished hardened shown in digests table"
# fixed row: short PLAIN digest pointer + old->new + fixed status
assert_contains "$CVE_OUT" "| \`1f3a9c4e2b7d\` | CVE-2024-45491 | HIGH | libexpat1 | ✅ fixed · 2.6.2-1 → 2.6.2-2+deb13u1 |" "fixed row rendered with plain short digest and version bump"
# residual row: short HARDENED digest pointer + no fix
assert_contains "$CVE_OUT" "| \`8ad4c17b93e0\` | CVE-2025-6020 | HIGH | libpam0g | ⚠️ residual · no fix |" "residual row rendered with hardened short digest"
# unpublished-hardened image: residual rows use 'unpublished' pointer + unpatched status
# hardened not produced: plain IS still published, so the row points at the PLAIN short digest
assert_contains "$CVE_OUT" "| \`44bec0a1d2e3\` | CVE-2024-7883 | MEDIUM | libxml2 | ⚠️ unpatched · hardened not produced |" "unpublished-hardened variant lists plain CVEs as unpatched (plain digest pointer)"
assert_contains "$CVE_OUT" "Development / rolling tags" "header notes dev exclusion"
```

- [ ] **Step 3: Run to verify it fails**

Run: `.github/scripts/tests/run.sh`
Expected: FAIL — `generate-cve-report.sh: No such file or directory` and the new assertions FAIL.

- [ ] **Step 4: Write `generate-cve-report.sh`**

```bash
#!/usr/bin/env bash
# Render docs/known-cves.md from per-image CVE data collected by the release workflow.
# Usage: generate-cve-report.sh <data-dir> <timestamp>
#   <data-dir>/<key>.meta.json      {image,variant,arch,plain_digest,hardened_digest}
#   <data-dir>/<key>.plain.json     full Trivy JSON of the plain image
#   <data-dir>/<key>.hardened.json  full Trivy JSON of the hardened image (may be absent)
set -euo pipefail

data_dir="${1:?usage: generate-cve-report.sh <data-dir> <timestamp>}"
timestamp="${2:?usage: generate-cve-report.sh <data-dir> <timestamp>}"

short_digest() { case "$1" in sha256:*) printf '%s' "${1#sha256:}" | cut -c1-12 ;; *) printf '%s' "$1" ;; esac; }
sev_rank() { case "$1" in CRITICAL) echo 0;; HIGH) echo 1;; MEDIUM) echo 2;; LOW) echo 3;; *) echo 4;; esac; }

cat <<EOF
# Known CVEs & hardening report

_Generated ${timestamp}._

Per published **stable release image** and architecture: the plain / Copa-hardened digests
and every known CVE with its status. CVE data is a full Trivy scan (all severities,
OS + library packages, unfixable CVEs included). **Development / rolling tags (\`*-dev\`) are
not covered** — they are plain-only and never Copa-patched.

**Status legend:** ✅ \`fixed\` = Copa patched it (old → new version) · ⚠️ \`residual\` = still
present in the hardened image (\`no fix\` = no upstream fix available). The **Image digest**
column in the CVE table is a 12-char pointer — the **plain** digest for \`fixed\` rows, the
**hardened** digest for \`residual\` rows (full digests in the table below).

## Image digests

| Image | Arch | Plain digest | Hardened digest |
|-------|------|--------------|-----------------|
EOF

metas=$(find "$data_dir" -maxdepth 1 -name '*.meta.json' | sort)

for meta in $metas; do
    image=$(jq -r '.image' "$meta"); arch=$(jq -r '.arch' "$meta")
    pd=$(jq -r '.plain_digest' "$meta"); hd=$(jq -r '.hardened_digest' "$meta")
    if [ "$pd" = "unpublished" ]; then pd_disp="_not published this run_"; else pd_disp="\`${pd}\`"; fi
    if [ "$hd" = "unpublished" ]; then hd_disp="_not published this run_"; else hd_disp="\`${hd}\`"; fi
    printf '| `%s` | %s | %s | %s |\n' "$image" "$arch" "$pd_disp" "$hd_disp"
done

cat <<EOF

## CVEs

| Image | Arch | Image digest | CVE | Severity | Package | Status |
|-------|------|--------------|-----|----------|---------|--------|
EOF

for meta in $metas; do
    key=$(basename "$meta" .meta.json)
    image=$(jq -r '.image' "$meta"); arch=$(jq -r '.arch' "$meta")
    pd=$(jq -r '.plain_digest' "$meta"); hd=$(jq -r '.hardened_digest' "$meta")
    plain_json="${data_dir}/${key}.plain.json"; hardened_json="${data_dir}/${key}.hardened.json"
    pd_short=$(short_digest "$pd"); hd_short=$(short_digest "$hd")

    rows=""
    if [ -f "$hardened_json" ]; then
        # residual = every vuln still in the hardened image
        while IFS=$'\t' read -r id sev pkg _installed fixed; do
            [ -z "$id" ] && continue
            if [ -n "$fixed" ]; then fv="fix ${fixed} available"; else fv="no fix"; fi
            rows+="$(sev_rank "$sev")1"$'\t'"| \`${image}\` | ${arch} | \`${hd_short}\` | ${id} | ${sev} | ${pkg} | ⚠️ residual · ${fv} |"$'\n'
        done < <(jq -r '[.Results[]?.Vulnerabilities[]?] | unique_by(.VulnerabilityID+.PkgName) | .[] | [.VulnerabilityID,.Severity,.PkgName,.InstalledVersion,(.FixedVersion//"")] | @tsv' "$hardened_json")
        # fixed = in plain, absent from hardened
        while IFS=$'\t' read -r id sev pkg old new; do
            [ -z "$id" ] && continue
            rows+="$(sev_rank "$sev")0"$'\t'"| \`${image}\` | ${arch} | \`${pd_short}\` | ${id} | ${sev} | ${pkg} | ✅ fixed · ${old} → ${new} |"$'\n'
        done < <(jq -r --slurpfile h "$hardened_json" '([$h[0].Results[]?.Vulnerabilities[]?.VulnerabilityID]|unique) as $hids | [.Results[]?.Vulnerabilities[]?] | map(select([.VulnerabilityID]|inside($hids)|not)) | unique_by(.VulnerabilityID+.PkgName) | .[] | [.VulnerabilityID,.Severity,.PkgName,.InstalledVersion,(.FixedVersion//"?")] | @tsv' "$plain_json")
    else
        # hardened image was not produced (gate failed) — list the plain CVEs as unpatched
        while IFS=$'\t' read -r id sev pkg _installed _fixed; do
            [ -z "$id" ] && continue
            rows+="$(sev_rank "$sev")1"$'\t'"| \`${image}\` | ${arch} | \`${pd_short}\` | ${id} | ${sev} | ${pkg} | ⚠️ unpatched · hardened not produced |"$'\n'
        done < <(jq -r '[.Results[]?.Vulnerabilities[]?] | unique_by(.VulnerabilityID+.PkgName) | .[] | [.VulnerabilityID,.Severity,.PkgName,.InstalledVersion,(.FixedVersion//"")] | @tsv' "$plain_json")
    fi
    # sort this image's rows by severity then fixed-before-residual, drop the sort key
    [ -n "$rows" ] && printf '%s' "$rows" | sort -t$'\t' -k1,1 | cut -f2-
done
```

- [ ] **Step 5: Make executable, run tests to verify pass**

Run: `chmod +x .github/scripts/generate-cve-report.sh && .github/scripts/tests/run.sh`
Expected: PASS — all generate-cve-report assertions `ok`, `ALL TESTS PASSED`.

- [ ] **Step 6: bash -n**

Run: `bash -n .github/scripts/generate-cve-report.sh && echo OK`
Expected: `OK`.

- [ ] **Step 7: Commit**

```bash
git add .github/scripts/generate-cve-report.sh .github/scripts/tests/
git commit -m "Add known-CVEs report generator (fixed/residual, per-arch) with fixture tests"
```

---

### Task 2: Collect CVE data on the hardened legs (`release.yml`)

**Files:**
- Modify: `.github/workflows/release.yml`

**Interfaces:**
- Consumes: `.docker-state/<variant>/{tag,plain_image,base_tag,version,hardened_image}.txt`.
- Produces: per hardened leg, a `cve-report-data_*` artifact of `<TAG>.{meta.json,plain.json,hardened.json}` where `<TAG>` = `${BASE_TAG}-${VERSION}-${ARCH_TAG}`; `meta.image` = `${BASE_TAG}-${VERSION}`.

- [ ] **Step 1: Capture the plain digest after the plain push**

In `Push plain images`, inside `if [[ "$PUSH" == "true" ]]; then`, after the `docker push` xargs line, add:
```bash
                            PLAIN_DIGEST=$(docker inspect --format '{{index .RepoDigests 0}}' "$PLAIN_IMAGE" 2>/dev/null | sed 's/.*@//')
                            echo "${PLAIN_DIGEST:-unpublished}" > ".docker-state/${imageVariant}/plain_digest.txt"
```

- [ ] **Step 2: Capture the hardened digest after the hardened push**

In `Push hardened images`, inside `if [[ "$PUSH_HARDENED" == "true" ]]; then`, after the `docker push` xargs line, add:
```bash
                            HARDENED_DIGEST=$(docker inspect --format '{{index .RepoDigests 0}}' "$HARDENED_IMAGE" 2>/dev/null | sed 's/.*@//')
                            echo "${HARDENED_DIGEST:-unpublished}" > ".docker-state/${imageVariant}/hardened_digest.txt"
```

- [ ] **Step 3: Add the `Collect CVE report data` step** (immediately after `Push hardened images`, before `Clean up images`)

```yaml
            -   name: Collect CVE report data
                if: ${{ matrix.build.hardened }}
                env:
                    ARCH_TAG: ${{ contains(matrix.runner, 'arm') && 'arm64' || 'amd64' }}
                run: |
                    set -euxo pipefail
                    mkdir -p cve-report-data
                    mapfile -t imageVariants < .docker-state/variants.txt
                    for imageVariant in "${imageVariants[@]}"; do
                        TAG=$(< ".docker-state/${imageVariant}/tag.txt")
                        BASE_TAG=$(< ".docker-state/${imageVariant}/base_tag.txt")
                        VERSION=$(< ".docker-state/${imageVariant}/version.txt")
                        PLAIN_IMAGE=$(< ".docker-state/${imageVariant}/plain_image.txt")

                        # Full CVE scan (all severities, OS+library, includes unfixable) of the plain image.
                        trivy image --format json -o "cve-report-data/${TAG}.plain.json" "${PLAIN_IMAGE}"

                        if [ -f ".docker-state/${imageVariant}/hardened_image.txt" ]; then
                            HARDENED_IMAGE=$(< ".docker-state/${imageVariant}/hardened_image.txt")
                            trivy image --format json -o "cve-report-data/${TAG}.hardened.json" "${HARDENED_IMAGE}"
                        fi

                        PLAIN_DIGEST=$(cat ".docker-state/${imageVariant}/plain_digest.txt" 2>/dev/null || echo "unpublished")
                        HARDENED_DIGEST=$(cat ".docker-state/${imageVariant}/hardened_digest.txt" 2>/dev/null || echo "unpublished")
                        jq -n \
                            --arg image "${BASE_TAG}-${VERSION}" \
                            --arg variant "${imageVariant}" \
                            --arg arch "${ARCH_TAG}" \
                            --arg pd "${PLAIN_DIGEST}" \
                            --arg hd "${HARDENED_DIGEST}" \
                            '{image:$image, variant:$variant, arch:$arch, plain_digest:$pd, hardened_digest:$hd}' \
                            > "cve-report-data/${TAG}.meta.json"
                    done
```

- [ ] **Step 4: Add the `Upload CVE report data` artifact step** (after `Upload SBOMs`)

```yaml
            -   name: Upload CVE report data
                if: always()
                uses: actions/upload-artifact@v7
                with:
                    name: cve-report-data_${{ matrix.runner }}_${{ matrix.build.tag }}_${{ matrix.build.php }}_${{ matrix.build.distro }}_${{ matrix.build.version-override }}_${{ matrix.build.latest-tag }}
                    path: cve-report-data/
                    if-no-files-found: ignore
```

- [ ] **Step 5: Lint**

Run:
```bash
ALINT=$(command -v actionlint || echo /tmp/actionlint)
PATH="/tmp:$PATH" "$ALINT" .github/workflows/release.yml && echo "actionlint clean"
```
Expected: clean (install actionlint v1.7.7 + shellcheck locally if missing, as in the sibling plan).

- [ ] **Step 6: Commit**

```bash
git add .github/workflows/release.yml
git commit -m "release.yml: capture push digests and collect per-image CVE report data"
```

---

### Task 3: `publish-cve-report` job (`release.yml`)

**Files:**
- Modify: `.github/workflows/release.yml`

**Interfaces:**
- Consumes: `cve-report-data_*` artifacts (Task 2), `.github/scripts/generate-cve-report.sh` (Task 1).
- Produces: a commit of `docs/known-cves.md` on the workflow's branch.

- [ ] **Step 1: Add the job** (sibling of `process-tags`)

```yaml
    publish-cve-report:
        runs-on: ubuntu-22.04
        needs: build-php
        if: ${{ always() && github.repository == 'pimcore/docker' && (github.event_name != 'workflow_dispatch' || inputs.publish) }}
        permissions:
            contents: write
        steps:
            -   uses: actions/checkout@v5
            -   name: Download CVE report data
                uses: actions/download-artifact@v8
                with:
                    path: cve-artifacts
                    pattern: cve-report-data_*
            -   name: Generate and commit docs/known-cves.md
                run: |
                    set -euo pipefail
                    mkdir -p _cvedata docs
                    # Flatten all per-leg artifact dirs into one (filenames are unique per image+arch).
                    find cve-artifacts -type f \( -name '*.meta.json' -o -name '*.plain.json' -o -name '*.hardened.json' \) \
                        -exec cp -n {} _cvedata/ \;
                    if [ -z "$(find _cvedata -name '*.meta.json' -print -quit)" ]; then
                        echo "No CVE report data this run; leaving docs/known-cves.md unchanged."
                        exit 0
                    fi
                    TS="$(date -u '+%Y-%m-%d %H:%M UTC')"
                    .github/scripts/generate-cve-report.sh _cvedata "$TS" > docs/known-cves.md

                    git config user.name  "github-actions[bot]"
                    git config user.email "41898282+github-actions[bot]@users.noreply.github.com"
                    git add docs/known-cves.md
                    if git diff --cached --quiet; then
                        echo "docs/known-cves.md unchanged."
                        exit 0
                    fi
                    git commit -m "docs: update known-CVEs report [skip ci]"
                    git pull --rebase --autostash origin "${GITHUB_REF_NAME}" || true
                    git push origin "HEAD:${GITHUB_REF_NAME}"
```

- [ ] **Step 2: Lint**

Run: `PATH="/tmp:$PATH" /tmp/actionlint .github/workflows/release.yml && echo clean`
Expected: clean.

- [ ] **Step 3: Commit**

```bash
git add .github/workflows/release.yml
git commit -m "release.yml: add publish-cve-report job committing docs/known-cves.md"
```

---

### Task 4: README "Known CVEs" section

**Files:**
- Modify: `README.md`

- [ ] **Step 1: Add the section** after the `## Hardened images` section (before `## Container registries`)

```markdown
## Known CVEs

For every **published stable release image** we publish a per-architecture CVE and patch
report: [`docs/known-cves.md`](docs/known-cves.md). For each image it lists the plain and
Copa-hardened image digests, the CVEs Copa **fixed** (with the library version bump), and
the **residual** known CVEs still present in the hardened image (including CVEs with no
upstream fix yet). It is regenerated on each publish. Development / rolling (`-dev`) tags are
plain-only and are not covered.
```

- [ ] **Step 2: Verify**

Run: `grep -c "## Known CVEs" README.md`
Expected: `1`.

- [ ] **Step 3: Commit**

```bash
git add README.md
git commit -m "README: add Known CVEs section linking docs/known-cves.md"
```

---

## Self-Review

**Spec coverage:**
- Two flat tables (digests full / CVE short pointer), fixed+residual, per-arch, status format → Task 1 (generator + tests). ✅
- Full scan (all severities, OS+library, no `--ignore-unfixed`) → Task 2 Step 3. ✅
- Digests captured per pushed image; `unpublished` when hardened not pushed → Task 2 Steps 1–2 + generator. ✅
- Stable lines only; dev excluded + noted → `Collect`/`Upload`/`publish-cve-report` are all `matrix.build.hardened` / stable-only; header note in generator + README. ✅
- Separate dedicated job + file → Task 3. ✅
- README section → Task 4. ✅
- `publish-cve-report` condition (always + repo + publish) → Task 3 Step 1. ✅

**Placeholder scan:** none — full code in every step.

**Type/name consistency:** `<key>` = `${BASE_TAG}-${VERSION}-${ARCH_TAG}` (= `tag.txt`) used for `.plain.json`/`.hardened.json`/`.meta.json` in Task 2 and consumed by the generator in Task 1; `meta` fields `image/variant/arch/plain_digest/hardened_digest` written in Task 2 Step 3 match the generator's `jq -r '.image'` etc.; digest state files `plain_digest.txt`/`hardened_digest.txt` written in Task 2 Steps 1–2 and read in Step 3.

**Known follow-ups (non-blocking):** dev-line coverage; optional severity threshold/filter; sharing the bot-commit machinery with the deferred package-docs job.
