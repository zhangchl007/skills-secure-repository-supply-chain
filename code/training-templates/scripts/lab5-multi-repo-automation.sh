#!/usr/bin/env bash
set -euo pipefail

TEAM="${1:-}"
OWNER="${2:-}"
REPO_COUNT="${3:-10}"
if [[ -z "$TEAM" || -z "$OWNER" ]]; then
  echo "Usage: ./lab5-multi-repo-automation.sh <team> <owner> [repo_count]"
  exit 1
fi

TEAM_SLUG=$(echo "$TEAM" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g')
OUT_DIR="../submissions/team-$TEAM_SLUG"
mkdir -p "$OUT_DIR"
OUT="$OUT_DIR/team-$TEAM_SLUG-lab5-multi-repo-automation.md"

cat > "$OUT" <<EOF
# Team $TEAM — Lab 5 Multi-Repo Policy Automation

- Owner: $OWNER
- Date: $(date -Iseconds)
- Target repositories: $REPO_COUNT

## Inventory

| Repo | Current State | Drift | Owner |
|---|---|---|---|
|  |  |  |  |

## Baseline Controls

| Control | Required Policy | Enforcement |
|---|---|---|
| Branch protection |  |  |
| Secret scanning |  |  |
| Dependabot alerts |  |  |
| PR reviews |  |  |

## Rollout Plan

1. Pilot on 2 repositories.
2. Validate controls and drift reports.
3. Roll out to remaining repositories.
4. Schedule monthly recertification.
EOF

echo "[OK] $OUT"
