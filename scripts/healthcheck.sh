#!/usr/bin/env bash
set -euo pipefail

base_url=${1:-http://localhost:8080}
base_url=${base_url%/}
health_url="${base_url}/healthz"

http_status=$(curl \
    --silent \
    --show-error \
    --output /dev/null \
    --write-out '%{http_code}' \
    "$health_url") || {
    printf 'Health check failed: unable to reach %s\n' "$health_url" >&2
    exit 1
}

if [ "$http_status" = "200" ]; then
    printf 'Health check successful: %s returned HTTP 200\n' "$health_url"
    exit 0
fi

printf 'Health check failed: %s returned HTTP %s\n' \
    "$health_url" \
    "$http_status" >&2
exit 1
