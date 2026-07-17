# Containerd Image Store for Local Copa Patching — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Let Copa patch the locally built plain image (via Docker's containerd image store) so the hardened path runs entirely locally — a `publish: false` dispatch becomes a full hardened dry-run, and real runs no longer depend on a registry round-trip.

**Architecture:** On the **hardened (stable) matrix legs only**, enable Docker's containerd image store before any builder is created. That gives dockerd's *embedded* BuildKit the `mergeop`/`diffop` Copa requires **and** a shared image store, so Copa (using its default connection) patches the local image. The standalone `buildkitd` container and its `tcp://127.0.0.1:8888` address are removed. `scan-patch-gate.sh` passes `-a` to Copa only when a `BUILDKIT_ADDR` is explicitly set (keeping the rollback path a one-line change).

**Tech Stack:** GitHub Actions, Docker (containerd-snapshotter), Copacetic (Copa) 0.14.1, Trivy, bash, actionlint + shellcheck, stub-based bash unit tests.

## Global Constraints

- **Scope: hardened legs only.** Every daemon change guards on `if: ${{ matrix.build.hardened }}`. Dev/rolling legs (`hardened: false`) are untouched. (Verbatim from spec: "Enable Docker's containerd image store on the hardened (stable) legs only.")
- **Plain always ships.** Plain build + push happen before the gate and must be unaffected; the gate only ever *adds* the hardened tag. Never let a hardened-path change block plain publishing.
- **No new workflow input.** The existing `publish: false` is the dry-run mode. (Verbatim: "with no new input.")
- **Copa version:** pinned via `COPA_VERSION` env (0.14.1) — unchanged.
- **`copa patch` receives `-a <addr>` only when `BUILDKIT_ADDR` is non-empty**, otherwise Copa uses its default connection (docker driver → dockerd embedded BuildKit under the containerd store).
- Shell blocks that change must pass `actionlint` + `shellcheck` (the CI "Lint workflows" + "Run script unit tests" steps in [.github/workflows/test.yml](.github/workflows/test.yml)).

---

### Task 1: `scan-patch-gate.sh` — pass `-a` to Copa only when an address is set

**Files:**
- Modify: [.github/scripts/scan-patch-gate.sh:14](.github/scripts/scan-patch-gate.sh#L14) and `:45-46`
- Test: [.github/scripts/tests/run.sh](.github/scripts/tests/run.sh) (Scenario A assertions + new Scenario G)

**Interfaces:**
- Consumes: env `BUILDKIT_ADDR` (optional). When empty/unset → Copa default connection. When set → `copa patch … -a "$BUILDKIT_ADDR"`.
- Produces: no signature change. Same state files (`hardened_image.txt`, etc.). The only observable change is the `copa` command line.

- [ ] **Step 1: Add the failing test assertions**

In [.github/scripts/tests/run.sh](.github/scripts/tests/run.sh), Scenario A runs with `BUILDKIT_ADDR` **unset**. Add an assertion (right after the existing line `assert_contains "$logA" "-t pimcore/pimcore:php8.5-default-v5.1-hardened-amd64" "A copa invoked with full hardened image reference"`) that Copa is invoked **without** `-a`:

```bash
assert_not_contains "$logA" " -a " "A copa invoked WITHOUT -a when BUILDKIT_ADDR unset (containerd store / default connection)"
```

Then add a new scenario at the end of the scenario list (after Scenario F, before the final pass/fail summary), covering the rollback path where an address **is** supplied:

```bash
# Scenario G: BUILDKIT_ADDR set -> copa receives -a <addr> (rollback / standalone buildkitd path)
wG="$(mktemp -d)"; tmpdirs+=("$wG"); setup_variant "$wG" default
outG="$(BUILDKIT_ADDR=tcp://127.0.0.1:8888 GATE_SEVERITY=CRITICAL,HIGH STUB_FIXABLE=yes STUB_GATE=pass STUB_LOG="$wG/stub.log" run_gate "$wG" default)"; rcG=$?
[ "$rcG" = 0 ] && echo "  ok: G exit 0" || { echo "  FAIL: G exit $rcG"; fail=1; }
logG="$(cat "$wG/stub.log" 2>/dev/null)"
assert_contains "$logG" "-a tcp://127.0.0.1:8888" "G copa receives -a <addr> when BUILDKIT_ADDR set"
```

- [ ] **Step 2: Run the tests to verify the new assertions fail**

Run: `.github/scripts/tests/run.sh`
Expected: FAIL — the current script always defaults `BUILDKIT_ADDR` to `tcp://127.0.0.1:8888`, so Scenario A's log **contains** `-a` (new `assert_not_contains` fails). Scenario G passes already (address happens to match the old default), but it must remain green after the fix.

- [ ] **Step 3: Change the default to empty**

In [.github/scripts/scan-patch-gate.sh:14](.github/scripts/scan-patch-gate.sh#L14):

```bash
BUILDKIT_ADDR="${BUILDKIT_ADDR:-}"
```

(was `BUILDKIT_ADDR="${BUILDKIT_ADDR:-tcp://127.0.0.1:8888}"`)

- [ ] **Step 4: Build the `-a` argument conditionally**

Replace [.github/scripts/scan-patch-gate.sh:45-46](.github/scripts/scan-patch-gate.sh#L45-L46) — currently:

```bash
    copa patch -i "${PLAIN_IMAGE}" -r "$report" -t "${HARDENED_IMAGE}" -a "${BUILDKIT_ADDR}" \
        || fail_gate "Copa patch failed"
```

with:

```bash
    # Pass -a only when an address is configured. With the containerd image store
    # enabled, BUILDKIT_ADDR is unset and Copa uses its default connection
    # (docker driver -> dockerd's embedded BuildKit), which sees the local image.
    # Setting BUILDKIT_ADDR (e.g. a standalone buildkitd) restores the -a path.
    copa_addr=()
    [ -n "${BUILDKIT_ADDR}" ] && copa_addr=(-a "${BUILDKIT_ADDR}")
    copa patch -i "${PLAIN_IMAGE}" -r "$report" -t "${HARDENED_IMAGE}" "${copa_addr[@]}" \
        || fail_gate "Copa patch failed"
```

Note: the script runs under `set -euo pipefail`; on the runner's bash 5.x `"${copa_addr[@]}"` with an empty array expands to nothing without tripping `set -u`.

- [ ] **Step 5: Run the tests to verify they pass**

Run: `.github/scripts/tests/run.sh`
Expected: PASS — all scenarios green, including Scenario A (no `-a`) and Scenario G (`-a tcp://127.0.0.1:8888`).

- [ ] **Step 6: Shellcheck the script**

Run: `shellcheck .github/scripts/scan-patch-gate.sh`
Expected: no new findings (clean, or unchanged from baseline).

- [ ] **Step 7: Commit**

```bash
git add .github/scripts/scan-patch-gate.sh .github/scripts/tests/run.sh
git commit -m "scan-patch-gate: pass copa -a only when BUILDKIT_ADDR is set

Default connection (docker driver under the containerd image store) sees
the locally built plain image, so no standalone buildkitd address is needed.
Setting BUILDKIT_ADDR restores the -a path for rollback."
```

---

### Task 2: `release.yml` — enable the containerd image store; drop the standalone buildkitd

**Files:**
- Modify: [.github/workflows/release.yml](.github/workflows/release.yml) — add one step (~line 75, before `Set up Docker Buildx`), delete two steps (`Start buildkit daemon` ~248-269, `Stop buildkit daemon` ~354-356), edit the gate step (remove the `BUILDKIT_ADDR` export ~288).

**Interfaces:**
- Consumes: `matrix.build.hardened` (bool). The `Install Copa` step and `Scan, patch, and gate hardened images` step are unchanged except for the removed export.
- Produces: on hardened legs, a daemon running the containerd image store before any build; `scan-patch-gate.sh` invoked with `BUILDKIT_ADDR` unset (Task 1's default-connection path).

- [ ] **Step 1: Add the `Enable containerd image store` step**

Insert immediately **after** the `Check out CI scripts from the workflow ref` step and **before** `Set up Docker Buildx` (around [.github/workflows/release.yml:75](.github/workflows/release.yml#L75)). It must run before any builder is created, because it restarts the daemon:

```yaml
            -   name: Enable containerd image store
                if: ${{ matrix.build.hardened }}
                run: |
                    set -euxo pipefail
                    # Copa's mergeop/diffop (required to patch) are only available with the
                    # containerd image store backend, which also gives dockerd's embedded
                    # BuildKit a shared image store. With it enabled, Copa's default connection
                    # patches the locally built plain image -- no registry round-trip and no
                    # standalone buildkitd. Enable it on the hardened legs only, before any
                    # builder is created (this restarts the daemon).
                    sudo mkdir -p /etc/docker
                    if [ -s /etc/docker/daemon.json ]; then
                        existing="$(sudo cat /etc/docker/daemon.json)"
                    else
                        existing='{}'
                    fi
                    printf '%s' "$existing" \
                        | jq '.features = ((.features // {}) + {"containerd-snapshotter": true})' \
                        | sudo tee /etc/docker/daemon.json >/dev/null
                    sudo systemctl restart docker
                    # Wait for the daemon to come back up.
                    for i in $(seq 1 30); do
                        if docker info >/dev/null 2>&1; then break; fi
                        if [ "$i" -eq 30 ]; then
                            echo "::error::Docker did not come back after restart"
                            exit 1
                        fi
                        sleep 1
                    done
                    # Verify the containerd snapshotter storage backend is active.
                    if ! docker info | grep -q 'io.containerd.snapshotter'; then
                        echo "::error::containerd image store is not active after restart"
                        docker info || true
                        exit 1
                    fi
```

- [ ] **Step 2: Delete the `Start buildkit daemon` step**

Remove the entire step at [.github/workflows/release.yml:248-269](.github/workflows/release.yml#L248-L269) (`- name: Start buildkit daemon` … through the closing `done` of its readiness loop). The standalone buildkitd is no longer used.

- [ ] **Step 3: Delete the `Stop buildkit daemon` step**

Remove the entire step at [.github/workflows/release.yml:354-356](.github/workflows/release.yml#L354-L356):

```yaml
            -   name: Stop buildkit daemon
                if: ${{ always() && matrix.build.hardened }}
                run: docker stop buildkitd || true
```

- [ ] **Step 4: Remove the `BUILDKIT_ADDR` export from the gate step**

In the `Scan, patch, and gate hardened images` step, delete [.github/workflows/release.yml:288](.github/workflows/release.yml#L288):

```bash
                    export BUILDKIT_ADDR="tcp://127.0.0.1:8888"
```

Leave the preceding `export IMAGE_NAME GATE_SEVERITY ARCH_TAG TRIVY_DB_REPOSITORY` line intact. With `BUILDKIT_ADDR` unset, `scan-patch-gate.sh` (Task 1) invokes Copa on its default connection.

- [ ] **Step 5: Lint the workflow**

Run:
```bash
actionlint .github/workflows/release.yml
shellcheck -e SC2016 - <<'SH'
$(sed -n '/name: Enable containerd image store/,/verify the containerd/p' .github/workflows/release.yml)
SH
```
Expected: `actionlint` clean. (The `shellcheck` line is a convenience — the authoritative check is CI's "Lint workflows" job, which runs `actionlint -color` and picks up shellcheck on the embedded `run:` blocks. If `actionlint` is not installed locally, install it: `go install github.com/rhysd/actionlint/cmd/actionlint@latest` or download the release binary used in [.github/workflows/test.yml:89](.github/workflows/test.yml#L89).)

- [ ] **Step 6: Sanity-check the YAML structure**

Run:
```bash
grep -n 'Enable containerd image store\|Start buildkit daemon\|Stop buildkit daemon\|BUILDKIT_ADDR\|Set up Docker Buildx' .github/workflows/release.yml
```
Expected: `Enable containerd image store` appears once (before the first `Set up Docker Buildx`); `Start buildkit daemon` and `Stop buildkit daemon` are **gone**; no `BUILDKIT_ADDR` reference remains in `release.yml`.

- [ ] **Step 7: Commit**

```bash
git add .github/workflows/release.yml
git commit -m "release: enable containerd image store on hardened legs, drop standalone buildkitd

Copa now patches the locally built plain image via dockerd's embedded
BuildKit (containerd store), so a publish:false dispatch is a full hardened
dry-run and real runs no longer depend on a registry round-trip."
```

---

### Task 3: Docs — resolve the I4 note and document the dry-run mode

**Files:**
- Modify: [docs/superpowers/specs/2026-07-02-copa-plain-always-publish-sbom-design.md](docs/superpowers/specs/2026-07-02-copa-plain-always-publish-sbom-design.md) (I4 "Copa image source" note)
- Modify: [README.md](README.md) (hardened images section)

**Interfaces:** none (documentation only).

- [ ] **Step 1: Locate the I4 note in the 2026-07-02 spec**

Run: `grep -n 'I4\|Copa image source\|registry' docs/superpowers/specs/2026-07-02-copa-plain-always-publish-sbom-design.md`
Read the surrounding lines to get the exact current wording.

- [ ] **Step 2: Update the I4 note**

Change the I4 "Copa image source" note from its "open / needs validation" wording to resolved. Replace the note's status/body with:

```markdown
**I4 — Copa image source (RESOLVED 2026-07-17):** Copa no longer pulls the target
from the registry. The hardened legs enable Docker's containerd image store, so
Copa's default connection (dockerd's embedded BuildKit) patches the **locally built**
plain image directly. Consequences: `publish: false` is a full hardened dry-run
(build + patch + gate + SBOM, zero pushes), and real runs no longer depend on plain
being pushed before the gate. See
`docs/superpowers/specs/2026-07-17-containerd-store-local-copa-design.md`.
```

Match the surrounding heading style found in Step 1 (adjust the `**…**` / `###` prefix to whatever the file uses for the other findings).

- [ ] **Step 3: Locate the hardened section in README**

Run: `grep -n 'Hardened\|publish_hardened\|workflow_dispatch\|dry' README.md`
Read the hardened images section.

- [ ] **Step 4: Add a dry-run note to the README hardened section**

Add a short sentence to the hardened images section (near the `publish_hardened` explanation) stating the dry-run capability. Use wording consistent with the section's existing voice; the content must be:

```markdown
> **Testing the hardened path without publishing:** trigger the release workflow via
> **workflow_dispatch** with `publish: false`. The stable images are built, Copa-patched,
> scanned, and gated entirely on the runner (using the containerd image store) — **nothing
> is pushed** to Docker Hub or GHCR. Use `publish: true` with `publish_hardened: false` to
> publish the plain tags while still building and gating the hardened images locally.
```

- [ ] **Step 5: Verify the docs read correctly**

Run: `grep -n 'RESOLVED 2026-07-17\|dry-run\|publish: false' docs/superpowers/specs/2026-07-02-copa-plain-always-publish-sbom-design.md README.md`
Expected: the I4 note shows RESOLVED; README shows the dry-run note.

- [ ] **Step 6: Commit**

```bash
git add docs/superpowers/specs/2026-07-02-copa-plain-always-publish-sbom-design.md README.md
git commit -m "docs: resolve I4 (Copa patches local image via containerd store); document publish:false dry-run"
```

---

## Validation (live, after all tasks — user-gated, not part of task commits)

Per the spec's validation gate — run these before relying on the change for the scheduled cadence:

1. `workflow_dispatch` on `image_copa` with `publish: false` → hardened legs enable the containerd store, build, Copa-patch, gate, and produce SBOMs with **zero** pushes; the deferred gate step reports pass/fail.
   - **Confirm Copa patched the *local* image, not a registry pull.** A green gate alone is not proof: the stable plain tags already exist in the registry from prior runs, so a registry-pulling Copa would silently patch the previously published image and still pass. Make the check un-foolable — run Copa with debug logging for this validation (add `--debug` to the `copa patch` call, or raise its log level) and confirm the log shows the **docker driver** connected (it must *not* print `Could not use docker driver` and fall through to buildx/buildkitd). Per Copa v0.14.1 `autoClient`, the docker driver is tried first and, with the containerd store active, is the one used.
2. `workflow_dispatch` with `publish: true, publish_hardened: false` → plain tags published, hardened built + gated but **not** pushed.
3. Only after both pass: allow the scheduled cadence to exercise it.

**Contingency (not expected — driver selection is source-verified).** Copa v0.14.1 tries the docker driver first and it is independent of the selected buildx builder (`pkg/buildkit/drivers.go`, `connhelpers/docker.go`), so the isolated `docker-container` builder should never be chosen. If the debug-log check above nonetheless shows Copa failing over off the docker driver, pin the builder with `docker buildx use default` before the gate loop, or fall back to the local-`registry:2` sidecar (spec Rollback).

## Self-Review

- **Spec coverage:** containerd-store enable step (Task 2/Step 1) ✓; drop buildkitd (Task 2/Steps 2-3) ✓; conditional `-a` / default connection (Task 1) ✓; docs I4 + README dry-run (Task 3) ✓; `publish:false` = dry-run with no new input (Constraints + Task 3) ✓; stub test for `-a` present/absent (Task 1/Step 1) ✓; validation gate (Validation section) ✓; rollback (Validation note + commit messages reference it) ✓.
- **Placeholder scan:** none — every code/edit step shows exact text.
- **Type/name consistency:** `BUILDKIT_ADDR`, `copa_addr`, `matrix.build.hardened`, step names match across tasks and the current file.
