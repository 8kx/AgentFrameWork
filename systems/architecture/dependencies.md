# Dependencies

← [Architecture _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

Every dependency is a liability. This file defines how to choose, track, and manage them.

## Before Adding a Dependency

Ask these questions before installing anything:

1. **Is it necessary?** Can this be achieved with the standard library or code you already have in ~20 lines?
2. **Is it maintained?** Check: last commit date, open issues trend, number of maintainers, whether it has a clear owner.
3. **What is its own dependency footprint?** A single package that pulls in 40 transitive dependencies may not be worth it.
4. **Is it appropriately licensed?** Check the licence is compatible with your project (MIT/Apache/BSD are generally safe; GPL has restrictions).
5. **What is the alternative?** Record the alternatives you rejected and why (see [decision-log.md](decision-log.md)).

## Lock Files

Always commit lock files (`package-lock.json`, `yarn.lock`, `poetry.lock`, etc.). They are not optional:
- Without a lock file, CI and teammates get different versions than you
- With a lock file, `npm ci` / `pip install --frozen` installs are reproducible

Never commit `node_modules/`, `.venv/`, or equivalent — they belong in `.gitignore`.

## Version Pinning Strategy

| Context | Strategy |
|---------|---------|
| Production apps | Pin exact versions in lock file; allow patch-level ranges in manifest |
| Libraries/packages | Specify compatible ranges (`^`, `~`); let consumers pin |
| Security-sensitive deps | Pin exact version; monitor for CVEs |
| Dev/test tools | Range is acceptable; exact is safer |

## Upgrade Protocol

1. Update one dependency at a time (makes problems attributable)
2. Read the changelog for breaking changes before upgrading major versions
3. Run the full test suite after upgrading
4. If a major dependency upgrade changes behaviour, create a decision record

## Dependency Register

Each project maintains a `docs/architecture/dependencies.md` that lists:

```markdown
| Package | Version | Purpose | Decision doc |
|---------|---------|---------|-------------|
| [name]  | [ver]   | [why]   | [link or N/A] |
```

This prevents the "why is this installed?" mystery that accumulates in every project.

## Last Updated
2026-05-07
