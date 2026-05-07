# Personal Brain — MCP Tool Definitions

← [Personal Brain](../DESIGN.md) ← [FRAMEWORK.mdc](../../../../.cursor/rules/FRAMEWORK.mdc)

Full specification for each MCP tool the server exposes.

## `remember`

Store a note, insight, or thought into the brain.

```
Input:
  content   string (required) — the thing to remember
  tags      string[] (optional) — categorisation tags
  context   string (optional) — what you were doing when you stored this

Output:
  { id: string, created_at: string }
```

Use when: user says "remember this", "store this", "add to brain", or after any significant insight capture.

## `recall`

Semantic search across all stored memories.

```
Input:
  query   string (required) — what to search for
  limit   number (optional, default 5) — max results

Output:
  Array of { id, content, tags, context, created_at, similarity_score }
```

Use when: user asks "do I know anything about X?", "what did I store about Y?", or when context from past sessions would be relevant.

## `get_recent`

Retrieve the most recently stored entries.

```
Input:
  limit   number (optional, default 10)

Output:
  Array of { id, content, tags, created_at }
```

Use when: user asks "what did I recently store?", "what's in my brain?", or at session start to get current context.

## `capture_todo`

Quick task capture — does not require a project context.

```
Input:
  content    string (required) — the task
  priority   'high' | 'normal' | 'low' (optional, default 'normal')

Output:
  { id: string, created_at: string }
```

Use when: user says "remind me to", "add todo", "capture this task", or any quick capture outside of a project tracker.

## `get_context`

Retrieve the most contextually relevant memories for the current session (based on recent conversation).

```
Input:
  (none — uses current conversation context)

Output:
  Array of { id, content, tags, relevance_score }
```

Use when: starting a new session and relevant past knowledge might help, or when the agent needs to check if something was previously stored.

## `sync_insights`

Push the current INSIGHTS.md content into the brain's insights table, replacing stale entries.

```
Input:
  insights   string[] (required) — array of insight strings from INSIGHTS.md

Output:
  { synced: number, replaced: number }
```

Use when: INSIGHTS.md is updated after a compile, or when pruned insights need to be archived to the brain before removal.

## Last Updated
2026-05-07
