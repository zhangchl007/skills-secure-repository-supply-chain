#!/usr/bin/env bash
set -euo pipefail

log() {
  echo "[INFO] $*"
}

warn() {
  echo "[WARN] $*"
}

error() {
  echo "[ERROR] $*" >&2
}

require_command() {
  local cmd="$1"
  command -v "$cmd" >/dev/null 2>&1 || { error "Missing command: $cmd"; exit 1; }
}

require_command gh
require_command jq

gh_user() {
  env -u GITHUB_TOKEN -u GH_TOKEN gh "$@"
}

require_gh_user_auth() {
  if ! gh_user auth status >/dev/null 2>&1; then
    error "GitHub CLI user auth is required. Run: env -u GITHUB_TOKEN -u GH_TOKEN gh auth login --web --hostname github.com --scopes \"repo,admin:org,read:org,security_events\""
    exit 1
  fi
}

slugify() {
  echo "$1" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//'
}
