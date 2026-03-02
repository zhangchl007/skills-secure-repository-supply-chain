#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/common.sh"

REPO="${1:-zhangchl007/skills-secure-repository-supply-chain}"
APPLY="${2:-false}"
PROTECT_BRANCH="${3:-true}"

require_gh_user_auth

log "Lab 2: repo security"
log "Repo: $REPO | Apply: $APPLY | Protect branch: $PROTECT_BRANCH"

IS_PRIVATE=$(gh_user api /repos/$REPO --jq '.private')

if [[ "$APPLY" == "true" ]]; then
  if [[ "$IS_PRIVATE" == "true" ]]; then
    gh_user api --method PATCH -H "Accept: application/vnd.github+json" /repos/$REPO \
      -f security_and_analysis[advanced_security][status]=enabled \
      -f security_and_analysis[secret_scanning][status]=enabled \
      -f security_and_analysis[secret_scanning_push_protection][status]=enabled >/dev/null
  else
    gh_user api --method PATCH -H "Accept: application/vnd.github+json" /repos/$REPO \
      -f security_and_analysis[secret_scanning][status]=enabled \
      -f security_and_analysis[secret_scanning_push_protection][status]=enabled >/dev/null
  fi

  gh_user api --method PUT -H "Accept: application/vnd.github+json" /repos/$REPO/vulnerability-alerts >/dev/null
  gh_user api --method PUT -H "Accept: application/vnd.github+json" /repos/$REPO/automated-security-fixes >/dev/null
  gh_user api --method PUT -H "Accept: application/vnd.github+json" /repos/$REPO/private-vulnerability-reporting >/dev/null

  if [[ "$PROTECT_BRANCH" == "true" ]]; then
    DEFAULT_BRANCH=$(gh_user api /repos/$REPO --jq '.default_branch')
    PROTECT_PAYLOAD=$(mktemp /tmp/lab2-protect-XXXXXX.json)
    cat > "$PROTECT_PAYLOAD" <<'EOF'
{
  "required_status_checks": null,
  "enforce_admins": true,
  "required_pull_request_reviews": {
    "dismiss_stale_reviews": true,
    "require_code_owner_reviews": false,
    "require_last_push_approval": false,
    "required_approving_review_count": 1
  },
  "restrictions": null,
  "required_linear_history": true,
  "allow_force_pushes": false,
  "allow_deletions": false,
  "block_creations": false,
  "required_conversation_resolution": true,
  "lock_branch": false,
  "allow_fork_syncing": false
}
EOF
    gh_user api --method PUT -H "Accept: application/vnd.github+json" /repos/$REPO/branches/$DEFAULT_BRANCH/protection --input "$PROTECT_PAYLOAD" >/dev/null
    rm -f "$PROTECT_PAYLOAD"
    log "Branch protection applied on $DEFAULT_BRANCH"
  fi

  log "Repo baseline applied."
else
  log "Dry-run only. Re-run with second arg true to apply."
fi

gh_user api /repos/$REPO | jq '{full_name, private, default_branch, visibility, security_and_analysis}'
