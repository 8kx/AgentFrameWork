# Branching Strategy

← [Git _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

## Core Model

```
main          ← always deployable, protected
└── develop   ← integration branch (optional, for larger teams)
    ├── feature/[name]   ← new features
    ├── fix/[name]       ← bug fixes
    ├── chore/[name]     ← maintenance, dependency updates
    └── docs/[name]      ← documentation only
```

For solo projects or small teams, `develop` is optional — branch directly from `main`.

## Branch Naming

```
feature/user-authentication
feature/dashboard-redesign
fix/login-redirect-loop
fix/null-pointer-in-user-service
chore/upgrade-dependencies-may-2026
docs/update-api-reference
```

Rules:
- Lowercase, hyphenated
- Prefixed with type (`feature/`, `fix/`, `chore/`, `docs/`, `hotfix/`)
- Short but descriptive — the name should tell you what the branch is about without reading the commits
- No personal names in branch names (`john/auth-fix` → `fix/auth-redirect`)

## Branch Lifetime

Keep branches short-lived. A feature branch should exist for hours to a few days, not weeks. Long-lived branches diverge from `main`, accumulate merge conflicts, and slow down delivery.

If a feature takes longer than a week:
- Use feature flags to merge incomplete work to `main` behind a flag
- Or break the feature into smaller shippable increments

## Hotfixes

For production emergencies:
```
main → hotfix/[name] → PR back to main (and develop if it exists)
```

Hotfix branches are created from `main`, not from `develop`. After merging to `main`, merge the fix to `develop` as well.

## Stale Branch Hygiene

Delete branches after merging. A repository with 50 stale branches is a repository where no one can find anything.

## Last Updated
2026-05-07
