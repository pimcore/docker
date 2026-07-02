#!/usr/bin/env bash
# Attach an SPDX SBOM to a pushed image as an OCI referrer.
# Non-fatal: a registry that rejects referrers must not break publishing.
set -euo pipefail

ref="${1:?usage: attach-sbom.sh <image-ref> <sbom-file>}"
sbom="${2:?usage: attach-sbom.sh <image-ref> <sbom-file>}"

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
