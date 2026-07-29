# Pimcore Docker image reports

Security and hardening reports for the published `pimcore/pimcore` container images,
regenerated automatically on every release.

## Known CVEs

- **[Known CVEs & hardening report](known-cves.md)** — start here. Hardening outcome,
  per-severity totals, a per-variant breakdown, the worst-affected packages, per-image
  digests, and the full CRITICAL + HIGH listing.
- [MEDIUM severity](known-cves-medium.md)
- [LOW and UNKNOWN severity](known-cves-low.md)

Kernel-header (`linux-libc-dev`) CVEs are excluded from the tables — a container runs on the
host kernel, so they are not reachable inside these images — and the summary states how many
were excluded. The complete machine-readable dataset, including those rows, is the
`cve-report-json` artifact attached to the corresponding release workflow run.

Development / rolling (`-dev`) tags are plain-only, are never Copa-patched, and are not
covered by these reports.
