#!/usr/bin/env bash
# Install oras (checksum-verified) to /usr/local/bin. Version from ORAS_VERSION.
set -euxo pipefail
: "${ORAS_VERSION:?ORAS_VERSION must be set}"
ORAS_ARCH="$(dpkg --print-architecture)"
curl -fsSL -o oras.tar.gz "https://github.com/oras-project/oras/releases/download/v${ORAS_VERSION}/oras_${ORAS_VERSION}_linux_${ORAS_ARCH}.tar.gz"
curl -fsSL -o oras_checksums.txt "https://github.com/oras-project/oras/releases/download/v${ORAS_VERSION}/oras_${ORAS_VERSION}_checksums.txt"
# Match the filename exactly ($2 == f): a substring match can also hit
# a sibling entry like *.tar.gz.sbom.json and return two hashes.
EXPECTED_SHA=$(awk -v f="oras_${ORAS_VERSION}_linux_${ORAS_ARCH}.tar.gz" '$2 == f {print $1}' oras_checksums.txt)
ACTUAL_SHA=$(sha256sum oras.tar.gz | awk '{print $1}')
if [ -z "$EXPECTED_SHA" ]; then
    echo "::error::No oras checksum entry for oras_${ORAS_VERSION}_linux_${ORAS_ARCH}.tar.gz"
    exit 1
fi
if [ "$EXPECTED_SHA" != "$ACTUAL_SHA" ]; then
    echo "::error::oras checksum mismatch! Expected ${EXPECTED_SHA}, got ${ACTUAL_SHA}"
    exit 1
fi
tar -xzf oras.tar.gz oras
sudo mv oras /usr/local/bin/oras
rm oras.tar.gz oras_checksums.txt
