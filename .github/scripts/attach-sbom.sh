#!/usr/bin/env bash
# Attach an SPDX SBOM to a pushed image as an OCI referrer.
# Non-fatal: a registry that rejects referrers must not break publishing.
set -euo pipefail

ref="${1:?usage: attach-sbom.sh <image-ref> <sbom-file>}"
sbom="${2:?usage: attach-sbom.sh <image-ref> <sbom-file>}"

# oras does not apply the docker CLI's implicit docker.io default: a bare
# "repo/name:tag" is parsed with registry = "repo" (DNS lookup fails, attach is
# lost). Normalise to a fully-qualified reference following Docker's rules so oras
# resolves and authenticates correctly:
#   - no "/"                                          -> official image, docker.io/library/<ref>
#   - first segment contains "." or ":" or is "localhost" -> already a registry host, keep as-is
#                                                        (ghcr.io/..., localhost/..., localhost:5000/...)
#   - otherwise (namespace/repo[:tag])                -> bare Docker Hub ref, docker.io/<ref>
case "$ref" in
    */*)
        case "${ref%%/*}" in
            *.*|*:*|localhost) ;;
            *) ref="docker.io/${ref}" ;;
        esac
        ;;
    *) ref="docker.io/library/${ref}" ;;
esac

if [ ! -s "$sbom" ]; then
    echo "::warning::SBOM '$sbom' missing or empty; skipping attach for ${ref}"
    exit 0
fi

if oras attach --artifact-type application/spdx+json "$ref" "${sbom}:application/spdx+json"; then
    echo "Attached SBOM ${sbom} to ${ref}"
else
    echo "::warning::Failed to attach SBOM to ${ref} (registry may not support OCI referrers)"
fi
exit 0
