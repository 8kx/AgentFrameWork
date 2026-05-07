# Best Practices

← [Coding _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

Stack-agnostic principles. Apply these before any language or framework conventions.

## Fundamentals

**Clarity over cleverness.** Code is read far more than it is written. Optimise for the next reader — which is usually you in six months.

**Small units.** Functions do one thing. Files have one clear purpose. If you need to write "and" to describe what something does, split it.

**Explicit over implicit.** Avoid hidden behaviour, magic values, and side effects that aren't obvious from the call site.

**Fail loudly.** Errors should surface immediately at the point of failure, not silently propagate into bad state. See [error-handling.md](error-handling.md).

**Delete before you add.** Before writing new code to solve a problem, check if existing code already solves it.

## Code Organisation

- Group related things together; separate unrelated things
- Keep files short enough to understand in one reading (rough guide: under 300 lines)
- Prefer flat structures over deeply nested ones
- Co-locate tests with the code they test

## Naming

See [conventions.md](conventions.md) for specifics, but the principle: names should answer "what is this?" without needing to read the implementation. If you need a comment to explain a variable name, rename the variable.

## Comments

Comments explain **why**, not **what**. The code shows what. Comments explain intent, constraints, trade-offs, and non-obvious decisions.

Bad: `// increment counter`
Good: `// retry limit is 3 to match the upstream API's own retry budget`

Never leave TODO comments in production code without a linked issue.

## Dependencies

Before adding a dependency, consult [architecture/dependencies.md](../architecture/dependencies.md). Every dependency is a liability. Add only what earns its place.

## AI-Generated Code

All AI-generated code must pass the review protocol in [ai-code-review.md](ai-code-review.md) before being treated as owned. Draft ≠ production.

## Last Updated
2026-05-07
