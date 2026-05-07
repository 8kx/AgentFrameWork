# Environments

← [Deployment _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

## The Three-Stage Model

| Environment | Purpose | Who uses it |
|------------|---------|------------|
| `local` | Development on your machine | Developer only |
| `staging` | Pre-production testing, mirrors production config | Developer + QA |
| `production` | Live, serving real users | Users |

Some projects add a `preview` environment (per-PR deployments). For simple projects, `local` + `production` is sufficient.

## What Differs Between Environments

| Concern | Local | Staging | Production |
|---------|-------|---------|-----------|
| Database | Local or dev DB | Separate staging DB (never production data) | Production DB |
| External services | Sandboxes / test credentials | Sandboxes or staging accounts | Live credentials |
| Debug logging | Verbose | Moderate | Errors only |
| Error reporting | Console | Sentry (staging project) | Sentry (prod project) |
| Feature flags | All on | Configurable | Controlled rollout |

## Environment Variable Strategy

Each environment has its own complete set of environment variables. Never share credentials between environments.

Follow the naming and `.env` conventions from [security/secrets-management.md](../security/secrets-management.md).

```
.env                  ← local (gitignored)
.env.example          ← template (committed)
```

Staging and production variables live in the platform's secrets manager, never in files.

## Never Do This

- Use production data in local or staging environments (PII and compliance risk)
- Share API keys between staging and production
- Connect local development directly to a production database
- Deploy to production without passing through staging first (for anything user-facing)

## Last Updated
2026-05-07
