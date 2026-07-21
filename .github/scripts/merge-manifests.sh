#!/usr/bin/env bash
# Merge per-arch tags pushed THIS run into logical multi-arch manifests, and attach each
# image's per-arch SBOMs to the logical tag as best-effort OCI referrers.
# AGG_FILE lines: "<per-arch-tag>\t<sbom-relpath>".
set -uo pipefail
AGG_FILE="${AGG_FILE:-all_aggregated_tags.txt}"
HERE="$(cd "$(dirname "$0")" && pwd)"

declare -A HAS_AMD64 HAS_ARM64 LOGICAL SBOM_AMD64 SBOM_ARM64
while IFS=$'\t' read -r t sbom; do
    [ -z "$t" ] && continue
    case "$t" in
        *-amd64) lt="${t%-amd64}"; HAS_AMD64["$lt"]=1; LOGICAL["$lt"]=1; SBOM_AMD64["$lt"]="$sbom" ;;
        *-arm64) lt="${t%-arm64}"; HAS_ARM64["$lt"]=1; LOGICAL["$lt"]=1; SBOM_ARM64["$lt"]="$sbom" ;;
        *) echo "Skipping tag without arch suffix: $t" ;;
    esac
done < "$AGG_FILE"

failed=0
for lt in "${!LOGICAL[@]}"; do
    if [ -n "${HAS_AMD64[$lt]:-}" ] && [ -n "${HAS_ARM64[$lt]:-}" ]; then
        echo "Creating multi-arch manifest: $lt"
        if ! docker buildx imagetools create --tag "$lt" "${lt}-amd64" "${lt}-arm64"; then
            echo "::error::Failed to create multi-arch manifest for $lt"
            failed=1
            continue
        fi
        # Attach each per-arch SBOM to the logical (index) tag so `oras discover <logical-tag>`
        # finds it. Best-effort: attach-sbom.sh never fails the job.
        for sb in "${SBOM_AMD64[$lt]:-}" "${SBOM_ARM64[$lt]:-}"; do
            if [ -n "$sb" ] && [ -f "$sb" ]; then
                "$HERE/attach-sbom.sh" "$lt" "$sb"
            else
                echo "No SBOM file for $lt referrer (path: '${sb:-}') -- skipping (artifact copy still uploaded)"
            fi
        done
    else
        echo "Skipping $lt: only one arch pushed this run (amd64=${HAS_AMD64[$lt]:-0} arm64=${HAS_ARM64[$lt]:-0}); previous manifest left unchanged"
    fi
done

if [ "$failed" -ne 0 ]; then
    echo "::error::One or more multi-arch manifests failed to publish"
    exit 1
fi
exit 0
