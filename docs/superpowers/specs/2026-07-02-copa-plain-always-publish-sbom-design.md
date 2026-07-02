# Design: plain-always-publish gate, SBOM restoration, and hardened package docs

**Date:** 2026-07-02
**Status:** Approved (pending user review)
**Branch:** `image_copa` (PR #247)
**Affected files:** `.github/workflows/release.yml`, `README.md`,
`.github/scripts/generate-package-docs.sh` (new), `docs/hardened-packages/` (new,
CI-generated), `docs/superpowers/specs/2026-06-15-hardened-image-tag-design.md` (decision
4 superseded)

## Problem

Review of the current `image_copa` workflow against the maintainer's requirements found
four gaps:

1. **Gate failure blocks plain publishing.** The post-patch severity gate `exit 1`s inside
   the `Scan, patch, and gate hardened images` step, killing the job before `Tag, push,
   and aggregate` runs. When the hardened image still carries CRITICAL/HIGH CVEs, neither
   plain nor hardened tags publish for that matrix entry — and variants after the failing
   one in the loop are lost too. Requirement: **plain images must always publish as-is,
   even when they contain CVEs.** (This supersedes decision 4 — "all-or-nothing" — of the
   2026-06-15 spec.)
2. **Matrix and manifest fragility.** `strategy.fail-fast` defaults to `true`, so one
   failing leg cancels all in-progress legs. And `process-tags` (`needs: build-php`,
   no `always()`) is skipped entirely if any leg fails — no multi-arch manifests get
   created for *any* line, even ones that passed.
3. **SBOM regression (compliance).** On `5.x`, `docker buildx build --sbom=true --output
   type=image,push=$PUSH` attaches an SPDX SBOM attestation to every pushed image. The
   Copa restructure switched to `docker build --load` (required so Copa can patch the
   local image) and silently dropped SBOM generation. **SBOMs are a legal requirement for
   the published images.** Additionally, Copa-patched images never had SBOMs — Copa does
   not produce or update attestations — so the `-hardened` flavor needs its own SBOM
   regardless.
4. **No package/versions documentation.** Nothing records which libraries each image
   contains, or what the `-hardened` flavor changed versus plain.

Confirmed as already correct (no change): plain images are never patched; every variant
(min/default/max/debug/supervisord) of a `hardened: true` entry gets the full `-hardened`
tag set; the `-hardened` tag is created even when nothing was fixable (mirrors plain).

## Decisions (confirmed with maintainer, 2026-07-02)

1. **Scope stays stable-only.** `-hardened` is produced only for `hardened: true` matrix
   entries (`v1.6`, `v2.3`, `v3.8`, `v4.2`, `v5.1`). Dev/rolling lines stay plain-only.
2. **Gate policy: publish plain, skip hardened, job red.** Plain tags always publish. A
   variant whose hardened image fails the gate (or whose scan/patch errors) does not get
   its `-hardened` tags pushed; other variants continue; the job ends red — after pushes
   and artifact uploads — so maintainers notice.
3. **SBOMs are required by law and Trivy-generated SBOMs satisfy the requirement.**
   Generated for **all** published images (plain for every matrix entry, hardened where
   produced), per architecture.
4. **Package docs are committed MD files** in the repo, derived from the SBOMs.

## Part 1 — Gate restructure (`release.yml`)

### Scan, patch, and gate step

Per variant, replace every hard `exit 1` (gate findings, Copa failure, missing hardened
image, Trivy scan error) with:

- write a marker file `.docker-state/<variant>/gate_failed.txt` containing a one-line
  reason,
- do **not** write `hardened_image.txt` / `hardened_tags.txt` for that variant (the push
  step keys off `hardened_image.txt`),
- emit `::error::` and append the failure to `$GITHUB_STEP_SUMMARY`,
- `continue` to the next variant.

The step itself always exits 0. The existing severity normalisation (`GATE_SEVERITY`)
and Trivy report artifacts are unchanged.

### Tag, push, and aggregate step

Unchanged logic — it already pushes hardened tags only when `hardened_image.txt` exists.
Effect under the new markers: plain always pushes; gate-failed variants' `-hardened` tags
are not pushed and remain at their previously published state in the registries
(documented in README). Aggregation likewise skips absent hardened tags, so `process-tags`
never sees them.

### New final step: `Fail if severity gate failed`

Last step of the job (after `Stop buildkit daemon`, `Upload trivy reports`, `Upload
aggregated tags`):

```sh
if compgen -G '.docker-state/*/gate_failed.txt' > /dev/null; then
    grep -H . .docker-state/*/gate_failed.txt
    echo "::error::One or more variants failed the severity gate; their -hardened tags were not published"
    exit 1
fi
```

Runs only for `hardened: true` entries (`if: ${{ matrix.build.hardened }}`).

### Resilience fixes

- `strategy.fail-fast: false` on the `build-php` matrix.
- `process-tags`: `if: ${{ always() && (github.event_name != 'workflow_dispatch' || inputs.publish) }}`.
  Its existing per-arch existence check (`docker buildx imagetools inspect`, skip with
  message when an arch is missing) already handles asymmetric outcomes — e.g. amd64 passes
  the gate but arm64 fails → no new multi-arch `-hardened` manifest; the previously
  published one stays. The pushed single-arch `-hardened-amd64` tag is harmless and
  overwritten next run.

## Part 2 — SBOM generation and publication

### Generation

- **Trivy is installed on every leg** (split the current install step: Trivy
  unconditional; Copa + BuildKit daemon remain `if: matrix.build.hardened`).
- After building each plain image, and after each hardened image **passes the gate**
  (gate-failed variants get no hardened SBOM — absence is the machine-readable signal the
  docs job keys off):
  `trivy image --format spdx-json -o sboms/<tag>.spdx.json <image>` (SPDX to match what
  the `5.x` buildx attestation emitted). Runs on **both arch legs** — SBOMs are per-arch,
  as buildx attestations were.
- Upload `sboms/` as a per-leg artifact (`sboms_<runner>_<tag>_<php>_...`), `if: always()`.

### Registry attachment (durable, per-image)

After the pushes of a variant complete, attach that image's SBOM as an OCI referrer —
**once per image digest per registry** (all tags of an image share the digest, so one
attach on the primary tag covers them; repeat for the GHCR mirror):

```sh
oras attach --artifact-type application/spdx+json "<primary tag>" "sboms/<tag>.spdx.json"
```

- `oras` installed via pinned release binary with checksum verification (same pattern as
  the Copa install).
- Attachment is **non-fatal** (`|| echo "::warning::..."`): GHCR supports OCI referrers;
  Docker Hub support is newer — a registry rejecting referrers must not break publishing.
  The artifact upload is the guaranteed fallback in that case.
- Referrers bind to digests, so they survive the `imagetools create` manifest merge in
  `process-tags` (per-arch digests remain referenced by the multi-arch manifest).

This restores the `5.x` guarantee (SBOM attached to every pushed image) and extends it to
the `-hardened` flavor, which the buildx attestation could never cover.

## Part 3 — Hardened package docs (committed MD)

### Data flow

1. The **amd64 leg** of each `hardened: true` entry already has, per variant, the plain
   and hardened SPDX SBOMs in `sboms/` (from Part 2). No extra scanning needed.
2. New job **`publish-package-docs`** (after `build-php`; `if: ${{ always() &&
   (github.event_name != 'workflow_dispatch' || inputs.publish) && github.repository ==
   'pimcore/docker' }}`; `permissions: contents: write`):
   - checks out the repository **default branch** (not a matrix ref),
   - downloads the amd64 `sboms_*` artifacts of hardened entries,
   - runs `.github/scripts/generate-package-docs.sh` (jq over SPDX `packages[]`
     name/versionInfo) to write one file per hardened matrix entry:
     `docs/hardened-packages/<line>-php<version>.md` (e.g.
     `docs/hardened-packages/v5.1-php8.5.md`),
   - commits and pushes with the default `GITHUB_TOKEN` (bot pushes do not re-trigger
     workflows); commit message `Update hardened image package docs`; no-op when nothing
     changed; one `git pull --rebase` retry on push rejection.

### Document format (per file)

- Header: generation timestamp (UTC), source image tags + digests, arch note
  ("amd64; arm64 package versions may differ marginally").
- Per variant (min/default/max/debug/supervisord):
  - **"Packages changed by hardening"** table: `package | plain version | hardened
    version` — the Copa delta, empty-state text when hardening changed nothing.
  - Collapsible (`<details>`) **full inventory** table: `package | plain | hardened`,
    one row per package union, `–` when absent from a flavor.
- Gate-failed variants: their hardened SBOM is absent by construction (Part 2), so the
  generator writes those sections from the plain SBOM only, with the note: "hardened tag
  not updated this run (severity gate failed)". Variants with both SBOMs get the full
  diff.

## Part 4 — README update

Rewrite the `## Hardened images` section:

- **What Copa does:** after the plain image is built, it is scanned with Trivy; Copa
  applies the available Debian security fixes for OS-level packages as an additional
  image layer. PHP, extensions, and application-level content are byte-identical to the
  plain image — only OS package versions differ.
- **Scope:** `-hardened` exists for stable release tags only; `-dev` tags are plain-only.
- **Gate semantics:** plain tags always publish. Hardened tags publish only when the
  patched image passes the `fail_on_severity` gate (default `CRITICAL,HIGH`, threshold
  semantics); when the gate fails, the `-hardened` tag temporarily lags behind plain until
  a fix is available upstream.
- **Usage:** pull examples (`php8.5-debug-v5-hardened`), guidance on when to choose each
  flavor.
- **SBOMs & package docs:** every published image has an SPDX SBOM (registry referrer +
  CI artifact); link to `docs/hardened-packages/` for the per-image package inventories
  and hardening deltas.

## Part 5 — Spec supersession

Add a note to `2026-06-15-hardened-image-tag-design.md` under decision 4: superseded by
this spec (plain-always-publish, deferred red). No other edits to the old spec.

## Out of scope (YAGNI)

- No `-hardened` for dev/rolling lines.
- No buildx attestation restoration (`--sbom=true` cannot survive `--load`; re-pushing via
  buildx would risk publishing bytes that differ from the gated image). The Trivy SBOM +
  `oras` referrer replaces it.
- No SBOM signing (cosign) — can be layered on later if compliance requires signatures.
- No package docs for plain-only (dev) lines; their SBOMs exist as artifacts/referrers.
- No change to gate defaults, severity normalisation, or Trivy report artifacts.

## Testing

- **Workflow lint:** `bash -n` on every extracted `run:` block; YAML parse check.
- **Gate logic:** unit-test the marker/continue flow by extracting the loop into a script
  with stubbed `trivy`/`copa`/`docker` (failing variant 2 of 3 → variants 1 and 3 push
  plain+hardened, variant 2 plain only, final step exits 1).
- **Docs generator:** run `.github/scripts/generate-package-docs.sh` against two fixture
  SPDX files (differing versions, added/removed package) and assert the MD output.
- **Live validation:** `workflow_dispatch` with `publish: false` builds, patches, gates,
  and generates SBOMs without pushing; the docs job is skipped (publish-gated), validated
  on the first real publish run.
