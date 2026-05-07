# MCP Protocol

← [MCP Servers _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../../.cursor/rules/FRAMEWORK.mdc)

## What Is an MCP Server?

An MCP (Model Context Protocol) server exposes tools the agent can call — database queries, external API calls, file operations, custom logic. The agent discovers available tools and calls them during a session.

## Connection Types

| Type | Use case |
|------|---------|
| Local (stdio) | Server runs on your machine, connected in Cursor settings |
| Remote (HTTP/SSE) | Server runs in cloud, connected via URL in Cursor or Claude.ai |

Remote servers support Claude.ai web, Desktop, mobile, and Cursor simultaneously via OAuth 2.0.

## Documenting a Server

Create `servers/[name].md` for each connected server:

```markdown
# MCP Server: [Name]

← [MCP Servers _INDEX.md](../_INDEX.md)

## Connection
- **URL:** [server URL or "local"]
- **Auth:** [OAuth 2.0 / API key / none]
- **Connected in:** [Cursor / Claude.ai / both]

## Tools Exposed

| Tool | Parameters | What it does |
|------|-----------|-------------|
| `tool_name` | `param: type` | Description |

## When to Use
[Trigger conditions — what tasks should prompt the agent to reach for this server]

## Status
Active | Paused | Deprecated

## Last Updated
YYYY-MM-DD
```

## Last Updated
2026-05-07
