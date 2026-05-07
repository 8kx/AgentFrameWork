---
name: upgrade-framework
description: Audit an existing project against the current AgentFrameWork standards and walk through bringing it up to date. Use when the user says "upgrade framework", "audit framework", "sync to latest standards", "check framework compliance", or wants to know if their project is up to date with the framework.
---

# Upgrade Framework

Audit the current project against the AgentFrameWork compliance checklist and apply approved fixes. Always audits first - never changes anything without user approval.

## Source Resolution (always in this order)

1. **Local path** - read `~/.cursor/agentframework.path` for the local repo location. Read `scaffold/upgrade-checklist.md` directly from there.
2. **GitHub raw** - if no local path: `https://raw.githubusercontent.com/8kx/AgentFrameWork/main/scaffold/upgrade-checklist.md`
3. **Embedded checklist** - if both fail, use the embedded checklist at the bottom of this file.

## Phase 1: Audit

Read the upgrade checklist from source. Check each item against the current project.

Produce a gap report:

```
Framework Audit Report - [project name]
Current framework version: [from FRAMEWORK.mdc, or "not found"]
Latest framework version:  [from source CHANGELOG.md]
Audited: [today's date]
Source: [local|github|embedded]

Layer 0: Root
  [status] FRAMEWORK.mdc present
  [status] framework-version field

Layer 1: Core
  [status] ACTIVE.md present and under 20 lines
  [status] INSIGHTS.md present and under 15 lines
  [status] .gitignore has security baseline

Layer 2: Subsystems
  [status per subsystem _INDEX.md]

Layer 3: Documentation Health
  [status] docs/ directory exists
  [status] key modules have .md docs

Layer 4: Tracker Health
  [status] ACTIVE.md recently updated
  [status] compiled log exists

SUMMARY: X critical gaps | X warnings | X passing
```

Check the project's `FRAMEWORK.mdc` for an `exceptions:` block - skip excepted checks with a note.

## Phase 2: Triage

For each non-passing item present:
- One-line description of what is missing or outdated
- Effort: `quick` (under 2 min) | `medium` (5-10 min) | `involved` (requires decisions)

Ask: "Apply all quick fixes automatically? Then we'll go through the rest."

Batch options: "apply all" / "apply all critical" / "skip all"

## Phase 3: Apply

For each approved item:
1. Make the minimal change (create missing file from source template, update stale field)
2. Log in `systems/tracker/log/raw/[today].md`
3. After all changes, update `framework-version` in `FRAMEWORK.mdc`

## Phase 4: Report

```
Upgrade complete.
Applied: N changes
Skipped: N items
Deferred: N items (added to ACTIVE.md goals)

Project is now at framework v[version].
```

---

## Embedded Upgrade Checklist (fallback)

```
Layer 0: Root
- FRAMEWORK.mdc exists in .cursor/rules/
- FRAMEWORK.mdc has framework-version field

Layer 1: Core (minimum viable)
- systems/tracker/ACTIVE.md exists and is under 20 lines
- systems/learnings/INSIGHTS.md exists and is under 15 lines
- .gitignore contains .env and *.pem at minimum

Layer 2: Subsystem Coverage
- systems/coding/_INDEX.md present
- systems/design/_INDEX.md present (if project has UI)
- systems/architecture/_INDEX.md present
- systems/security/_INDEX.md present
- systems/git/_INDEX.md present
- systems/documentation/_INDEX.md present

Layer 3: Documentation Health
- docs/ directory exists in project

Layer 4: Tracker Health
- ACTIVE.md Last 3 Actions updated within 7 days (if project active)
```
