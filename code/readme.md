# GitHub Copilot Enterprise Security Training Manual (1-Day)

## 1) Overview

This manual turns your agenda into a **workable, step-by-step delivery plan** with:

- facilitator preparation
- participant prerequisites
- concrete lab procedures
- success criteria for each lab
- fallback paths when enterprise features are unavailable

## 2) Audience and Outcomes

### Target audience

- Engineering managers and tech leads
- Security champions / AppSec engineers
- Developers using GitHub Copilot in enterprise environments

### Learning outcomes

By the end of the day, participants can:

1. Configure Copilot enterprise controls and policy guardrails.
2. Apply secure coding and secret protection workflows.
3. Perform practical threat modeling and mitigation mapping.
4. Run lightweight cost optimization analysis for Copilot usage.
5. Audit permissions and governance posture with least privilege.

## 3) Prerequisites (Must Complete Before 09:00)

### Accounts and access

- GitHub account for each participant.
- Access to an organization with (preferred) GitHub Enterprise + GitHub Advanced Security.
- VS Code installed with GitHub Copilot and GitHub Copilot Chat extensions.

### Environment

- Working internet access.
- Git installed (`git --version`).
- Node.js LTS installed (`node --version`, `npm --version`).

### Training assets

- One training repository per team (can use this repository as baseline).
- A prepared issue template for labs.
- A shared slide deck or handout with architecture diagrams.

### Validation gate (facilitator)

Before kickoff, validate:

- participants can sign in to GitHub in VS Code
- Copilot suggestions and chat respond
- repository clone/pull works

## 4) Day Plan (Operational)

> Note: your agenda has short gaps (13:30–14:00 and 14:30–14:45). Treat them as break / transition windows.

| Time | Session | Mode | Deliverable |
|---|---|---|---|
| 09:00–09:30 | Kick-off | Instructor-led | Objectives + setup verification |
| 09:30–10:15 | Copilot Architecture & Enterprise Setup | Lecture + Lab 1 | Enterprise setup checklist completed |
| 10:15–11:15 | Security Policy Management | Lecture/demo | Policy matrix draft |
| 11:15–12:00 | Sensitive Information Protection | Lecture + Lab 2 | Secret scanning remediation PR |
| 12:00–12:45 | Lunch Break | — | — |
| 12:45–13:30 | Threat Modeling & Risk Mitigation | Lecture/workshop | Threat model worksheet |
| 14:00–14:30 | Cost Optimization Strategies | Lecture + Lab 3 | Cost optimization quick report |
| 14:45–15:15 | Permission Auditing & Governance | Lecture + Lab 4 | RBAC audit snapshot |
| 15:15–16:00 | Advanced Scenarios & Wrap-up | Discussion + take-home | Labs 5 & 6 assignment |

## 5) Step-by-Step Delivery Guide

## 09:00–09:30 Kick-off

### Steps

1. Introduce goals, scope, and expected outputs.
2. Confirm prerequisites using a quick checklist.
3. Run a 5-minute environment smoke test:
	- Open repository in VS Code.
	- Ask Copilot Chat to explain a file in repository.
	- Create one branch: `git checkout -b training/<name>-day1`.

### Success criteria

- Every participant has a working branch and responsive Copilot Chat.

---

## 09:30–10:15 Copilot Architecture & Enterprise Setup

### Lecture focus

- Copilot request flow (editor → service → model response → local display)
- Context boundaries and prompt hygiene
- Enterprise policy controls (allow/deny, telemetry, governance)

### Lab 1: Enterprise setup + policy configuration

#### Objective

Configure enterprise-level Copilot policy baseline and verify enforcement.

#### Steps

1. In GitHub organization settings, open Copilot policy controls.
2. Set baseline rules (example):
	- allow Copilot for approved teams only
	- enable public code filtering
	- require policy review for exceptions
3. In VS Code, test policy behavior:
	- generate code suggestion in a sample file
	- validate restricted behavior where expected
4. Capture evidence:
	- screenshot of policy page
	- screenshot of successful IDE policy behavior

#### Success criteria

- Policy is configured and verified on at least one participant machine.

#### Fallback (if no enterprise admin access)

- Use a mocked policy worksheet and role-play approvals.
- Validate understanding with scenario-based quiz.

---

## 10:15–11:15 Security Policy Management

### Lecture focus

- Public code filtering rationale
- Compliance checkpoints in SDLC
- Exception handling and auditability

### Facilitated activity (no formal lab)

1. Build a policy matrix with teams (Dev, AppSec, Platform).
2. Define which repos require stricter controls.
3. Document approval flow for policy exceptions.

### Success criteria

- One policy matrix artifact per team.

---

## 11:15–12:00 Sensitive Information Protection

### Lecture focus

- Secret scanning lifecycle
- Token exposure patterns
- GHAS best practices for prevention and remediation

### Lab 2: Secret scanning + secure coding remediation

#### Objective

Detect and remediate exposed secrets using secure workflow.

#### Steps

1. Create a demo branch and intentionally add a fake token string (training-safe, non-real).
2. Push to remote and trigger secret scanning alert.
3. Remediate:
	- remove secret from code/history if required
	- rotate affected token (simulate if token is fake)
	- add prevention control (pre-commit hook / detector guidance)
4. Open a PR with remediation notes and prevention checklist.

#### Success criteria

- Secret alert observed and a remediation PR created.

#### Fallback

- If alerts are delayed/unavailable, use a prepared screenshot + simulated remediation PR template.

---

## 12:45–13:30 Threat Modeling & Risk Mitigation

### Workshop steps

1. Define application assets and trust boundaries.
2. Enumerate top threats (e.g., dependency compromise, token leakage, CI abuse).
3. Score likelihood/impact using simple High/Medium/Low model.
4. Map each high risk to at least one mitigation control.

### Success criteria

- Completed threat model worksheet with top 3 risks and mitigations.

---

## 14:00–14:30 Cost Optimization Strategies

### Lecture focus

- Feature matrix by role (who needs what)
- Usage visibility and adoption analysis
- Cost-saving opportunities without lowering security

### Lab 3: Cost optimization quick analysis

#### Objective

Produce a simple optimization recommendation in 20 minutes.

#### Steps

1. Collect team usage assumptions (active users, occasional users, power users).
2. Build a small table:
	- role
	- current access level
	- usage frequency
	- optimization action
3. Propose 3 actions (example):
	- reassign unused seats monthly
	- target enablement for low-adoption teams
	- tighten entitlement by role

#### Success criteria

- One-page quick analysis per team with 3 actionable items.

---

## 14:45–15:15 Permission Auditing & Governance

### Lecture focus

- RBAC fundamentals and least privilege
- Audit log interpretation
- Recertification cadence

### Lab 4: Permission auditing simplified

#### Objective

Identify excessive permissions and propose corrections.

#### Steps

1. Export or review current team/repo permission assignments.
2. Identify accounts violating least privilege.
3. Propose role adjustments and approval owner.
4. Document findings in an audit snapshot table.

#### Success criteria

- Completed audit snapshot with at least 2 corrective actions.

---

## 15:15–16:00 Advanced Scenarios & Wrap-up

### Content

- Multi-repo policy management patterns
- Compliance automation strategy
- Q&A and implementation blockers

### Take-home Labs 5 & 6

- **Lab 5 (Advanced):** Multi-repo policy automation with reusable templates.
- **Lab 6 (Advanced):** Compliance evidence pipeline (policy + alert + remediation trace).

### Wrap-up checklist

- Summarize key decisions and owners.
- Confirm next 30-day action plan.
- Collect feedback and unresolved questions.

## 6) Facilitator Runbook (Workability Checklist)

Use this checklist to ensure the training is runnable on the day:

- Print-friendly quick reference: `code/training-templates/facilitator-one-pager.md`
- Primary day-of guide: `code/training-templates/facilitator-run-of-show.md`

1. Confirm all participants passed environment smoke test.
2. Keep one backup demo account for live troubleshooting.
3. Prepare screenshots for enterprise screens in case of access issues.
4. Keep lab templates pre-created (policy matrix, threat worksheet, audit table).
5. Timebox labs strictly and call “2-minute warning” before transitions.

## 7) Deliverables Summary

At session end, each team should have:

- Lab 1: policy setup evidence
- Lab 2: secret remediation PR or simulation artifact
- Threat model worksheet
- Lab 3 quick cost analysis
- Lab 4 permission audit snapshot
- Take-home plan for Labs 5 and 6

## 8) Ready-to-Use Training Templates

Use these files directly during workshops:

- Print-friendly day-of checklist: `code/training-templates/facilitator-one-pager.md`
- Session orchestration: `code/training-templates/facilitator-run-of-show.md`
- Regenerated lab scripts: `code/training-templates/scripts/README.md`
- Policy management: `code/training-templates/policy-matrix-template.md`
- Threat modeling: `code/training-templates/threat-model-worksheet.md`
- Cost optimization: `code/training-templates/cost-optimization-sheet.md`
- Permission auditing: `code/training-templates/rbac-audit-table.md`

Recommended usage order:

1. Start from `code/training-templates/facilitator-run-of-show.md`.
2. Open the session-specific template for each lab block.
3. Save one artifact file per team using the naming convention in the facilitator guide.

## 9) Post-Training 30-Day Adoption Plan (Recommended)

- Week 1: finalize enterprise policy baseline.
- Week 2: run permission recertification and secret hygiene checks.
- Week 3: pilot compliance automation on 1–2 repositories.
- Week 4: review usage/cost metrics and optimize entitlements.

