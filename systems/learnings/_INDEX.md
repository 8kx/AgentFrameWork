# Learnings Subsystem

← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

The growth and intelligence arm of the framework. Captures insights, researches new approaches, and compiles periodic reviews. Operates silently during work; surfaces on demand.

## Contents

| File | Purpose |
|------|---------|
| [INSIGHTS.md](INSIGHTS.md) | Curated top insights — tiny, always loaded in context |
| [learning-protocol.md](learning-protocol.md) | Rules for passive capture, research, and review |
| `log/raw/YYYY-MM-DD.md` | Passive atomic captures (auto-created by agent) |
| `log/compiled/YYYY-WXX.md` | Weekly compiled learning summaries |
| `research/YYYY-MM-DD-topic.md` | Web research results |
| `reviews/YYYY-WXX-review.md` | Newsletter-style periodic digests |

## Trigger Phrases

| Phrase | Action |
|--------|--------|
| `"compile learnings"` / `"learning review"` | Generate digest from raw logs + research since last compile |
| `"search for [topic]"` / `"what's new in [topic]"` | Web search → save findings → summarise → ask about adoption |
| `"what have I learned"` | Read INSIGHTS.md + latest compiled log → summarise |
| `"update insights"` | Manually prompt a curation pass on INSIGHTS.md |

## Token Budget

**INSIGHTS.md is always loaded.** It must stay under 15 lines.
**Raw logs are never loaded** unless compiling.
**Research and review files load only when explicitly requested.**

## Last Updated
2026-05-07
