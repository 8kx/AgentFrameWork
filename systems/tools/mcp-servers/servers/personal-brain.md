# MCP Server: Personal Brain

← [MCP Servers _INDEX.md](../_INDEX.md) ← [FRAMEWORK.mdc](../../../../.cursor/rules/FRAMEWORK.mdc)

> Connection doc for the personal second brain MCP server. See [personal-brain/DESIGN.md](../../personal-brain/DESIGN.md) for architecture and build details.

## Connection

- **URL:** _(to be deployed — fill in after deployment)_
- **Auth:** OAuth 2.0
- **Connected in:** Cursor + Claude.ai (web, Desktop, mobile, Claude Code)
- **Setup:** Claude.ai → Settings → Connectors → add server URL → OAuth flow

## Tools Exposed

| Tool | Parameters | What it does |
|------|-----------|-------------|
| `remember` | `content: string, tags?: string[], context?: string` | Store a note, insight, or thought |
| `recall` | `query: string, limit?: number` | Semantic search across stored memories |
| `get_recent` | `limit?: number` | Retrieve N most recent entries |
| `capture_todo` | `content: string, priority?: 'high'\|'normal'\|'low'` | Quick task capture |
| `get_context` | _(none)_ | Return top relevant entries for the current session |
| `sync_insights` | `insights: string[]` | Push curated INSIGHTS.md content into the brain |

## When to Use

The agent reaches for this server when:
- Asked to "remember" something for future sessions
- Asked to "recall" information from past sessions
- A user says "add this to my brain" or "store this"
- Starting a new session and needing cross-device context
- Compiling learnings and syncing INSIGHTS.md

## Status
Planned — see [ROADMAP.md](../../personal-brain/ROADMAP.md)

## Last Updated
2026-05-07
