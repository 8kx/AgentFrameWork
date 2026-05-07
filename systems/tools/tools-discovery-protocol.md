# Tools Discovery Protocol

<- [Tools _INDEX.md](_INDEX.md) <- [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

The bridge between the Learnings and Tools subsystems. When triggered, this protocol reviews the current project's goals, searches for relevant tools, and produces actionable recommendations.

## Trigger Phrases

| Phrase | Action |
|--------|--------|
| `"tools review"` | Full review: project goals + web search + recommendations |
| `"what tools could help"` | Same as tools review |
| `"optimize my workflow"` | Same, with emphasis on workflow patterns |
| `"find tools for [topic]"` | Targeted search for a specific domain |
| `"are there MCP servers for [topic]"` | Targeted MCP search |

## The Review Protocol

### Phase 1: Read Project Context

Load in order (do not skip):
1. `systems/tracker/ACTIVE.md` — current focus, goals, blockers
2. `systems/learnings/INSIGHTS.md` — known patterns and friction points
3. `systems/tools/mcp-servers/registry.md` — what MCP servers are already connected
4. `systems/tools/skills/registry.md` — what skills already exist
5. Latest `systems/tracker/log/compiled/` entry — what kind of work has been happening

From this context, extract:
- The project domain (e.g. web app, CLI tool, data pipeline, API)
- The active tech stack (if known)
- Current pain points or friction from INSIGHTS.md
- Gaps in current tooling

### Phase 2: Web Research

Run targeted searches based on the project context:

```
Search 1: "MCP servers for [project domain] 2026"
Search 2: "Cursor skills [project domain] workflow"
Search 3: "AI coding workflow tools [primary tech stack] 2026"
Search 4: "latest MCP server directory [domain] Claude"
Search 5 (if friction identified): "automate [specific friction point] MCP OR Cursor skill"
```

Save raw findings to `systems/learnings/research/YYYY-MM-DD-tools-discovery.md`.

### Phase 3: Cross-Reference

For each tool found in the research:
1. Check if it is already in `mcp-servers/registry.md` or `skills/registry.md`
2. If already present — note it (useful for "are you using X fully?" prompts)
3. If not present — classify it:
   - **Download/install**: existing tool, ready to use
   - **Build**: custom skill or MCP server worth creating
   - **Investigate**: promising but needs evaluation

### Phase 4: Think Through the Project

Beyond just found tools, reason about the project goals in `ACTIVE.md`:

Ask:
- What are the most repetitive tasks in this project that a skill could automate?
- What information does the agent lack between sessions that a custom MCP tool could provide?
- What external services will this project integrate? Are there MCP servers for them?
- What does the tracker log show as friction? Could a tool address that friction?
- Are there workflow patterns from the research that apply to the current working style?

### Phase 5: Produce the Report

Output format — save to `systems/learnings/reviews/YYYY-MM-DD-tools-review.md` and present to user:

```markdown
# Tools & Workflow Review — [date]

## Project Context
[One paragraph: what the project is doing, what domain, current goals]

## Existing Tools Health Check
| Tool | Status | Underused? |
|------|--------|------------|
| [skill/mcp] | Active | [yes/no + note] |

## Recommended: Download / Install Now
| Tool | Type | What it does | Why useful for this project | Source |
|------|------|-------------|----------------------------|--------|
| [name] | MCP Server / Skill | [description] | [specific reason] | [URL] |

## Recommended: Worth Building
| Tool | Type | What it would do | Effort estimate |
|------|------|-----------------|----------------|
| [name] | Custom Skill / MCP | [description] | [low/medium/high] |

## Workflow Patterns to Consider
- [Pattern]: [how it applies to this project]
- [Pattern]: [how it applies to this project]

## Questions for You
- [ ] Should we add [tool]? I can set it up now.
- [ ] Is [friction point] worth building a custom skill for?
- [ ] Want me to investigate [promising finding] further?
```

### Phase 6: Act on Approvals

For each approved recommendation:

**Download/Install:**
1. Guide through connection steps (Cursor Settings > MCP, or skill install)
2. Create the server doc in `mcp-servers/servers/[name].md`
3. Add to `mcp-servers/registry.md`

**Build a custom skill:**
1. Follow `systems/tools/skills/skills-protocol.md`
2. Draft the SKILL.md
3. Add to `skills/registry.md`
4. Install if personal skill

**Workflow pattern to adopt:**
1. Log as an insight in `systems/learnings/log/raw/[today].md`
2. If significant — update INSIGHTS.md
3. If it changes how we work — update `systems/agents/workflows.md`

## Frequency

This review is on-demand only — never runs automatically. Suggested cadence: at the start of a new project phase, or when you feel the tooling is holding you back.

## Last Updated
2026-05-07
