# Design: `-hardened` tag for Copa-patched images

**Date:** 2026-06-15
**Status:** Approved
**Affected files:** `.github/workflows/release.yml`, `README.md`

## Problem

Today, for every matrix build marked `imagePatch: true` (the stable releases:
`v1.6`, `v2.3`, `v3.8`, `v4.2`, `v5.1`), the release workflow scans the freshly
built image with Trivy, patches OS-level CVEs with Copa, and then **replaces the
plain image in place** under the same tags (`release.yml` lines ~191–219). The
patched image is retagged as the original tag, the original is deleted, and all
downstream tags point at the patched bytes.

Consequence: users have no way to pull the un-patched ("plain") image for those
releases — Copa hardening is mandatory and invisible. We want users to choose:

- `php8.5-debug-v5` — the plain image, exactly as built from the Dockerfile.
- `php8.5-debug-v5-hardened` — the Copa-patched ("hardened") image.

## Decisions (confirmed with maintainer)

1. **Default tag = plain.** The unsuffixed tag (`php8.5-debug-v5`) is the
   un-patched image. The hardened image gets a `-hardened` suffix. Existing
   pullers of the unsuffixed tag will receive the plain image going forward
   (they lose the implicit auto-patching they get today).
2. **Scope = only `hardened: true` builds.** Dev/rolling tags (`1.x`, `2.x`,
   `3.x`, `4.x`, `5.x`, and all `*-dev` overrides) remain plain-only, exactly as
   today. No `-hardened` variant is produced for them.
3. **Severity gate applies to the hardened image only.** The plain image is
   published as-is and may carry known CVEs; only the hardened image must pass
   the `fail_on_severity` gate (`CRITICAL,HIGH` by default).
4. **Gate ordering = all-or-nothing per variant.** The hardened gate runs
   *before any push*. If the hardened image cannot pass the gate, neither the
   plain nor the hardened tags are published for that image variant — preserving
   the current "failed gate = nothing ships" contract.

> **Superseded 2026-07-02** (see `2026-07-02-copa-plain-always-publish-sbom-design.md`):
> the gate no longer blocks plain publishing. Plain images always publish; a hardened
> gate failure skips only that variant's `-hardened` tags and turns the job red at the end.

## Tag scheme

The `-hardened` marker is inserted **before** the internal `-amd64` / `-arm64`
architecture suffix. This lets the existing `process-tags` job (which strips the
arch suffix and creates a multi-arch manifest) produce `…-hardened` manifests
with no changes to that job.

For a `hardened: true` build, both tag sets are produced and pushed:

| Tag role        | Plain (default, unchanged) | Hardened (new)                        |
|-----------------|----------------------------|---------------------------------------|
| primary         | `php8.5-debug-v5`          | `php8.5-debug-v5-hardened`            |
| detailed (PHP)  | `php8.5.3-debug-v5`        | `php8.5.3-debug-v5-hardened`         |
| latest          | `php8.5-debug-latest`      | `php8.5-debug-latest-hardened`       |
| major           | `php8.5-debug-v5`*         | `php8.5-debug-v5-hardened`*          |

(*) major tag only when `version-override` is empty and version matches `vN.N`,
per existing logic. Internally every tag above carries an `-amd64`/`-arm64`
suffix that the manifest job merges away.

For `hardened: false` builds: only the plain set is produced (unchanged).

## Build flow (per image variant, inside the existing loop)

1. **Build plain image** as today (`docker build --load … --target …`), tagged
   as the plain primary `${IMAGE_NAME}:${TAG}`. **Remove the current in-place
   patch-and-replace logic** so the plain tag keeps the un-patched bytes.
2. **Construct the plain tag list** exactly as today (primary, detailed, GHCR
   mirrors, `-latest` when `latest-tag: true`, major when applicable).
3. **If `hardened: true`** — derive the hardened image *from the plain build*
   (no second `docker build`):
   - Run Trivy (`--pkg-types os --ignore-unfixed`) against the plain image.
   - If fixable OS vulnerabilities exist, run `copa patch` to produce the
     hardened image and tag it as the hardened primary.
   - If no fixable OS vulnerabilities exist, `docker tag` the plain image as the
     hardened primary (same content) so the `-hardened` tag always exists for
     these builds.
   - Construct the hardened tag list = the plain tag list with `-hardened`
     inserted before the arch suffix.
4. **Severity gate** runs on the hardened image only (when `hardened: true`
   and `fail_on_severity != NONE`), *before any push*. On failure the step
   aborts (`set -e`), so nothing ships for the variant. Trivy reports and the
   GitHub step-summary continue to be produced from the hardened image.
5. **Apply tags** — plain tags to the plain image, hardened tags to the hardened
   image.
6. **Push** (when `PUSH == true`) both tag sets.
7. **Aggregate** both plain and hardened logical tags (arch suffix stripped) into
   `aggregated_tags.txt` for the `process-tags` manifest job.
8. **Cleanup** both images to reclaim disk, as today.

## Unchanged components

- **`process-tags` job** — no changes. It dedups aggregated tags and creates a
  multi-arch manifest per logical tag; hardened logical tags flow through the
  same arch-stripping path automatically.
- **`test.yml`** — builds and scans images locally without publishing or tagging
  hardened variants; no changes.
- **Dockerfile** — no changes; hardening is a post-build Copa step, not a build
  target.

## Documentation

Add a short **"Hardened images"** section to `README.md` that:
- Explains the two tag flavors: unsuffixed = plain (built from the Dockerfile),
  `-hardened` = Copa-patched for OS-level CVEs.
- States that `-hardened` is available only for stable release tags.
- Gives guidance on when to pick each (e.g. hardened for production /
  vulnerability-scanned environments; plain for reproducibility or when you run
  your own patching pipeline).

## Out of scope (YAGNI)

- No `-hardened` variant for dev/rolling images.
- No new workflow input to toggle hardened production; it follows the existing
  `hardened` matrix flag.
- No changes to the gate's default severities or report formats.
