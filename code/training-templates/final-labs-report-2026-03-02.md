# Final Report — Labs 1–6

- Generated on: 2026-03-02
- Environment: GitHub Enterprise Cloud + GitHub CLI (`gh`)
- Organization: `cloudinfra008`
- Repository: `zhangchl007/skills-secure-repository-supply-chain`

## Executive Summary

| Lab | Title | Status | Evidence |
|---|---|---|---|
| Lab 1 | Enterprise setup + policy configuration | PASS (with enterprise-scope warning) | Org baseline API snapshot |
| Lab 2 | Secret scanning + secure coding remediation | PASS | Repo security state + branch protection snapshot |
| Lab 3 | Cost optimization quick analysis | PASS | Rollout flow validated (fallback repo path used) |
| Lab 4 | Permission auditing simplified | PASS | `scripts/ghec/lab4-audit-cloudinfra008-2026-03-02.md` |
| Lab 5 | Multi-repo policy automation (take-home) | PASS | `submissions/team-octo/team-octo-lab5-multi-repo-automation.md` |
| Lab 6 | Compliance evidence pipeline (take-home) | PASS | `submissions/team-octo/team-octo-lab6-compliance-evidence.md` |

## Lab 1 Output (Org Baseline)

```json
{"login":"cloudinfra008","default_repository_permission":"read","members_can_create_repositories":false,"members_can_create_public_repositories":false,"members_can_create_private_repositories":false,"members_can_create_internal_repositories":false,"web_commit_signoff_required":true,"advanced_security_enabled_for_new_repositories":true,"dependency_graph_enabled_for_new_repositories":true,"dependabot_alerts_enabled_for_new_repositories":true,"dependabot_security_updates_enabled_for_new_repositories":true,"secret_scanning_enabled_for_new_repositories":true,"secret_scanning_push_protection_enabled_for_new_repositories":true}
```

Notes:
- Enterprise GraphQL discovery may show a warning if token lacks `read:enterprise`; this did not block org baseline application.

## Lab 2 Output (Repo Security + Protection)

Repository security state:

```json
{"full_name":"zhangchl007/skills-secure-repository-supply-chain","private":false,"default_branch":"main","visibility":"public","security_and_analysis":{"secret_scanning":{"status":"enabled"},"secret_scanning_push_protection":{"status":"enabled"},"dependabot_security_updates":{"status":"enabled"},"secret_scanning_non_provider_patterns":{"status":"disabled"},"secret_scanning_validity_checks":{"status":"disabled"}}}
```

Default branch protection state:

```json
{"required_pull_request_reviews":{"url":"https://api.github.com/repos/zhangchl007/skills-secure-repository-supply-chain/branches/main/protection/required_pull_request_reviews","dismiss_stale_reviews":true,"require_code_owner_reviews":false,"require_last_push_approval":false,"required_approving_review_count":1},"enforce_admins":{"url":"https://api.github.com/repos/zhangchl007/skills-secure-repository-supply-chain/branches/main/protection/enforce_admins","enabled":true},"required_linear_history":{"enabled":true},"allow_force_pushes":{"enabled":false},"allow_deletions":{"enabled":false},"required_conversation_resolution":{"enabled":true},"lock_branch":{"enabled":false},"allow_fork_syncing":{"enabled":false}}
```

## Lab 3 Output (Rollout Validation)

- Org repo listing for `cloudinfra008` returned no repositories in this test context.
- Script fallback applied rollout checks to `zhangchl007/skills-secure-repository-supply-chain`.
- Security + branch protection checks completed successfully in apply mode during final validation.

## Lab 4 Output (Permission Audit)

Evidence file:
- `code/training-templates/scripts/ghec/lab4-audit-cloudinfra008-2026-03-02.md`

Key result:
- Organization members read: OK
- Repository collaborators read: OK

## Lab 5 Output (Take-home)

Evidence file:
- `code/training-templates/submissions/team-octo/team-octo-lab5-multi-repo-automation.md`

## Lab 6 Output (Take-home)

Evidence file:
- `code/training-templates/submissions/team-octo/team-octo-lab6-compliance-evidence.md`

## Final Conclusion

All six labs are operational and produced expected outputs in the latest validated run.
