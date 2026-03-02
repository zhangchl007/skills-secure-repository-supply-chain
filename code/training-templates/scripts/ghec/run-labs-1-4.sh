#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

ENTERPRISE="${1:-copilottest008}"
ORG="${2:-cloudinfra008}"
REPO="${3:-zhangchl007/skills-secure-repository-supply-chain}"
APPLY="${4:-false}"

"$SCRIPT_DIR/lab1-enterprise-org-setup.sh" "$ENTERPRISE" "$ORG" "$APPLY"
"$SCRIPT_DIR/lab2-repo-security.sh" "$REPO" "$APPLY" "true"
"$SCRIPT_DIR/lab3-org-rollout.sh" "$ORG" "20" "$REPO" "$APPLY" "true"
"$SCRIPT_DIR/lab4-permission-audit.sh" "$ORG" "$REPO"

echo "[INFO] Labs 1-4 completed. Apply mode: $APPLY"
