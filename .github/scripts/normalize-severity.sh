#!/usr/bin/env bash
# Normalise a fail_on_severity value into a validated, inclusive Trivy --severity list.
#
# fail_on_severity is a case-insensitive THRESHOLD: naming a severity also gates
# everything above it (e.g. HIGH -> HIGH,CRITICAL), because Trivy's --severity is an
# exact filter that would otherwise let higher severities slip through. A comma-separated
# set is allowed; the lowest-ranked member wins. NONE disables the gate.
#
# Prints the normalised value to stdout ("NONE" when disabled). Exits 1 (with an
# ::error:: on stderr) when the input names no valid severity.
set -euo pipefail

input="${1:?usage: normalize-severity.sh <fail_on_severity>}"
SEVERITY_ORDER="UNKNOWN LOW MEDIUM HIGH CRITICAL"

if [ "${input^^}" = "NONE" ]; then
    echo "NONE"
    exit 0
fi

min_rank=-1
IFS=',' read -r -a requested <<< "${input^^}"
for sev in "${requested[@]}"; do
    sev="${sev// /}"
    [ -z "$sev" ] && continue
    rank=-1; i=0
    for known in $SEVERITY_ORDER; do
        if [ "$known" = "$sev" ]; then rank=$i; fi
        i=$((i + 1))
    done
    if [ "$rank" -lt 0 ]; then
        echo "::error::Invalid fail_on_severity value '${sev}'. Allowed: ${SEVERITY_ORDER// /, }, or NONE." >&2
        exit 1
    fi
    if [ "$min_rank" -lt 0 ] || [ "$rank" -lt "$min_rank" ]; then min_rank=$rank; fi
done

if [ "$min_rank" -lt 0 ]; then
    echo "::error::fail_on_severity='${input}' names no valid severity. Use ${SEVERITY_ORDER// /, }, or NONE." >&2
    exit 1
fi

# Emit the inclusive range from the lowest requested severity up to CRITICAL.
out=""; i=0
for known in $SEVERITY_ORDER; do
    if [ "$i" -ge "$min_rank" ]; then
        out="${out:+$out,}$known"
    fi
    i=$((i + 1))
done
echo "$out"
