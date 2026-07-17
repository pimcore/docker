# Design: containerd image store so Copa patches locally (test hardened without publishing)

**Date:** 2026-07-17
**Status:** Approved (pending user review)
**Branch:** `image_copa` (PR #247)
**Affected files:** `.github/workflows/release.yml`, `.github/scripts/scan-patch-gate.sh`,
`README.md`, `docs/superpowers/specs/2026-07-02-copa-plain-always-publish-sbom-design.md`
(I4 note)

## Problem (proven, 2026-07-17 spike)

The hardened path runs Copa against a **standalone tcp buildkitd** container
(`-a tcp://127.0.0.1:8888`). A spike with the workflow's exact setup, on a local
never-pushed image, showed Copa **pull the target from the registry**:

```
Patching: linux/amd64 -> docker.io/library/spiketest:patchedB
… GET https://index.docker.io/v2/library/spiketest/manifests/local: UNAUTHORIZED
```

Consequences:
- On `publish: false` (the default dispatch), the freshly built plain image is in neither
  the registry nor the standalone buildkit's store, so **Copa cannot patch it** — a
  dry-run cannot exercise the hardened path (this is finding "I4").
- Real runs work only because plain is pushed *before* the gate, so Copa pulls the
  just-pushed image.

The spike also showed *why* the standalone buildkitd exists: Copa's required `mergeop` /
`diffop` are "only enabled with the containerd image store backend," which the default
Docker daemon lacks.

**Goal:** let Copa patch the **locally built** plain image, so the hardened path can be
exercised with **zero pushes** (`publish: false`), and so real runs no longer depend on a
registry round-trip.

## Decision (confirmed with maintainer 2026-07-17)

1. **Enable Docker's containerd image store on the hardened (stable) legs only.** This
   gives dockerd's *embedded* BuildKit the `mergeop`/`diffop` Copa needs **and** a shared
   image store, so Copa patches the local image directly. Dev/rolling legs keep the current
   daemon/store, untouched (smaller blast radius). The change is daemon-wide per leg, so the
   5 stable legs' *plain* build/push also move to the containerd store.
2. **Validate via a `publish: false` dispatch before trusting it for scheduled publishing**;
   keep the standalone-buildkitd approach documented as rollback.

## Design

`release.yml` (hardened legs only unless noted):

1. **New step `Enable containerd image store`** — first step after the checkouts and before
   `Set up Docker Buildx`, `if: ${{ matrix.build.hardened }}`:
   - merge `{"features":{"containerd-snapshotter":true}}` into `/etc/docker/daemon.json`
     (preserving any existing keys via `jq`), `sudo systemctl restart docker`, wait until
     `docker info` responds, and verify the driver is `io.containerd.snapshotter.*`.
2. **Drop** `Start buildkit daemon` and `Stop buildkit daemon` (no standalone buildkitd).
3. **`scan-patch-gate.sh`:** invoke `copa patch` **without** `-a` when no address is
   configured — i.e. append `-a "${BUILDKIT_ADDR}"` only when `BUILDKIT_ADDR` is non-empty.
   The gate step stops exporting `BUILDKIT_ADDR`, so Copa uses its default connection, which
   under the containerd store resolves to dockerd's embedded BuildKit and **sees local
   images**.
4. **Copa must use the docker driver (embedded dockerd BuildKit), not an isolated
   `docker-container` buildx builder.** The `publish: false` validation confirms this; if
   Copa selects an isolated builder, pin the default builder to `default` (docker driver)
   before the gate, or fall back to the local-registry approach (see Rollback).

Everything else — plain build, plain push, the gate logic, hardened push (`PUSH_HARDENED`),
cleanup, SBOM/CVE data, `process-tags` — is unchanged. `process-tags` runs in its own job on
an unmodified runner and is unaffected (it operates on the registry).

## Effect

- Copa patches the local plain image on every hardened run → the gate and SBOM are valid
  regardless of publishing; **I4 is resolved for real runs**.
- **`publish: false` → build + Copa patch + gate + SBOM entirely locally, pushing nothing**
  = the "test the hardened path without publishing" mode, with **no new input**.
- `publish: true` + `publish_hardened: false` → plain published, hardened built + gated
  locally, not pushed (as before, now with an accurate gate).
- `publish: true` + `publish_hardened: true` → plain + hardened published.

## Validation gate (before relying on it for cron)

1. `workflow_dispatch` with `publish: false` on `image_copa` — expect: hardened legs enable
   the containerd store, build, Copa-patch, gate, and generate SBOMs, with **zero** pushes
   to Docker Hub / GHCR; the deferred gate step reports pass/fail.
2. `workflow_dispatch` with `publish: true, publish_hardened: false` — expect: plain tags
   published, hardened built + gated but **not** pushed.
3. Only after both pass: allow the scheduled cadence to exercise it.

## Rollback

Revert commits 1–3: restore the `Start`/`Stop buildkit daemon` steps and the
`-a tcp://127.0.0.1:8888` Copa address, and remove the containerd-store step. Copa then
pulls the target from the registry, which requires plain to be pushed before the gate
(the pre-change behavior). Alternative if the containerd route proves flaky on the runners:
run a local `registry:2` sidecar reachable by a standalone buildkitd, push plain there, and
point Copa at it (Option 2 from the discussion) — keeps everything local, more plumbing.

## Risk / uncertainty (explicit)

- The exact Copa↔BuildKit selection under the containerd store on GitHub-hosted runners is
  **confirmed by the validation run**, not yet proven end-to-end here (the local spike could
  not enable the containerd store without disrupting the session daemon).
- The 5 stable legs' plain build/push move to the containerd store; the containerd store is
  the modern Docker default and supports `build --load`, `tag`, `push`, `buildx`, and
  `manifest`, but the `publish: false` → `publish: true` validation sequence is what guards
  the plain-publishing path against regressions.

## Docs updates

- `docs/…/2026-07-02-…-design.md`: update the I4 "Copa image source" note from
  "open / needs validation" to "resolved by the containerd image store; Copa patches the
  local image; `publish: false` is a full local test."
- `README.md`: note that a `workflow_dispatch` with `publish: false` performs a full
  hardened dry-run (build + patch + gate) without publishing.

## Out of scope (YAGNI)

- Enabling the containerd store on dev/rolling legs.
- A separate `dry_run` input (the existing `publish: false` is the test mode).
- The local-registry sidecar (documented only as a fallback).

## Testing

- Workflow lint: `actionlint` + shellcheck on the changed `run:` blocks.
- `scan-patch-gate.sh`: the existing stub tests still pass; add/adjust a stub assertion that
  Copa is invoked **without** `-a` when `BUILDKIT_ADDR` is unset (and with `-a` when set, to
  keep the rollback path covered).
- Live: the two-step `publish: false` → `publish: true, publish_hardened: false` validation
  dispatch above.
