---
name: upgrade-framework
description: Audit an existing project against the current AgentFrameWork standards and walk through bringing it up to date. Use when the user says "upgrade framework", "audit framework", "sync to latest standards", "check framework compliance", or wants to know if their project is up to date with the framework.
---

# Upgrade Framework

Audit the current project against the AgentFrameWork compliance checklist and apply approved fixes. Always audits first — never changes anything without user approval.

## Phase 1: Audit

Read `scaffold/upgrade-checklist.md` from the framework repo.

Check each item against the current project. Produce a gap report:

```
Framework Audit Report — [project name]
Current framework version: [from FRAMEWORK.mdc, or "not found"]
Latest framework version:  [from CHANGELOG.md]
Audited: [today's date]

Layer 0: Root
  ✓ FRAMEWORK.mdc present
  ⚠ framework-version: 1.0.0 (latest: 1.2.0)

Layer 1: Core
  ✓ ACTIVE.md present and under 20 lines
  ✗ INSIGHTS.md missing
  ⚠ .gitignore missing .env entry

Layer 2: Subsystems
  ✓ systems/coding/_INDEX.md
  ✗ systems/security/ — missing entirely
  ✓ systems/git/_INDEX.md

Layer 3: Documentation Health
  ⚠ 3 modules have no corresponding .md docs

Layer 4: Tracker Health
  ✓ ACTIVE.md recently updated
  ✗ No compiled logs yet

SUMMARY: 3 critical gaps | 3 warnings | 4 passing
```

Read the project's `FRAMEWORK.mdc` for an `exceptions:` block — skip any excepted checks with a note.

## Phase 2: Triage

For each non-passing item, present it with:
- One-line description of what's missing or outdated
- Estimated effort: `quick` (< 2 min) | `medium` (5-10 min) | `involved` (requires decisions)

Ask: "Apply all quick fixes automatically? Then we'll go through the rest."

Accept batch decisions:
- "apply all" → apply everything
- "apply all critical" → apply ✗ items only, skip ⚠
- "skip all" → log everything as deferred in ACTIVE.md

For each individual item not batch-decided, ask apply/skip/never.

## Phase 3: Apply

For each approved item:
1. Make the minimal change (create missing file from template, update stale field, etc.)
2. Log the change in `systems/tracker/log/raw/[today].md`
3. After all changes are applied, update `framework-version` in `FRAMEWORK.mdc`

## Phase 4: Report

```
Upgrade complete.
Applied: [N] changes
Skipped: [N] items
Deferred: [N] items (added to ACTIVE.md goals)

Project is now at framework v[version].
```

## Framework Repo Base URL
`https://raw.githubusercontent.com/[owner]/AgentFrameWork/main`

Update `[owner]` to the actual GitHub username after repo is created.
