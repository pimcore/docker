#!/usr/bin/env bash
# Per-variant: scan the plain image, patch with Copa (or mirror if nothing fixable),
# gate the hardened image on GATE_SEVERITY, and -- only if it passes -- publish the
# hardened outputs and generate its SPDX SBOM. A gate failure (or scan/patch error)
# writes gate_failed.txt, skips the hardened outputs, and exits 0 so the plain image
# still ships and other variants continue. Genuine infra errors abort (set -e).
set -euo pipefail

variant="${1:?usage: scan-patch-gate.sh <variant>}"
: "${IMAGE_NAME:?}"; : "${ARCH_TAG:?}"; : "${GATE_SEVERITY:?}"
STATE_DIR="${STATE_DIR:-.docker-state}"
SBOM_DIR="${SBOM_DIR:-sboms}"
REPORT_DIR="${REPORT_DIR:-trivy-reports}"
BUILDKIT_ADDR="${BUILDKIT_ADDR:-tcp://127.0.0.1:8888}"
vdir="${STATE_DIR}/${variant}"
mkdir -p "$SBOM_DIR" "$REPORT_DIR"

PLAIN_IMAGE=$(< "${vdir}/plain_image.txt")
BASE_TAG=$(< "${vdir}/base_tag.txt")
VERSION=$(< "${vdir}/version.txt")
TAG=$(< "${vdir}/tag.txt")
HARDENED_IMAGE="${IMAGE_NAME}:${BASE_TAG}-${VERSION}-hardened-${ARCH_TAG}"
report="/tmp/spg-${variant}.json"

fail_gate() { # <reason> -- record + skip hardened, but let plain ship
    echo "::error::${variant}: $1"
    { echo "## Gate failed: ${HARDENED_IMAGE}"; echo ""; echo "$1"; echo ""; } >> "${GITHUB_STEP_SUMMARY:-/dev/null}"
    echo "$1" > "${vdir}/gate_failed.txt"
    rm -f "${vdir}/hardened_image.txt" "${vdir}/hardened_tags.txt" "${vdir}/hardened_sbom.txt"
    rm -f "$report"
    exit 0
}

echo "Scanning plain image ${PLAIN_IMAGE} for OS vulnerabilities"
trivy image --pkg-types os --ignore-unfixed --format json -o "$report" "${PLAIN_IMAGE}" \
    || fail_gate "Trivy scan of plain image failed"

jq empty "$report" 2>/dev/null || fail_gate "Trivy report of plain image is not valid JSON"

if [ -s "$report" ] && jq -e '.Results[]? | select(.Vulnerabilities != null and (.Vulnerabilities | length > 0))' "$report" > /dev/null; then
    copa patch -i "${PLAIN_IMAGE}" -r "$report" -t "${HARDENED_IMAGE}" -a "${BUILDKIT_ADDR}" \
        || fail_gate "Copa patch failed"
    docker image inspect "${HARDENED_IMAGE}" > /dev/null 2>&1 \
        || fail_gate "Hardened image not found after copa patch"
    echo "Successfully patched ${PLAIN_IMAGE} into ${HARDENED_IMAGE}"
else
    echo "No fixable OS vulnerabilities found; hardened image mirrors plain"
    docker tag "${PLAIN_IMAGE}" "${HARDENED_IMAGE}"
fi
rm -f "$report"

if [ "$GATE_SEVERITY" != "NONE" ]; then
    echo "Running post-patch scan (fail on ${GATE_SEVERITY})"
    if ! HARDENED_ID=$(docker image inspect "${HARDENED_IMAGE}" --format '{{.Id}}'); then
        fail_gate "could not inspect hardened image for report hash"
    fi
    IMAGE_HASH="${HARDENED_ID#sha256:}"
    IMAGE_HASH="${IMAGE_HASH:0:12}"
    REPORT_JSON="${REPORT_DIR}/${TAG}-hardened_${IMAGE_HASH}.json"
    REPORT_TXT="${REPORT_DIR}/${TAG}-hardened_${IMAGE_HASH}.txt"

    trivy image --pkg-types os --ignore-unfixed --severity "$GATE_SEVERITY" \
        --format json -o "${REPORT_JSON}" "${HARDENED_IMAGE}" \
        || fail_gate "Trivy gate scan failed"

    trivy image --pkg-types os --ignore-unfixed --severity "$GATE_SEVERITY" \
        --format table -o "/tmp/spg-${variant}.txt" "${HARDENED_IMAGE}" || true
    cp "/tmp/spg-${variant}.txt" "${REPORT_TXT}" 2>/dev/null || true
    {
        echo "## Trivy Scan: ${HARDENED_IMAGE}"
        echo ""
        echo "### OS Vulnerabilities (${GATE_SEVERITY})"
        echo '```'
        cat "/tmp/spg-${variant}.txt" 2>/dev/null || echo "No results"
        echo '```'
        echo ""
    } >> "${GITHUB_STEP_SUMMARY:-/dev/null}"
    rm -f "/tmp/spg-${variant}.txt"

    jq empty "${REPORT_JSON}" 2>/dev/null || fail_gate "Trivy gate report is not valid JSON"

    if jq -e '.Results[]? | select((.Vulnerabilities // []) | length > 0)' "${REPORT_JSON}" > /dev/null; then
        fail_gate "unfixed ${GATE_SEVERITY} vulnerabilities remain after patching"
    fi
fi

# Gate passed (or disabled): generate the SBOM first, then publish the markers atomically.
HARDENED_SBOM="${SBOM_DIR}/${BASE_TAG}-${VERSION}-hardened-${ARCH_TAG}.spdx.json"
trivy image --format spdx-json -o "${HARDENED_SBOM}" "${HARDENED_IMAGE}" \
    || fail_gate "hardened SBOM generation failed"

while IFS= read -r plain_tag; do
    echo "${plain_tag%-${ARCH_TAG}}-hardened-${ARCH_TAG}"
done < "${vdir}/plain_tags.txt" > "${vdir}/hardened_tags.txt"
echo "${HARDENED_IMAGE}" > "${vdir}/hardened_image.txt"
echo "${HARDENED_SBOM}"  > "${vdir}/hardened_sbom.txt"
echo "Published hardened outputs for ${variant}"
