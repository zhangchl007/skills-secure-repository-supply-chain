# Lab Scripts (Regenerated, Workable Set)

## Labs 1–4 (real GitHub apply workflow)

```bash
cd code/training-templates/scripts/ghec
chmod +x *.sh

# Dry-run equivalent (no writes)
./run-labs-1-4.sh copilottest008 cloudinfra008 zhangchl007/skills-secure-repository-supply-chain false

# Real apply mode
./run-labs-1-4.sh copilottest008 cloudinfra008 zhangchl007/skills-secure-repository-supply-chain true
```

## Labs 5–6 (take-home templates)

```bash
cd code/training-templates/scripts
chmod +x *.sh
./lab5-multi-repo-automation.sh "Octo" "Priya" 10
./lab6-compliance-evidence.sh "Octo" "Priya"
```

## Auth requirement for Labs 1–4 apply

Use real user auth (not env token):

```bash
env -u GITHUB_TOKEN -u GH_TOKEN gh auth status -t
```

If not logged in:

```bash
env -u GITHUB_TOKEN -u GH_TOKEN gh auth login --web --hostname github.com --scopes "repo,admin:org,read:org,security_events"
```
