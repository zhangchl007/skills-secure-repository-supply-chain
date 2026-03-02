#!/usr/bin/env bash
set -euo pipefail

TEAM="${1:-}"
OWNER="${2:-}"
if [[ -z "$TEAM" || -z "$OWNER" ]]; then
  echo "Usage: ./lab6-compliance-evidence.sh <team> <owner>"
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TEAM_SLUG=$(echo "$TEAM" | xargs | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//')
OUT_DIR="$SCRIPT_DIR/../submissions/team-$TEAM_SLUG"
mkdir -p "$OUT_DIR"
OUT="$OUT_DIR/team-$TEAM_SLUG-lab6-compliance-evidence.md"

cat > "$OUT" <<EOF
# Team $TEAM — Lab 6 Compliance Evidence Pipeline

- Owner: $OWNER
- Date: $(date -Iseconds)

## Evidence Schema

| Evidence Type | Source | Owner | Retention |
|---|---|---|---|
| Policy config |  |  |  |
| Alert records |  |  |  |
| Remediation PR |  |  |  |
| Approval logs |  |  |  |

## Traceability Matrix

| Control | Alert | Remediation | Approver | Evidence Link |
|---|---|---|---|---|
|  |  |  |  |  |

## Automation Backlog

1. Define required fields and IDs.
2. Automate data capture from API events.
3. Produce audit-ready report output.
4. Run mock audit and close gaps.
EOF

echo "[OK] $OUT"
