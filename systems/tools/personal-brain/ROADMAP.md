# Personal Brain MCP — Roadmap

← [Tools _INDEX.md](../_INDEX.md) ← [FRAMEWORK.mdc](../../../.cursor/rules/FRAMEWORK.mdc)

## Stage 1: Foundation (MVP)
- [ ] Create new repo using AgentFrameWork scaffold (`init framework`)
- [ ] Set up Supabase project, create `memories` and `todos` tables
- [ ] Build Cloudflare Worker with basic MCP server (HTTP/SSE)
- [ ] Implement `remember` and `recall` tools (vector search)
- [ ] Implement `get_recent` and `capture_todo` tools
- [ ] Add bearer token auth (development-grade)
- [ ] Connect to Cursor via local MCP config
- [ ] Verify: store a memory in Cursor, recall it in a new session

## Stage 2: Cross-Device Access
- [ ] Deploy to Cloudflare Workers production
- [ ] Implement OAuth 2.0 with `https://claude.ai/api/mcp/auth_callback` redirect URI
- [ ] Connect to Claude.ai via Settings → Connectors
- [ ] Verify: store in Cursor, recall on Claude.ai web, and vice versa

## Stage 3: Learnings Integration
- [ ] Add `insights` table
- [ ] Implement `sync_insights` tool
- [ ] Add `get_context` tool (session-relevant retrieval)
- [ ] Wire INSIGHTS.md sync to learning-protocol.md compile step

## Stage 4: Intelligence
- [ ] Implement hybrid search (pgvector + BM25)
- [ ] Add deduplication (don't store the same insight twice)
- [ ] Weekly summary tool: surface what was stored this week
- [ ] Auto-tagging based on content

## Stage 5: Polish
- [ ] Simple web UI for browsing/editing memories (optional)
- [ ] Export tool (dump to markdown)
- [ ] Multi-workspace support (isolate work project memories from personal)

## Last Updated
2026-05-07
