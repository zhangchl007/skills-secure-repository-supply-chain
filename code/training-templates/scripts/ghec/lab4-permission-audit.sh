#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/common.sh"

ORG="${1:-cloudinfra008}"
REPO="${2:-zhangchl007/skills-secure-repository-supply-chain}"
OUT="${3:-$SCRIPT_DIR/lab4-audit-${ORG}-$(date +%F).md}"

require_gh_user_auth

ORG_STATUS="OK"
ORG_DETAIL=""
REPO_STATUS="OK"
REPO_DETAIL=""
ORG_ERR_FILE="$(mktemp /tmp/lab4-org-XXXXXX.err)"
REPO_ERR_FILE="$(mktemp /tmp/lab4-repo-XXXXXX.err)"
cleanup() {
  rm -f "$ORG_ERR_FILE" "$REPO_ERR_FILE"
}
trap cleanup EXIT

if ! ORG_DETAIL=$(gh_user api /orgs/$ORG/members --paginate --jq '.[0:5] | map(.login) | join(", ")' 2>"$ORG_ERR_FILE"); then
  ORG_STATUS="ERROR"
  ORG_DETAIL=$(cat "$ORG_ERR_FILE" | tr '\n' ' ')
fi

if ! REPO_DETAIL=$(gh_user api /repos/$REPO/collaborators --paginate --jq '.[0:5] | map(.login) | join(", ")' 2>"$REPO_ERR_FILE"); then
  REPO_STATUS="ERROR"
  REPO_DETAIL=$(cat "$REPO_ERR_FILE" | tr '\n' ' ')
fi

cat > "$OUT" <<EOF
# Lab 4 Permission Audit Result

- Date: $(date -Iseconds)
- Organization: $ORG
- Repository: $REPO

| Check | Status | Details |
|---|---|---|
| Organization members read | $ORG_STATUS | $ORG_DETAIL |
| Repository collaborators read | $REPO_STATUS | $REPO_DETAIL |

## Next Actions

1. Confirm org/repo ownership and visibility.
2. Confirm token scopes and SSO authorization.
3. Re-run this audit and attach to evidence package.
EOF

log "Lab 4 audit report: $OUT"
