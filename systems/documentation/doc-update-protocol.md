# Doc Update Protocol

← [Documentation _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

The living-docs mandate in action. Follow this protocol on every code change.

## The Cascade

```
Code changes
    ↓
1. Is there a doc for this specific file/module?
   YES → update it
   NO  → create one from template

2. Is the module's parent _INDEX.md up to date?
   YES → update "Last Updated" date
   NO  → add the new doc as a link, update date

3. Does the parent's parent know about this area?
   YES → update "Last Updated" date
   NO  → create the intermediate _INDEX.md, link up

4. Continue bubbling until FRAMEWORK.mdc is aware
```

## File Naming

- Module docs: same name as the module, `.md` extension (`user-service.md` for `user-service.ts`)
- Feature docs: `feature-name.md` in `docs/features/`
- Architectural decisions: `NNNN-short-title.md` in `docs/decisions/`
- All `_INDEX.md` files use exactly that name

## What a Doc Must Contain (Minimum)

Every module or feature doc must answer:
1. **What is this?** — one sentence
2. **Why does it exist?** — the problem it solves
3. **How is it used?** — the interface (key functions, inputs, outputs)
4. **What are the gotchas?** — non-obvious constraints or behaviours

Use the templates in `templates/` as the starting point.

## When Docs Become Stale

A doc is stale when the code it describes has changed meaningfully without the doc being updated. The agent checks for staleness when touching existing code by comparing the doc's "Last Updated" date to the file's last modification.

If a doc is more than one major refactor behind:
1. Flag it with `> ⚠ This doc may be outdated. Last updated: [date]` at the top
2. Update it as part of the current task, or create a task to update it

## Breadcrumb Standard

Every doc must start with a breadcrumb linking back to its parent in the hierarchy:

```markdown
← [Parent _INDEX.md](../_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)
```

This makes navigation possible without a file tree.

## Last Updated
2026-05-07
