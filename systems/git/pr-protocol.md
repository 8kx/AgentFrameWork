# PR Protocol

← [Git _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

## PR Description Template

Every PR must have a description. Use this structure:

```markdown
## What
[1-3 sentences describing what changed]

## Why
[Why was this change needed? What problem does it solve?]

## How
[Optional: non-obvious implementation decisions or approach notes]

## Testing
- [ ] Unit tests pass
- [ ] Manual test: [describe what you tested]
- [ ] Edge cases considered: [list them]

## Screenshots (if UI)
[Before/after or just the new state]

## Notes for Reviewer
[Anything the reviewer should know: areas of uncertainty, trade-offs made, follow-up work]
```

## PR Size

Keep PRs small and focused. A PR that touches 20 files across 5 concerns is hard to review well and slow to merge.

- One PR = one concern (one feature, one fix, one refactor)
- If a PR is getting large, split it
- Target: reviewable in 30 minutes. If you can't review it in 30 minutes, it's probably too big.

## Review Checklist (for the reviewer)

- [ ] The code does what the description says
- [ ] Logic is correct — trace through the main paths
- [ ] Edge cases and error paths are handled
- [ ] No security issues (secrets, auth checks, input validation)
- [ ] Tests cover the change and are meaningful
- [ ] Naming and structure follow project conventions
- [ ] No obvious performance issues

## Review Etiquette

**Be specific.** "This is wrong" is not useful feedback. "This will throw when `user` is null on line 14" is.

**Distinguish blocking from non-blocking.** Prefix comments:
- `[blocking]` — must be resolved before merge
- `[suggestion]` — worth considering but not required
- `[nit]` — minor style preference, author's call

**Approve when it's good enough, not when it's perfect.** Perfect is the enemy of shipped.

## Self-Review

Before requesting a review, do a self-review as if you were a stranger reading this PR for the first time:
- Read the diff top to bottom
- Check every item in the review checklist above
- Remove any debug code, commented-out blocks, or stray console.log

## Merging

- Squash merge for feature branches into `main` (clean history)
- Merge commit for release branches (preserve history)
- Never force-push to `main` or `develop`

## Last Updated
2026-05-07
