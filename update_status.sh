#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STATUS_FILE="$SCRIPT_DIR/status.json"

if [ ! -f "$STATUS_FILE" ]; then
  echo "Error: status.json not found at $STATUS_FILE"
  exit 1
fi

TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

sed -i "s/\"updated\": \".*\"/\"updated\": \"$TIMESTAMP\"/" "$STATUS_FILE"

echo "Updated timestamp to $TIMESTAMP"
