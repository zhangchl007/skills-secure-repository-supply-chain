# Facilitator Run-of-Show (Operational Guide)

## Purpose

This guide helps instructors deliver the full day consistently with clear timing, expected outputs, and fallback actions.

## Quick Start (Before Participants Join)

- Optional print copy for live facilitation: `code/training-templates/facilitator-one-pager.md`
- Open these files in separate tabs:
  - `code/training-templates/policy-matrix-template.md`
  - `code/training-templates/threat-model-worksheet.md`
  - `code/training-templates/cost-optimization-sheet.md`
  - `code/training-templates/rbac-audit-table.md`
- Prepare one backup demo account and one backup repository.
- Keep screenshots ready for admin-only screens (enterprise policy pages).
- Create communication channels:
  - one channel for announcements
  - one channel for support questions

## Facilitation Standards

- Timebox strictly; announce “5 minutes left” and “2 minutes left”.
- Use a visible timer for every lab.
- Require one named artifact owner per team per lab.
- End each block with a hard validation check before moving on.

## 2-Minute Demo Pattern (Use Before Each Lab)

1. Show the blank template for 30–40 seconds.
2. Explain expected output fields and quality bar for 40–50 seconds.
3. Call out exactly 3 quality criteria teams must replicate.
4. Start timer and begin lab.

## Artifact Naming Convention

Use this naming to simplify collection and grading:

- `team-<name>-lab1-policy-evidence.md`
- `team-<name>-lab2-secret-remediation.md`
- `team-<name>-threat-model.md`
- `team-<name>-lab3-cost-analysis.md`
- `team-<name>-lab4-rbac-audit.md`
- `team-<name>-takehome-plan.md`

## Minute-by-Minute Run-of-Show

## 09:00–09:30 Kick-off

### Facilitator script

1. Explain goals, outcomes, and artifacts expected by end of day.
2. Confirm prerequisites quickly (GitHub sign-in, Copilot response, repo access).
3. Run smoke test:
   - ask participants to create branch `training/<name>-day1`
   - ask Copilot Chat to summarize a repository file

### Validate before moving

- At least one screenshot per team showing branch + Copilot Chat response.

### If blocked

- Pair blocked users with a teammate and continue on shared screen.
- Use backup demo account for live demonstration.

---

## 09:30–10:15 Copilot Architecture & Enterprise Setup (Lab 1)

### Facilitator script

1. Explain architecture flow and enterprise policy intent.
2. Demonstrate policy baseline once.
3. Teams configure policy (or complete simulation worksheet if no admin access).
4. Teams verify behavior from IDE and capture evidence.

### Required output

- `team-<name>-lab1-policy-evidence.md` with:
  - policy decisions
  - evidence links/screenshots
  - owner and review cadence

### Validate before moving

- Each team has baseline policy entries completed and one verification note.

### If blocked

- Use prepared screenshots and run policy simulation with “approve/deny exception” role-play.

---

## 10:15–11:15 Security Policy Management

### Facilitator script

1. Build policy matrix as group by role (Dev, Security, Platform).
2. Require explicit exception process and approver assignment.
3. Call out one real compliance checkpoint per team.

### Required output

- Updated `policy-matrix-template.md` per team.

### Validate before moving

- Each team has at least 5 control rows populated and one exception flow defined.

---

## 11:15–12:00 Sensitive Information Protection (Lab 2)

### Facilitator script

1. Show secret scanning flow from detection to remediation.
2. Teams introduce a training-safe fake secret in branch.
3. Teams remediate and document prevention controls.

### Required output

- `team-<name>-lab2-secret-remediation.md` including:
  - what was detected
  - remediation steps
  - prevention action added

### Validate before moving

- Each team has a remediation record and a prevention measure documented.

### If blocked

- Use simulated alert evidence and complete remediation documentation from scenario data.

---

## 12:45–13:30 Threat Modeling & Risk Mitigation

### Facilitator script

1. Teams define assets and trust boundaries.
2. Teams list threats and score likelihood/impact.
3. Teams assign top 3 mitigations with owners and dates.

### Required output

- `team-<name>-threat-model.md` based on the worksheet.

### Validate before moving

- Top 3 risks have concrete mitigations and owners.

---

## 14:00–14:30 Cost Optimization Strategies (Lab 3)

### Facilitator script

1. Teams estimate usage by role.
2. Teams identify inefficiencies and 3 cost-saving actions.
3. Teams define KPI for each action.

### Required output

- `team-<name>-lab3-cost-analysis.md`

### Validate before moving

- Three optimization actions with owner and KPI are present.

---

## 14:45–15:15 Permission Auditing & Governance (Lab 4)

### Facilitator script

1. Teams review current permission assignments.
2. Teams flag least-privilege violations.
3. Teams propose corrective actions and due dates.

### Required output

- `team-<name>-lab4-rbac-audit.md`

### Validate before moving

- Minimum two corrective actions with evidence and owner.

---

## 15:15–16:00 Advanced Scenarios & Wrap-up

### Facilitator script

1. Discuss multi-repo policy management patterns.
2. Review compliance automation opportunities.
3. Assign take-home Labs 5 and 6 with due date.
4. Capture unresolved blockers and responsible owners.

### Required output

- `team-<name>-takehome-plan.md` with milestones.

### Final close-out check

- All team artifact files exist.
- Every file has owner, date, and next action.
- 30-day follow-up checkpoint date is agreed.

## Live Troubleshooting Playbook

## Common issue: Copilot not responding in IDE

- Check GitHub sign-in status in VS Code.
- Confirm extension installed/enabled.
- Retry in a fresh window and repository reload.
- Switch to paired mode temporarily if unresolved.

## Common issue: No enterprise admin rights

- Use simulation path with screenshots.
- Continue with policy decision quality, not UI access.

## Common issue: Secret scanning delay

- Use prepared alert sample and continue remediation workflow.

## Common issue: Timing overrun

- Shorten lecture by 5 minutes.
- Keep lab validation gates unchanged.

## Success Metrics (End of Day)

- 100% teams submit all required artifacts.
- At least 80% teams complete every mandatory validation gate.
- Each team identifies at least 3 actionable improvements for next 30 days.
