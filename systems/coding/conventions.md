# Conventions

← [Coding _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

These are abstract conventions. Project-specific overrides (e.g. snake_case vs camelCase for a particular stack) go in the project's own `conventions.md`.

## Naming Principles

| Thing | Convention |
|-------|-----------|
| Variables | Descriptive nouns: `userCount`, `responseBody`, `isLoading` |
| Functions | Verb phrases: `fetchUser`, `validateInput`, `handleError` |
| Booleans | `is`, `has`, `can`, `should` prefix: `isAuthenticated`, `hasError` |
| Constants | Uppercase with underscores: `MAX_RETRIES`, `BASE_URL` |
| Files | Lowercase, hyphenated: `user-service.ts`, `auth-middleware.py` |
| Directories | Lowercase, hyphenated, plural for collections: `components/`, `utils/` |

## File Structure

Every file should have a clear single responsibility. Structure within a file (top to bottom):
1. Imports / dependencies
2. Constants and types
3. Main logic / exports
4. Private helpers (bottom, not top)

## Function Design

- Default to pure functions (same input → same output, no side effects)
- Maximum of 3-4 parameters; beyond that, use an options object/struct
- Return early to avoid deep nesting (guard clauses over nested conditionals)
- If a function is longer than 40 lines, question whether it should be split

## Project-Level Overrides

When starting a project, create a `conventions.md` in the project docs that extends this file with stack-specific rules. The project-level file wins on conflicts.

## Last Updated
2026-05-07
