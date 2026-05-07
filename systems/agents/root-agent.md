# Root Agent — Design Doc

← [Agents _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

**Status:** Not built — design only. This doc exists to future-proof the framework architecture.

---

## What the Root Agent Is

A singular agent that sits above all individual projects. Where each project's `FRAMEWORK.mdc` governs work *within* that project, the root agent governs work *across* projects.

```
Root Agent
├── Project A (FRAMEWORK.mdc)
│   ├── ACTIVE.md
│   └── INSIGHTS.md
├── Project B (FRAMEWORK.mdc)
│   ├── ACTIVE.md
│   └── INSIGHTS.md
└── Project C (FRAMEWORK.mdc)
    ├── ACTIVE.md
    └── INSIGHTS.md
```

## What It Can Do

- **Navigate** — open, read, and switch between any project
- **Summarize** — "what am I working on across all projects right now?"
- **Cross-project work** — make changes in one project, then another, in one session
- **Unified tracker** — compile `ACTIVE.md` from every project into a single status view
- **Cross-project learnings** — surface insights from one project that apply to another
- **Triage** — "which project needs the most attention today?"

## The Standard Interface

Every project already exposes a consistent interface the root agent can read:

| File | What it tells the root agent |
|------|------------------------------|
| `.cursor/rules/FRAMEWORK.mdc` | Project identity, version, subsystems |
| `systems/tracker/ACTIVE.md` | Current focus, goals, blockers |
| `systems/learnings/INSIGHTS.md` | Project knowledge state |
| `systems/planning/` | What stage the project is in |
| `README.md` | Project description in plain language |

The root agent does not need to understand the internals of any project — it reads these five touchpoints and has enough context to navigate, summarize, and hand off to the project-level agent.

## Project Discovery: The Registry

The root agent discovers projects via `~/.cursor/project-registry.md` — a file maintained by the install script and updated whenever `init framework` is run in a new project.

```markdown
# Project Registry

| ID | Name | Path | Status | Last Active |
|----|------|------|--------|------------|
| af-001 | AgentFrameWork | D:\GitHub\AgentFrameWork | Active | 2026-05-07 |
| af-002 | [project name] | [path] | Active | YYYY-MM-DD |
```

Every project gets a stable `project-id` (format: `af-NNN`) stamped into its `FRAMEWORK.mdc` at init time. The root agent uses this ID to refer to projects unambiguously.

## Handoff Protocol

When the root agent picks up a project for active work:

```
1. Read project's FRAMEWORK.mdc — get project-id, version, subsystems
2. Read ACTIVE.md — get current state
3. Read INSIGHTS.md — get knowledge state
4. Read latest compiled tracker log (if exists)
5. Report: "[Project name] — Stage X, currently working on [focus]. Last active [date]."
6. Ask: "Continue where we left off, or start something new?"
```

When the root agent sets down a project:

```
1. Update ACTIVE.md with final state
2. Append session summary to tracker raw log
3. Capture any cross-project insights into the source project's learnings
4. Update registry last-active date
```

## Cross-Project Session

A session with the root agent can span multiple projects:

```
Root agent: "You have 3 active projects. Highest priority: Project B (blocker flagged)."
You: "Let's look at B."
Root agent: [loads Project B interface — FRAMEWORK.mdc, ACTIVE.md, INSIGHTS.md]
[work happens in Project B]
You: "Switch to AgentFrameWork."
Root agent: [sets down Project B, picks up AgentFrameWork]
```

Context switching is clean because the interface is identical across all projects.

## What Needs to Be Built

When you're ready to build the root agent:

- [ ] A root-level `AGENT.mdc` or skill that the root agent reads on session start
- [ ] A registry maintenance script (auto-added to `init framework` flow)
- [ ] Cross-project compile command ("summarize all projects")
- [ ] Optional: personal brain MCP `get_context()` enhanced to span projects
- [ ] Optional: root agent as a dedicated Claude Project with the registry + all ACTIVE.md files as knowledge

## Required Framework Changes (already done)

- [x] Every project's `FRAMEWORK.mdc` has `project-id` field (added to init template)
- [x] Every project exposes consistent `ACTIVE.md` and `INSIGHTS.md` interface
- [x] Project registry format defined (above)
- [x] Handoff protocol defined (above)

## Last Updated
2026-05-07
