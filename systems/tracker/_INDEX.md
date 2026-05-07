# Tracker Subsystem

← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

The project manager subsystem. Tracks what you've done, what's active, and compiles weekly summaries on demand. Operates silently in the background during normal work.

## Contents

| File | Purpose |
|------|---------|
| [ACTIVE.md](ACTIVE.md) | Current state — tiny, always loaded in context |
| [tracking-protocol.md](tracking-protocol.md) | Rules for silent logging and compile behaviour |
| `log/raw/YYYY-MM-DD.md` | Daily append-only log (auto-created by agent) |
| `log/compiled/YYYY-WXX.md` | Weekly summaries (generated on demand) |

## Trigger Phrases

| Phrase | Action |
|--------|--------|
| `"compile log"` | Generate weekly summary from raw logs since last compile |
| `"what have I done"` / `"project summary"` | Read ACTIVE.md + latest compiled log → summarise |
| `"what's next"` | Read ACTIVE.md → suggest next action |
| `"update status"` | Manually update ACTIVE.md goal or blockers |

## Token Budget

**ACTIVE.md is always loaded.** It must stay under 20 lines.
**Raw logs are never loaded** unless compiling.
**Compiled summaries are loaded only when explicitly requested.**

## Last Updated
2026-05-07
