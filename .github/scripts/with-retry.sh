#!/usr/bin/env bash
# Run a command with retries + exponential backoff, for transient CI flakiness
# (e.g. Trivy DB/artifact downloads 404ing from a mirror). Retries on ANY non-zero
# exit. Config via env: RETRY_MAX (default 3), RETRY_DELAY (first backoff seconds,
# default 10; doubles each attempt). Returns the command's last exit code if all
# attempts fail. Deliberately omits `set -e`: the retry loop owns all failure
# handling, so a failing attempt must fall through to the backoff, never abort.
set -uo pipefail

[ "$#" -gt 0 ] || { echo "usage: with-retry.sh <cmd> [args...]" >&2; exit 2; }

max="${RETRY_MAX:-3}"
delay="${RETRY_DELAY:-10}"
attempt=1

while true; do
    "$@" && exit 0
    rc=$?
    if [ "$attempt" -ge "$max" ]; then
        echo "::warning::command failed after ${attempt} attempt(s) (exit ${rc}): $*" >&2
        exit "$rc"
    fi
    echo "attempt ${attempt}/${max} failed (exit ${rc}); retrying in ${delay}s: $*" >&2
    sleep "$delay"
    attempt=$((attempt + 1))
    delay=$((delay * 2))
done
