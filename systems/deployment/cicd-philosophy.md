# CI/CD Philosophy

← [Deployment _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

## What CI Must Always Do

Every CI pipeline, regardless of stack, must run these checks on every pull request:

1. **Install dependencies** (clean install — no cache shortcuts that hide problems)
2. **Lint** — catch style and static analysis issues before review
3. **Type-check** — if the project uses a typed language
4. **Unit tests** — must pass; a failing test blocks merge
5. **Build** — confirm the project builds without errors

Optional but strongly recommended:
- Integration tests (if they run in reasonable time)
- Security audit (`npm audit`, `pip-audit`, `trivy`, etc.)
- Coverage report (report, not enforce — don't gate on a coverage number)

## What CD Must Do

Continuous deployment to staging triggers automatically on merge to `main` (or `develop`). Production deployment is either:
- Automatic (after staging health check passes) — for low-risk projects
- Manual trigger (for anything user-facing with significant blast radius)

## The Key Principle

**CI is not optional.** If the pipeline is flaky or slow, fix the pipeline — don't skip it. A pipeline that developers routinely bypass is worse than no pipeline at all.

## Deployment Should Be Boring

A deployment event should not require special knowledge, special access, or a specific person. Anyone on the project should be able to deploy by following a documented process.

## Rollback Must Always Be Possible

Before you deploy, know how to roll back:
- Can you redeploy the previous version immediately?
- If the deployment involves a database migration, is it reversible?
- Who needs to be notified of a rollback, and how?

Document this in the project's deployment docs, not just in someone's head.

## Notifications

CI/CD pipelines should notify on:
- Failed build or test run → immediately to the developer who triggered it
- Failed production deployment → immediately to the whole team
- Successful production deployment → team notification (optional, depends on team preference)

## Last Updated
2026-05-07
