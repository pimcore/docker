# Design: SBOM referrers on the logical multi-arch tags

**Date:** 2026-07-20
**Status:** Approved (design confirmed with maintainer)
**Branch:** `image_copa` (PR #247)
**Affected files:** `.github/workflows/release.yml`, `.github/scripts/merge-manifests.sh` (new),
`.github/scripts/tests/run.sh` + `stubs/` (new stub), `README.md`

## Problem (confirmed, Copilot r3615441608)

SBOMs are attached as OCI referrers **only to the architecture-specific child tags**
(`…-amd64` / `…-arm64`) in the `build-php` job ([release.yml:244-245,336-337]). The
`process-tags` job then creates the **logical multi-arch tags** users actually pull
(`php8.5-v5.2`, `…-latest`, major, detailed) with `docker buildx imagetools create`, and
attaches nothing. OCI referrers bind to a specific subject **digest**; the logical tag
resolves to the *index* digest, which has no referrer. So `oras discover <logical-tag>`
returns nothing.

**Requirement (maintainer):** *SBOMs for all images we publish* — the SBOM must be
discoverable via `oras discover` on the tags users pull, i.e. the logical tags, including
the `-latest` / major / detailed aliases.

## Approach

Carry the SBOM association through aggregation, and attach at manifest-merge time.

1. **`build-php` aggregation (plain + hardened push).** Each line appended to
   `aggregated_tags.txt` becomes `TAB`-separated: `<per-arch-tag><TAB><sbom-relpath>`
   instead of just `<per-arch-tag>`. Every per-arch tag variant of an image (primary,
   detailed, `-latest`, major, ghcr) is paired with **that image's per-arch SBOM file**
   (the same `sboms/<primary-tag>.spdx.json` already generated and uploaded). Plain rows
   use the plain SBOM; hardened rows use the hardened SBOM.

2. **Extract the `process-tags` merge loop into `.github/scripts/merge-manifests.sh`.**
   Behavior-preserving move of the existing per-arch → logical merge (the
   `HAS_AMD64`/`HAS_ARM64`/`LOGICAL` logic, the both-arches-required guard, and the
   fail-the-job-on-`imagetools create`-error behavior), so the mapping is unit-testable.
   The script reads `all_aggregated_tags.txt`, now with the `tag<TAB>sbom` format, and
   records `SBOM_AMD64[$lt]` / `SBOM_ARM64[$lt]` alongside the presence flags.

3. **Attach per-arch SBOMs to each logical tag.** After a successful
   `docker buildx imagetools create --tag "$lt" "$lt-amd64" "$lt-arm64"`, the script calls
   `attach-sbom.sh "$lt" "${SBOM_AMD64[$lt]}"` and `attach-sbom.sh "$lt" "${SBOM_ARM64[$lt]}"`
   — two referrers on the index subject, one per architecture. Attachment stays
   **best-effort / non-fatal** (unchanged `attach-sbom.sh` behavior); a rejected referrer
   never fails the job, and the workflow artifact remains the authoritative SBOM copy.

4. **`process-tags` job wiring.** Add three things the job lacks today:
   - a checkout of the CI scripts (`_ci` sparse-checkout of `.github/scripts` from the
     workflow ref, mirroring `build-php`), so `merge-manifests.sh` and `attach-sbom.sh`
     are available;
   - install **oras** (extract the existing oras-install shell — checksum-verified — so it
     is reused, not duplicated ad hoc). Trivy is not needed here.
   - download the `sboms_*` artifacts (`actions/download-artifact@v8`,
     `pattern: sboms_*`, `merge-multiple: true`, `path: sboms`) so the recorded
     `sboms/<name>.spdx.json` relpaths resolve on disk.

5. **README.** Update the SBOM sentence (line ~55) so the `oras discover` claim is true for
   the logical tags, not only the per-arch tags.

## Decisions (baked in)

- **Two per-arch SBOM referrers on the index**, not one merged SBOM — each SPDX accurately
  describes one platform; `oras discover <logical-tag>` lists both. (A combined multi-arch
  SBOM is out of scope — Trivy scans per platform.)
- **All logical aliases covered** (`-latest`, major, detailed), because the SBOM path
  travels with each per-arch tag through aggregation.
- **Best-effort attach retained**; the uploaded artifact stays the guaranteed copy.
- **oras install is shared, not reforked** — reuse the existing checksum-verified install
  logic so `ORAS_VERSION` pinning and verification are identical in both jobs.

## Testing

- Extract makes the merge logic unit-testable. New stub tests in
  `.github/scripts/tests/run.sh` (with a `docker` stub covering `buildx imagetools create`
  and an `attach-sbom`/`oras` stub) assert, over a synthetic `all_aggregated_tags.txt`:
  - a logical tag with **both** arches present → `imagetools create` invoked with both
    per-arch tags, then `attach-sbom` invoked **twice** for that logical tag (amd64 + arm64
    SBOM paths);
  - a logical tag with **only one** arch present → skipped, no create, no attach;
  - `imagetools create` failure → script exits non-zero (job fails), matching current
    behavior;
  - attach failure is **non-fatal** (script still exits 0 when creates succeed).
  Mutation-verify each new assertion catches its target.
- `actionlint` + `shellcheck` clean on the changed workflow and the new script.

## Out of scope (YAGNI)

- A single combined/merged multi-arch SBOM.
- Changing the per-arch child referrers or the artifact upload (both stay).
- Signing/attestation beyond SBOM referrers.

## Rollback

Revert the commits: `process-tags` returns to inline merge with no attach, `aggregated_tags`
returns to bare tags. The per-arch child referrers and the workflow artifact remain, so the
SBOM still exists for every image — only logical-tag discovery reverts.
