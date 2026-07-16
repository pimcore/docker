# Design: plain-always-publish gate, SBOM restoration, and hardened package docs

**Date:** 2026-07-02
**Status:** Approved (pending user review)
**Branch:** `image_copa` (PR #247)
**Affected files:** `.github/workflows/release.yml`, `README.md`,
`.github/scripts/scan-patch-gate.sh` (new), `.github/scripts/attach-sbom.sh` (new),
`.github/scripts/tests/` (new, stub-driven tests),
`.github/scripts/generate-package-docs.sh` (new, follow-up PR),
`docs/hardened-packages/` (new, CI-generated, follow-up PR),
`docs/superpowers/specs/2026-06-15-hardened-image-tag-design.md` (decision 4 superseded)

**Implementation note:** the per-variant scan/patch/gate loop (Part 1) and the `oras`
attach (Part 2) are extracted into small scripts under `.github/scripts/` so the workflow
steps stay thin and the behavior is unit-testable with stubbed `trivy`/`copa`/`docker`/
`oras` on `PATH`. Severity normalisation stays inline in the step (it runs once, before
the loop).

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
   entries (`v1.6`, `v2.3`, `v3.8`, `v4.2`, `v5.2`). Dev/rolling lines stay plain-only.
2. **Gate policy: publish plain, skip hardened, job red.** Plain tags always publish. A
   variant whose hardened image fails the gate (or whose scan/patch errors) does not get
   its `-hardened` tags pushed; other variants continue; the job ends red — after pushes
   and artifact uploads — so maintainers notice.
3. **SBOMs are required by law and Trivy-generated SBOMs satisfy the requirement.**
   Generated for **all** published images (plain for every matrix entry, hardened where
   produced), per architecture.
4. **Package docs are committed MD files** in the repo, derived from the SBOMs.

## Scope & sequencing (confirmed 2026-07-02)

This spec lands in two PRs:

- **PR #247 (this work):** Part 1 (gate restructure + resilience), Part 2 (SBOM
  generation + oras attachment), Part 4 (README), Part 5 (spec supersession). These are
  the must-haves — they unblock publishing and satisfy the SBOM legal requirement.
- **Follow-up PR:** Part 3 (the `publish-package-docs` self-committing job + generator
  script). It is the riskiest, non-blocking piece (bot commits, push token, race
  handling) and depends only on the SBOM artifacts that Part 2 already produces, so it can
  land independently without touching the publish path again.

The implementation plan for this cycle therefore covers Parts 1, 2, 4, and 5. Part 3 is
specified here for continuity but planned/implemented separately.

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

### Publish ordering — plain ships *before* the gate (revised 2026-07-02)

To make "plain always ships" ironclad — not merely "ships unless the gate step hits an
unforeseen error" — the single combined push step is split so the plain push happens
**before** the scan/patch/gate step, and hardened is pushed **after** it. New `build-php`
step order on a hardened leg:

1. **Build plain images** — builds every variant, writes state + plain SBOMs (unchanged).
2. **Push plain images** (`if PUSH`) — tag + push the plain tag set, attach the plain
   SBOM, aggregate the plain logical tags. Runs right after the build and depends only on
   it, so the gate can never prevent plain from shipping. Does **not** `docker rmi` (the
   gate still needs the plain image on hardened legs).
3. **Scan, patch, and gate hardened images** (`if hardened`) — Copa builds the hardened
   image from the already-pushed plain image and gates it; per-variant markers as above;
   step exits 0.
4. **Push hardened images** (`if hardened`, default `success()`) — for each variant that
   has `hardened_image.txt`, tag + push the hardened tag set, attach the hardened SBOM,
   aggregate the hardened logical tags. Because it defaults to `success()`, an *unforeseen
   crash* of the gate step skips hardened push (plain already shipped, job goes red from
   the crash); a normal gate *failure* (fail_gate → exit 0) still runs this step, which
   simply skips the failed variants (no `hardened_image.txt`).
5. **Cleanup images** (`if: always()`) — `docker rmi` the plain and hardened images for
   every variant, reclaiming disk regardless of outcome.

Outcomes:
- Build fails → nothing pushed (can't publish what wasn't built).
- Build ok, gate step crashes → **plain already pushed**; hardened skipped; job red.
- Build ok, gate fail_gate on a variant → plain pushed; that variant's `-hardened` skipped
  and left at its previously published state; other variants' hardened pushed; job red via
  the deferred fail step.
- All pass → plain + hardened pushed; green.

Aggregation: both push steps append their logical tags (arch suffix stripped) to
`aggregated_tags.txt`; gate-failed variants contribute no hardened tags, so `process-tags`
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

## Part 3 — Hardened package docs (committed MD) — FOLLOW-UP PR

> Not in PR #247. Specified here for continuity; planned and implemented separately.
> Consumes the SBOM artifacts produced by Part 2, so it needs no further change to the
> publish path.

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
     `docs/hardened-packages/v5.2-php8.5.md`),
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
  `oras` referrer replaces it. A hybrid (containerd image store so `--load` keeps
  attestations for plain, Trivy for hardened) was considered and declined on 2026-07-02:
  it needs a daemon-reconfig spike, keeps two SBOM mechanisms permanently, and — since
  even `5.x` only carries attestations on per-arch tags — buys no extra coverage over the
  referrer approach.
- No SBOM signing (cosign) — can be layered on later if compliance requires signatures.
- No package docs for plain-only (dev) lines; their SBOMs exist as artifacts/referrers.
- No change to gate defaults, severity normalisation, or Trivy report artifacts.

## Testing

- **Workflow lint:** `bash -n` on every extracted `run:` block; YAML parse check.
- **Gate logic:** unit-test the marker/continue flow by extracting the loop into a script
  with stubbed `trivy`/`copa`/`docker` (failing variant 2 of 3 → variants 1 and 3 push
  plain+hardened, variant 2 plain only, final step exits 1).
- **SBOM:** assert `trivy image --format spdx-json` produces a valid SPDX file with
  `packages[].versionInfo` populated for a sample image; confirm `oras attach` failure is
  swallowed with a warning (stub a rejecting registry).
- **Docs generator (follow-up PR):** run `.github/scripts/generate-package-docs.sh`
  against two fixture SPDX files (differing versions, added/removed package) and assert the
  MD output.
- **Live validation:** `workflow_dispatch` with `publish: false` builds, patches, gates,
  and generates SBOMs without pushing; the docs job is skipped (publish-gated), validated
  on the first real publish run.

## Hardened-publish rollout gate (`publish_hardened`, 2026-07-16)

A `publish_hardened` `workflow_dispatch` input (boolean, default `false`) gates **publishing**
of the `-hardened` tags, independently of plain publishing:

- Hardened images are **always built, scanned, patched, and gated** for `hardened: true`
  matrix entries (unchanged) — the input only controls the registry push.
- `-hardened` tags are pushed **only when** `github.event_name == 'workflow_dispatch' &&
  inputs.publish && inputs.publish_hardened`. So:
  - **Scheduled / tag-push runs push plain only** — hardened is built + gated but not
    published until someone opts in. (Deliberate safe rollout; revisit the formula once
    hardened is validated in production.)
  - A **`publish=true, publish_hardened=false` dispatch** publishes plain and exercises the
    full hardened build/gate (Copa pulls the just-pushed plain image, so the gate is
    accurate) without pushing `-hardened` — the intended test mode.
- The deferred "Fail if severity gate failed" step still runs whenever hardened is built,
  so a gate failure turns the job red even on a non-publishing run (honest signal that
  patching left CVEs). README describes the two-flavor scheme as the target state; until
  `publish_hardened` is enabled, `-hardened` tags are not refreshed in the registries.

## Post-review notes (2026-07-02, after the multi-dimension branch review)

The exhaustive branch review surfaced two items that are **not** code changes but must be
recorded:

- **Copa image source (OPEN — needs CI validation; earlier "false positive" was wrong).**
  Copa runs against the standalone `buildkitd` container (`-a tcp://127.0.0.1:8888`), whose
  image store is isolated from the host Docker daemon that `docker build --load` populated.
  It does not automatically see the local `PLAIN_IMAGE`; it resolves the reference through
  BuildKit, which pulls from the registry. Consequence:
    - **`publish: true` (real publishes / cron / tag): correct.** Because plain is now pushed
      *before* the gate (this spec's publish-ordering change), `PLAIN_IMAGE` is in the
      registry when Copa runs, so BuildKit pulls exactly the just-built image.
    - **`publish: false` (dry-run, the new dispatch default): NOT reliable.** The fresh image
      isn't in the registry, so Copa may patch a *previously published* image (or fail for a
      never-published tag). A dry-run therefore does not faithfully exercise the hardened
      path. An earlier note here called this a false positive on the premise that the
      pre-existing pipeline patched a local image the same way — that premise was unfounded
      (the Copa checksum bug meant hardened legs almost certainly never completed before), so
      it is retracted.
  Options if dry-run fidelity is required: skip the gate/hardened steps on `publish: false`,
  or make the fresh image available to `buildkitd` (shared store / local registry). Tracked
  for a follow-up; real publishing is unaffected.
- **Rollout / trigger scope (I5).** `schedule:` runs use the workflow file on the
  **default branch**, and `push: tags:` runs use the file at the pushed tag. The `_ci`
  checkout resolves scripts from `github.sha` (the workflow's own commit), so the pipeline
  is correct for whatever ref actually runs it — but the new pipeline only takes effect for
  the scheduled/tag cadence once this change (workflow **and** `.github/scripts/`) has
  landed on the default branch and been forward-merged along the active line chain.
  Until then, scheduled publishes keep running the old pipeline. This must be part of the
  merge/rollout plan, not just the PR merge.
