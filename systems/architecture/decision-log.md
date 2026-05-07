# Decision Log

← [Architecture _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

Architectural decisions get forgotten. This protocol ensures significant choices are recorded where they can be found and revisited.

## What Qualifies as a Decision to Log

Record a decision when it:
- Chose one approach over plausible alternatives
- Will be hard or costly to reverse
- Is non-obvious enough that future-you would wonder "why did we do it this way?"
- Involves a third-party library or external service

Small implementation choices do not need a log entry. Structural or directional choices do.

## Decision Record Format

Create one file per decision in `docs/decisions/` in the project. Name it `NNNN-short-title.md`:

```markdown
# NNNN: [Short Title]

**Date:** YYYY-MM-DD
**Status:** Proposed | Accepted | Superseded by [NNNN]
**Deciders:** [who was involved]

## Context
What was the situation that required a decision? What constraints existed?

## Decision
What was decided?

## Alternatives Considered
| Option | Reason rejected |
|--------|----------------|
| [Alt 1] | [Why not] |
| [Alt 2] | [Why not] |

## Consequences
What becomes easier? What becomes harder? What is now ruled out?
```

## How the Agent Uses This

When asked to make an architectural decision, the agent:
1. Checks `docs/decisions/` to see if it has been addressed before
2. If a relevant decision exists, reads it before proceeding
3. When making a new significant decision, creates a decision record
4. Never re-opens a settled decision without explicit instruction

## Last Updated
2026-05-07
