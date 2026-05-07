# What Never Commits

← [Security _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

This file is the agent's checklist before any file is written to or committed. The agent reads this before suggesting a `git add` or writing a file that could contain sensitive content.

## Files That Must Never Enter Git

| File/Pattern | Reason |
|-------------|--------|
| `.env` | Contains real secrets |
| `.env.local`, `.env.development`, `.env.production` | Environment-specific secrets |
| `*.pem`, `*.key`, `*.crt` | Private keys and certificates |
| `*.p12`, `*.pfx` | Certificate bundles |
| `id_rsa`, `id_ed25519`, `*.pub` (private only) | SSH keys |
| `credentials.json`, `service-account.json` | Cloud service credentials |
| `*.sqlite`, `*.db` (production data) | May contain user PII |
| `.aws/credentials`, `.aws/config` | AWS credentials |
| `google-services.json` (with real keys) | Firebase/GCP config with secrets |
| `keystore.jks`, `*.keystore` | Android signing keys |
| `AuthInfo`, `sfdx-project.json` with tokens | Salesforce auth |
| `node_modules/`, `.venv/`, `__pycache__/` | Build artifacts |
| `dist/`, `build/`, `.next/`, `out/` | Build output (usually) |
| `*.log` | May contain sensitive runtime data |
| `.DS_Store`, `Thumbs.db` | OS artifacts |

## .gitignore Baseline

Every project must have a `.gitignore` that includes at minimum:

```gitignore
# Secrets
.env
.env.*
!.env.example

# Keys and credentials
*.pem
*.key
*.p12
service-account.json
credentials.json

# Dependencies
node_modules/
.venv/
__pycache__/
*.pyc

# Build output
dist/
build/
.next/
out/

# OS artifacts
.DS_Store
Thumbs.db

# Logs
*.log
```

## If a Secret Is Accidentally Committed

1. Do not just delete the file and re-commit — the secret is still in git history
2. Use `git filter-repo` or BFG Repo Cleaner to purge it from history
3. Rotate the secret immediately — assume it is compromised from the moment it was committed
4. Force-push the cleaned history (coordinate with any collaborators)

## Agent Check

Before writing any file, if the file name or content matches any pattern above, the agent must:
- Refuse to write the actual secret value
- Instead write the variable reference (`process.env.KEY`, `os.environ["KEY"]`)
- Alert the user if a real secret value appears to have been pasted

## Last Updated
2026-05-07
