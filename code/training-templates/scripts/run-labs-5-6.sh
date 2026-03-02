#!/usr/bin/env bash
set -euo pipefail

TEAM="${1:-}"
OWNER="${2:-}"
REPO_COUNT="${3:-10}"
if [[ -z "$TEAM" || -z "$OWNER" ]]; then
  echo "Usage: ./run-labs-5-6.sh <team> <owner> [repo_count]"
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
"$SCRIPT_DIR/lab5-multi-repo-automation.sh" "$TEAM" "$OWNER" "$REPO_COUNT"
"$SCRIPT_DIR/lab6-compliance-evidence.sh" "$TEAM" "$OWNER"

echo "[INFO] Labs 5-6 completed"
