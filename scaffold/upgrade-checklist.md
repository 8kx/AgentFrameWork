# Framework Upgrade Checklist

← [Scaffold _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../.cursor/rules/FRAMEWORK.mdc)

**This is the authoritative source used by the `upgrade-framework` skill.** When the framework evolves, update this file — the skill reads it to know what to audit.

## How the Upgrade Skill Uses This

1. Reads this file to get the current compliance requirements
2. Checks each item against the project being audited
3. For each failure: reports `✗ missing` or `⚠ outdated`
4. Presents results as a gap report, triages with user, applies approved changes

---

## Layer 0: Root

| Check | Pass condition |
|-------|---------------|
| `FRAMEWORK.mdc` exists in `.cursor/rules/` | File present |
| `FRAMEWORK.mdc` has `framework-version` field | Field present and parseable |
| `framework-version` matches current | Value equals current framework version in `CHANGELOG.md` |

## Layer 1: Core Subsystems (minimum viable)

| Check | Pass condition |
|-------|---------------|
| `systems/tracker/ACTIVE.md` exists | File present and under 20 lines |
| `systems/learnings/INSIGHTS.md` exists | File present and under 15 lines |
| `systems/security/what-never-commits.md` accessible | File present (local or via reference) |
| `.gitignore` has security baseline | Contains `.env`, `*.pem`, `*.key` at minimum |

## Layer 2: Subsystem Coverage

| Subsystem | Check |
|-----------|-------|
| `coding/` | `_INDEX.md` present; `best-practices.md` and `conventions.md` present |
| `design/` | `_INDEX.md` present; `tokens.md` present (if project has UI) |
| `architecture/` | `_INDEX.md` present; `decision-log.md` present |
| `security/` | `_INDEX.md` present; `secrets-management.md` present |
| `git/` | `_INDEX.md` present; `commit-conventions.md` present |
| `documentation/` | `_INDEX.md` present; `doc-update-protocol.md` present |
| `planning/` | `_INDEX.md` present; `stages.md` present |

## Layer 3: Documentation Health

| Check | Pass condition |
|-------|---------------|
| `docs/` directory exists in project | Directory present |
| Key modules have corresponding `.md` docs | Agent samples 3-5 key files, checks for docs |
| No docs are flagged as stale (>6 months) | `Last Updated` dates within threshold |

## Layer 4: Tracker Health

| Check | Pass condition |
|-------|---------------|
| `ACTIVE.md` has been updated recently | `Last 3 Actions` date within 7 days (if project is active) |
| `ACTIVE.md` under line limit | File is 25 lines or fewer |
| Current Task block present when goal is in-progress | If any goal is marked `[~]`, a `## Current Task` block with sub-step checkboxes exists |
| At least one compiled log exists | `log/compiled/` has at least one file |

## Exceptions

Projects can declare framework exceptions in their `FRAMEWORK.mdc` under an `exceptions:` block:

```yaml
exceptions:
  - design/: "CLI tool — no UI"
  - tracker/compiled: "New project — not compiled yet"
```

The upgrade skill reads exceptions and skips those checks with a note.

## Last Updated
2026-05-10
