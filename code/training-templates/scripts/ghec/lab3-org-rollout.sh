#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/common.sh"

ORG="${1:-cloudinfra008}"
LIMIT="${2:-20}"
FALLBACK_REPO="${3:-zhangchl007/skills-secure-repository-supply-chain}"
APPLY="${4:-false}"
PROTECT_BRANCH="${5:-true}"

require_gh_user_auth

mapfile -t REPOS < <(gh_user repo list "$ORG" --limit "$LIMIT" --json nameWithOwner --jq '.[].nameWithOwner')
if [[ ${#REPOS[@]} -eq 0 ]]; then
  warn "No repositories found for org $ORG. Using fallback repo: $FALLBACK_REPO"
  REPOS=("$FALLBACK_REPO")
fi

for repo in "${REPOS[@]}"; do
  log "Lab 3 applying to: $repo"
  "$SCRIPT_DIR/lab2-repo-security.sh" "$repo" "$APPLY" "$PROTECT_BRANCH"
done

log "Lab 3 completed for ${#REPOS[@]} repository(ies)."
