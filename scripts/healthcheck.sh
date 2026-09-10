#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
    printf 'Usage: %s <base-url>\n' "$0" >&2
    exit 1
fi

base_url=${1%/}
health_url="${base_url}/healthz"

if curl --fail --silent --show-error "$health_url" >/dev/null; then
    printf 'Health check successful: %s is healthy\n' "$health_url"
    exit 0
fi

printf 'Health check failed: %s is unhealthy\n' "$health_url" >&2
exit 1
