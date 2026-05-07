# Personal Brain MCP — Design

← [Tools _INDEX.md](../_INDEX.md) ← [FRAMEWORK.mdc](../../../.cursor/rules/FRAMEWORK.mdc)

A personal MCP server that functions as your short-form second brain — accessible from any device via Claude.ai, Cursor, or any MCP-compatible surface.

## Goal

One persistent knowledge store, always reachable:
- From any machine (home, work, new laptop)
- From any Claude surface (web, Desktop, mobile, Claude Code, Cursor)
- Without requiring any local file or project

## Architecture

```
Claude.ai / Cursor
    ↕ MCP over HTTPS (OAuth 2.0)
Cloudflare Workers (edge runtime)
    ↕ REST / pgvector queries
Supabase (Postgres + pgvector)
    - memories table
    - todos table
    - insights table
```

### Why This Stack

| Component | Why |
|-----------|-----|
| Cloudflare Workers | Serverless, global edge, HTTPS automatic, generous free tier, no cold starts |
| Supabase | Managed Postgres + pgvector (semantic search), free tier, simple auth, REST API |
| OAuth 2.0 | Required for Claude.ai remote MCP — enables cross-device, cross-surface auth |

## Data Model

```sql
-- Core memory store
memories (
  id          uuid primary key,
  content     text not null,
  tags        text[],
  context     text,                    -- optional: what was happening when stored
  embedding   vector(1536),            -- pgvector for semantic search
  created_at  timestamptz default now()
)

-- Quick capture
todos (
  id          uuid primary key,
  content     text not null,
  priority    text default 'normal',   -- high | normal | low
  status      text default 'open',     -- open | done
  created_at  timestamptz default now()
)

-- Curated insights (synced from INSIGHTS.md)
insights (
  id          uuid primary key,
  content     text not null,
  source      text,                    -- where this insight came from
  relevance   integer default 5,       -- 1-10, used for ordering
  created_at  timestamptz default now(),
  updated_at  timestamptz default now()
)
```

## Search Strategy

Hybrid search (same pattern as `mcp-brain` / `second-brain` projects):
1. Vector similarity search via pgvector (semantic meaning)
2. BM25 full-text search (keyword matching)
3. Results ranked and merged

## Authentication

OAuth 2.0 with Cloudflare Access or a simple bearer token approach during development. For Claude.ai remote MCP, must use the unified redirect URI: `https://claude.ai/api/mcp/auth_callback`.

## Relationship to Learnings Subsystem

- `INSIGHTS.md` is the local, always-loaded cached view of curated insights
- The personal brain is the persistent source of truth
- `sync_insights()` tool keeps them in sync
- When `INSIGHTS.md` is pruned, archived insights live in the brain, not deleted

## Repository

The actual server is a separate repository, bootstrapped with this framework. See [ROADMAP.md](ROADMAP.md) for build stages.

## Last Updated
2026-05-07
