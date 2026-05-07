# Commit Conventions

← [Git _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

## Format

Follow Conventional Commits (https://www.conventionalcommits.org):

```
<type>(<scope>): <subject>

[optional body]

[optional footer]
```

## Types

| Type | When to use |
|------|------------|
| `feat` | A new feature |
| `fix` | A bug fix |
| `docs` | Documentation only |
| `style` | Formatting, whitespace — no logic change |
| `refactor` | Code restructured — no feature or fix |
| `test` | Adding or updating tests |
| `chore` | Build process, dependencies, tooling |
| `perf` | Performance improvement |
| `ci` | CI/CD configuration |
| `revert` | Reverting a previous commit |

## Subject Line Rules

- Imperative mood: "add user auth" not "added user auth" or "adds user auth"
- Lowercase after the colon
- No period at the end
- Maximum 72 characters
- Describe the **what**, not the **how**

## When to Write a Body

Write a body when the subject alone doesn't convey why the change was made. The body answers "why?" not "what?".

```
fix(auth): handle expired token in refresh flow

Previously the refresh endpoint returned a 500 when the refresh token
had expired. It now returns a 401 with a clear error code so clients
can prompt the user to log in again.
```

## Atomic Commits

Each commit should represent one logical change. If you find yourself writing "and" in the subject line, consider splitting the commit.

**Good:** `feat(auth): add login endpoint`
**Bad:** `add login, fix user model, update tests, rename files`

## Breaking Changes

Indicate breaking changes in the footer:
```
feat(api): change user response shape

BREAKING CHANGE: The `name` field has been split into `firstName` and `lastName`.
```

## Last Updated
2026-05-07
