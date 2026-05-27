#!/bin/bash

set -euo pipefail

REF="origin/1.x"
IMAGE_NAME="pimcore/pimcore"
LOCAL_TAG="php8.1-v1-dev"
WORKFLOW_TAG="php8.1-v1-dev-amd64"
PATCHED_TAG="${LOCAL_TAG}-copa"
PHP_VERSION="8.1"
DEBIAN_VERSION="bullseye"
TARGET="pimcore_php_fpm"
ARCH="amd64"
BUILDKIT_CONTAINER="buildkitd-copa-local"
WORKDIR="$(mktemp -d)"

for bin in git tar docker trivy jq copa diff sort mktemp; do
  command -v "$bin" >/dev/null 2>&1 || {
    echo "Missing required command: $bin" >&2
    exit 1
  }
done

cleanup() {
  docker rm -f "$BUILDKIT_CONTAINER" >/dev/null 2>&1 || true
  rm -rf "$WORKDIR"
}
trap cleanup EXIT

echo "== Fetch 2.x and export build context =="
git fetch origin 2.x
git archive "$REF" | tar -x -C "$WORKDIR"

echo
echo "== Build original image from 2.x =="
docker build --load \
  --provenance=false \
  --platform "linux/${ARCH}" \
  --target "${TARGET}" \
  --build-arg PHP_VERSION="${PHP_VERSION}" \
  --build-arg DEBIAN_VERSION="${DEBIAN_VERSION}" \
  --tag "${IMAGE_NAME}:${WORKFLOW_TAG}" \
  --tag "${IMAGE_NAME}:${LOCAL_TAG}" \
  "$WORKDIR"

echo
echo "== Trivy scan without Copa =="
trivy image --pkg-types os --ignore-unfixed \
  --format table \
  -o /tmp/trivy-before.txt \
  "${IMAGE_NAME}:${LOCAL_TAG}" || true
cat /tmp/trivy-before.txt

echo
echo "== Save package inventory before patch =="
docker run --rm "${IMAGE_NAME}:${LOCAL_TAG}" \
  dpkg-query -W -f='${Package} ${Version}\n' | sort > /tmp/pkg-before.txt

echo
echo "== Export Trivy JSON report =="
trivy image --pkg-types os --ignore-unfixed \
  --format json \
  -o /tmp/trivy-report.json \
  "${IMAGE_NAME}:${LOCAL_TAG}"

if jq -e '.Results[]? | select(.Vulnerabilities != null and (.Vulnerabilities | length > 0))' /tmp/trivy-report.json >/dev/null 2>&1; then
  echo
  echo "== Start BuildKit for Copa =="
  docker rm -f "$BUILDKIT_CONTAINER" >/dev/null 2>&1 || true
  docker run --detach --rm --privileged \
    -p 127.0.0.1:8889:8888/tcp \
    --name "$BUILDKIT_CONTAINER" \
    --entrypoint buildkitd \
    moby/buildkit:v0.30.0 \
    --addr tcp://0.0.0.0:8888 >/dev/null

  # for i in $(seq 1 60); do
  #   if docker exec "$BUILDKIT_CONTAINER" buildctl --addr tcp://127.0.0.1:8889 debug workers >/dev/null 2>&1; then
  #     break
  #   fi
  #   if [ "$i" -eq 60 ]; then
  #     echo "BuildKit failed to start within 60 seconds" >&2
  #     exit 1
  #   fi
  #   sleep 1
  # done

  echo
  echo "== Patch image with Copa =="
  copa patch \
    -i "${IMAGE_NAME}:${LOCAL_TAG}" \
    -r /tmp/trivy-report.json \
    -t "${PATCHED_TAG}" \
    -a tcp://127.0.0.1:8889

  echo
  echo "== Trivy scan with Copa =="
  trivy image --pkg-types os --ignore-unfixed \
    --format table \
    -o /tmp/trivy-after.txt \
    "${IMAGE_NAME}:${PATCHED_TAG}" || true
  cat /tmp/trivy-after.txt

  echo
  echo "== Save package inventory after patch =="
  docker run --rm "${IMAGE_NAME}:${PATCHED_TAG}" \
    dpkg-query -W -f='${Package} ${Version}\n' | sort > /tmp/pkg-after.txt

  echo
  echo "== Package diff: original vs patched =="
  diff -u /tmp/pkg-before.txt /tmp/pkg-after.txt || true

  echo
  echo "== Image IDs =="
  docker image inspect "${IMAGE_NAME}:${LOCAL_TAG}" --format 'original  {{.RepoTags}} {{.Id}}'
  docker image inspect "${IMAGE_NAME}:${PATCHED_TAG}" --format 'patched   {{.RepoTags}} {{.Id}}'
else
  echo
  echo "No OS vulnerabilities reported by Trivy. Copa patch step skipped."
fi

echo
echo "Artifacts written to:"
echo "  /tmp/trivy-before.txt"
echo "  /tmp/trivy-report.json"
echo "  /tmp/pkg-before.txt"
echo "  /tmp/trivy-after.txt"
echo "  /tmp/pkg-after.txt"