# Design: published-image Known-CVEs / patch transparency report

**Date:** 2026-07-16
**Status:** **Parked** — design approved and a full implementation plan written
(`docs/superpowers/plans/2026-07-16-known-cves-report.md`); **not yet implemented**.
Pick up by executing that plan. Builds on the `publish_hardened` / push-digest work.
**Branch:** `image_copa` (PR #247)
**Affected files:** `.github/workflows/release.yml`, `.github/scripts/generate-cve-report.sh`
(new), `.github/scripts/tests/` (new tests), `docs/known-cves.md` (new, CI-generated),
`README.md`

## Problem / goal

When images are published we want a committed, human-readable transparency report of, per
published image: its known CVEs, the plain image digest, the Copa-hardened image digest,
and which library versions Copa patched (old → new). This lets consumers see exactly what
CVEs a published image carries and what hardening changed.

## Decisions (confirmed with maintainer, 2026-07-16)

1. **Scope: hardened (stable) lines only** — `v1.6`, `v2.3`, `v3.8`, `v4.2`, `v5.2` (the
   lines with both a plain and a Copa-hardened flavour). **Dev/rolling lines are excluded**
   for now — they are plain-only, never Copa-patched, and churn every run; their absence is
   stated in the report and README. (Revisit as a follow-up if dev coverage is wanted.)
2. **Per-arch** — amd64 and arm64 are reported separately (distinct digests, CVE sets, and
   patched versions).
3. **CVE set: both fixed and residual** — per image, the CVEs Copa fixed (with library
   old → new versions) *and* the CVEs still present in the published hardened image.
4. **Known-CVE completeness: full scan** — the report's CVE lists come from a dedicated
   `trivy image --format json` scan with **all severities, OS + library packages, and NO
   `--ignore-unfixed`**, so unfixable CVEs (the ones that persist) are shown. This is
   separate from the Copa-input and gate scans, which stay `--pkg-types os --ignore-unfixed`
   for their own purposes.
5. **Separate dedicated job + file, now** — not folded into the deferred package-docs job.

## Data collected (added to the hardened path — stable lines only, bounded)

For each `hardened: true` matrix leg (per arch), per image variant:

- **Full CVE scan** of the plain image and of the hardened image:
  `trivy image --format json -o cve-reports/<tag>.plain.json <plain>` and
  `... <tag>.hardened.json <hardened>` — all severities, OS+library, no `--ignore-unfixed`.
  Added to `scan-patch-gate.sh` (plain scan before patching, hardened scan after the gate).
- **Patched library versions** are derived later from the existing plain-vs-hardened SBOM
  diff (packages whose `versionInfo` changed) — no new scan.
- **Digests** captured immediately after a successful push:
  `docker inspect --format '{{index .RepoDigests 0}}' <ref>` → `plain_digest.txt` /
  `hardened_digest.txt` in `.docker-state/<variant>/`. A digest exists only for an image
  that was actually pushed (plain requires `PUSH`; hardened requires `PUSH_HARDENED`).
- Everything is uploaded as a per-leg `cve-reports_*` artifact (mirroring the
  `trivy-reports_*` / `sboms_*` naming, including `version-override` + `latest-tag` so names
  are unique across the matrix).

## Report generation

New job **`publish-cve-report`** in `release.yml`:

- `needs: build-php`; `if: ${{ always() && github.repository == 'pimcore/docker' &&
  (github.event_name != 'workflow_dispatch' || inputs.publish) }}`; `permissions:
  contents: write`. Single job (single writer) so there are no concurrent-commit races.
- Checks out the **default branch**, downloads the `cve-reports_*`, `sboms_*`, and any
  digest artifacts, runs `.github/scripts/generate-cve-report.sh`, commits `docs/known-cves.md`
  with `GITHUB_TOKEN` (bot commits do not re-trigger workflows), no-op when unchanged, one
  `git pull --rebase` retry on push rejection.

`generate-cve-report.sh` (jq over the Trivy JSON + SPDX SBOMs) produces `docs/known-cves.md`
as **two flat tables** (chosen for scannability over per-image nested sections):

1. **Image digests** table — one row per image × arch:
   `Image | Arch | Plain digest | Hardened digest`. Digests are the **full** 64-char
   `sha256:…` (copy-paste-pullable / verifiable). Hardened digest shows _"not published this
   run"_ when the hardened image was built + gated but not pushed (e.g.
   `publish_hardened=false`).
2. **CVEs** table — one row per (image × arch × CVE):
   `Image | Arch | Image digest | CVE | Severity | Package | Status`.
   - **Image digest** here is a **short 12-char pointer** (the full value lives in table 1):
     the **plain** digest for `fixed` rows (where the CVE was), the **hardened** digest for
     `residual` rows (the published image still carrying it), or `unpublished` when hardened
     wasn't pushed.
   - **Status** merges both CVE classes: `✅ fixed · <old> → <new>` (fixed by Copa; version
     bump from the plain-vs-hardened SBOM diff) or `⚠️ residual · <no fix | will_not_fix |
     fix N.N available>` (still present in the hardened scan).

Header: a generation timestamp (passed in from the workflow, not computed in-script), the
status legend, the plain/hardened digest-column convention, and a note that dev/rolling
(`*-dev`) lines are excluded (plain-only, never Copa-patched).

The rendered layout is validated in `scratchpad/known-cves.example.md` (mockup).

## README

Add a **"Known CVEs"** section linking to `docs/known-cves.md`, explaining: it lists, per
published stable image and architecture, the known CVEs, the plain and hardened digests,
and the libraries Copa patched; it is regenerated on publish; and it covers **stable
release images only** (dev/`-dev` lines are plain-only and not included).

## Interactions / edge cases

- **Publish-gated digests.** The report reflects what was actually published. On
  `publish=true, publish_hardened=false`, the hardened digest is absent (hardened not
  pushed) — the section still shows the computed fixed/residual CVEs and marks the hardened
  digest as not-published. On a non-publish dry-run the job does not run (publish-gated).
- **Copa image source (I4).** The full CVE scans run against the local images (Trivy uses
  the Docker daemon), so they are accurate regardless of the buildkitd/registry question
  that affects Copa itself.
- **CI cost.** Two extra full Trivy scans per stable image variant × arch (~2 × 5 variants
  × 5 lines × 2 arches). Trivy's DB is shared/cached per leg, so each scan is fast; the
  cost is bounded to the stable lines (dev excluded).

## Out of scope (YAGNI)

- Dev/rolling line CVE coverage (documented exclusion; possible follow-up).
- Signing the report or emitting VEX; the SBOM referrer/attestation work is separate.
- Any change to the gate's `--ignore-unfixed` behaviour (the report uses its own full scan).

## Testing

- **Generator:** unit-test `generate-cve-report.sh` against fixture Trivy JSON + SPDX SBOM
  pairs (a fixed CVE, a residual CVE, an unfixable CVE, a patched library) and assert the
  rendered Markdown tables (fixed vs residual partition, old→new versions, digests, the
  "not published this run" hardened case).
- **Workflow:** `actionlint` + `bash -n`; the existing `scripts` job runs the new tests.
- **Live:** a `publish=true` dispatch produces `cve-reports_*` artifacts and the job renders
  and commits `docs/known-cves.md`.
