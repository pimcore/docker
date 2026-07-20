#!/usr/bin/env bash
# Merge per-arch tags pushed THIS run into logical multi-arch manifests.
# Reads AGG_FILE (default all_aggregated_tags.txt), one per-arch tag per line.
set -uo pipefail
AGG_FILE="${AGG_FILE:-all_aggregated_tags.txt}"

declare -A HAS_AMD64 HAS_ARM64 LOGICAL
while IFS= read -r t; do
    [ -z "$t" ] && continue
    case "$t" in
        *-amd64) lt="${t%-amd64}"; HAS_AMD64["$lt"]=1; LOGICAL["$lt"]=1 ;;
        *-arm64) lt="${t%-arm64}"; HAS_ARM64["$lt"]=1; LOGICAL["$lt"]=1 ;;
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
        fi
    else
        echo "Skipping $lt: only one arch pushed this run (amd64=${HAS_AMD64[$lt]:-0} arm64=${HAS_ARM64[$lt]:-0}); previous manifest left unchanged"
    fi
done

if [ "$failed" -ne 0 ]; then
    echo "::error::One or more multi-arch manifests failed to publish"
    exit 1
fi
exit 0
