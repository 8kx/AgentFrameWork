# Release Protocol

← [Deployment _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

## Versioning (Semantic Versioning)

Use semver: `MAJOR.MINOR.PATCH`

| Increment | When |
|-----------|------|
| `MAJOR` | Breaking change — existing users must change something |
| `MINOR` | New feature — backward compatible |
| `PATCH` | Bug fix — backward compatible |

Start at `0.1.0` for projects in development. Move to `1.0.0` when the public API or UI is stable enough to make breaking change promises.

## Release Notes

Every release has release notes. Audience: someone who uses the project but didn't write the code.

Format:
```markdown
## v1.2.0 — 2026-05-07

### Added
- [What new capability exists that didn't before]

### Fixed
- [What was broken and is now working]

### Changed
- [What works differently than before — migration notes if needed]

### Removed
- [What no longer exists]
```

Do not include: internal refactors invisible to users, test changes, or CI tweaks (unless they affect the dev experience).

## Release Checklist

Before cutting a release:
- [ ] All tests pass on the release branch
- [ ] `CHANGELOG.md` is updated with release notes
- [ ] Version number is bumped in the appropriate manifest file
- [ ] Staging deployment is healthy
- [ ] Migrations (if any) have been tested on staging data
- [ ] Rollback plan is known

## Database Migrations

Migrations are the highest-risk part of a release. Rules:
- Migrations must be backward compatible with the previous app version (so you can roll back the app without rolling back the migration)
- Never drop a column or table in the same migration that removes it from code — remove it from code first (deploy), then drop it (separate deploy)
- Test migrations against a copy of production data on staging before releasing

## Rollback

If a production deployment must be rolled back:
1. Redeploy the previous version immediately (do not try to fix forward under pressure)
2. If a migration ran, evaluate whether it's safe to leave in place or must be reverted
3. Document the incident in `docs/decisions/` or a project incident log
4. Root-cause and fix before redeploying

## Last Updated
2026-05-07
