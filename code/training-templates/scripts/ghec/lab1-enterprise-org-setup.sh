#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/common.sh"

ENTERPRISE="${1:-copilottest008}"
ORG="${2:-cloudinfra008}"
APPLY="${3:-false}"

require_gh_user_auth

log "Lab 1: enterprise/org setup"
log "Enterprise: $ENTERPRISE | Org: $ORG | Apply: $APPLY"

set +e
DISCOVERY=$(gh_user api graphql -f query='query($slug: String!) { enterprise(slug: $slug) { slug name url } }' -f slug="$ENTERPRISE" 2>/tmp/lab1-enterprise.err)
DISCOVERY_RC=$?
set -e
if [[ $DISCOVERY_RC -eq 0 ]]; then
  echo "$DISCOVERY"
  if echo "$DISCOVERY" | jq -e '.data.enterprise == null' >/dev/null; then
    warn "Enterprise discovery returned null (visibility or permission limitation)."
  fi
else
  warn "Enterprise discovery skipped (missing read:enterprise or limited visibility): $(cat /tmp/lab1-enterprise.err | tr '\n' ' ')"
fi

if [[ "$APPLY" == "true" ]]; then
  PAYLOAD=$(mktemp /tmp/lab1-org-XXXXXX.json)
  cat > "$PAYLOAD" <<'EOF'
{
  "default_repository_permission": "read",
  "members_can_create_repositories": false,
  "members_can_create_public_repositories": false,
  "members_can_create_private_repositories": false,
  "members_can_create_internal_repositories": false,
  "web_commit_signoff_required": true,
  "advanced_security_enabled_for_new_repositories": true,
  "dependency_graph_enabled_for_new_repositories": true,
  "dependabot_alerts_enabled_for_new_repositories": true,
  "dependabot_security_updates_enabled_for_new_repositories": true,
  "secret_scanning_enabled_for_new_repositories": true,
  "secret_scanning_push_protection_enabled_for_new_repositories": true
}
EOF
  gh_user api --method PATCH -H "Accept: application/vnd.github+json" /orgs/$ORG --input "$PAYLOAD" >/dev/null
  rm -f "$PAYLOAD"
  log "Org baseline applied."
else
  log "Dry-run only. Re-run with third arg true to apply."
fi

gh_user api /orgs/$ORG | jq '{login, default_repository_permission, members_can_create_repositories, members_can_create_public_repositories, members_can_create_private_repositories, members_can_create_internal_repositories, web_commit_signoff_required, advanced_security_enabled_for_new_repositories, dependency_graph_enabled_for_new_repositories, dependabot_alerts_enabled_for_new_repositories, dependabot_security_updates_enabled_for_new_repositories, secret_scanning_enabled_for_new_repositories, secret_scanning_push_protection_enabled_for_new_repositories}'
