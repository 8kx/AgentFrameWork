# Secrets Management

← [Security _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

## The Rule

Secrets never appear in source code. Not in a comment. Not in a test. Not in a config file that gets committed. If it has a value that grants access to something, it lives in environment variables only.

## Environment Variables

**Development:** Use a `.env` file locally. This file is in `.gitignore` and never committed. Commit a `.env.example` that contains every required key with placeholder values and comments explaining what each key is for.

```
# .env.example
DATABASE_URL=postgresql://user:password@localhost:5432/dbname
API_KEY=your-api-key-here          # Get this from the vendor dashboard
JWT_SECRET=change-this-to-random-string-minimum-32-chars
```

**Staging/Production:** Use your hosting platform's secrets manager:
- Railway / Render / Fly.io → environment variables in dashboard
- AWS → Secrets Manager or Parameter Store
- Vercel / Netlify → environment variables in project settings
- GitHub Actions → repository secrets

Never interpolate secrets into deployment scripts or CI config files as plain text.

## Naming Conventions

```
DATABASE_URL          # Connection strings
[SERVICE]_API_KEY     # Third-party API keys: STRIPE_API_KEY, SENDGRID_API_KEY
[SERVICE]_SECRET      # Shared secrets: JWT_SECRET, WEBHOOK_SECRET
[SERVICE]_TOKEN       # Auth tokens: GITHUB_TOKEN
[ENV]_[NAME]          # Environment-prefixed: PROD_DATABASE_URL (when needed)
```

Always use SCREAMING_SNAKE_CASE. Always prefix with the service name when it's a third-party key.

## How the Agent Handles Secrets

When asked to write code that uses a secret:
- Reference it as `process.env.KEY_NAME`, `os.environ["KEY_NAME"]`, or equivalent
- Never write an actual secret value — use placeholder comments like `# set in .env`
- If the user pastes a real secret into the chat by mistake, do not include it in any file; ask the user to rotate it immediately

## Rotation Protocol

When a secret is exposed (accidentally committed, shared in a chat, visible in logs):
1. Rotate it immediately at the source (the service's dashboard)
2. Update the new value in all environments
3. Assume the old value is compromised

## Last Updated
2026-05-07
