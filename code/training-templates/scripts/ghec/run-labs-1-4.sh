#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ "$#" -lt 3 ]; then
  echo "Usage: $0 ENTERPRISE ORG REPO [APPLY]" >&2
  echo "  ENTERPRISE  GitHub Enterprise account/tenant name" >&2
  echo "  ORG         GitHub organization name" >&2
  echo "  REPO        Repository name (e.g. owner/repo)" >&2
  echo "  APPLY       Optional: 'true' to apply changes, defaults to 'false'" >&2
  exit 1
fi

ENTERPRISE="$1"
ORG="$2"
REPO="$3"
APPLY="${4:-false}"

"$SCRIPT_DIR/lab1-enterprise-org-setup.sh" "$ENTERPRISE" "$ORG" "$APPLY"
"$SCRIPT_DIR/lab2-repo-security.sh" "$REPO" "$APPLY" "true"
"$SCRIPT_DIR/lab3-org-rollout.sh" "$ORG" "20" "$REPO" "$APPLY" "true"
"$SCRIPT_DIR/lab4-permission-audit.sh" "$ORG" "$REPO"

echo "[INFO] Labs 1-4 completed. Apply mode: $APPLY"
