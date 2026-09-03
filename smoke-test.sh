#!/usr/bin/env bash
set -euo pipefail
BASE_URL="${BASE_URL:-http://localhost:3000}"

echo "PumpOS smoke test: $BASE_URL"
curl -fsS "$BASE_URL/api/health" >/dev/null
echo "PASS: health"

echo "Smoke test completed."
