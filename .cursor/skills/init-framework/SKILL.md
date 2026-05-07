---
name: init-framework
description: Bootstrap the AgentFramework into any new or existing project. Creates FRAMEWORK.mdc, systems skeleton, ACTIVE.md, and INSIGHTS.md. Use when the user says "init framework", "bootstrap project", "set up framework", "initialise framework", or wants to start a new project with the agent framework.
---

# Init Framework

Bootstrap the AgentFrameWork into the current project. Idempotent — safe to run on existing projects.

## Steps

1. **Check for existing FRAMEWORK.mdc**
   - If present and already current version → report "Framework already initialised at vX.X.X" and stop (unless user says force)
   - If present but older version → suggest running `upgrade framework` instead

2. **Create `.cursor/rules/FRAMEWORK.mdc`**
   Copy from: `https://raw.githubusercontent.com/[owner]/AgentFrameWork/main/.cursor/rules/FRAMEWORK.mdc`
   Stamp with:
   ```
   last-updated: [today's date]
   framework-version: [version from CHANGELOG.md]
   ```

3. **Create systems skeleton** (INDEX files only — content is fetched from the framework repo on demand)
   Create these files with a one-liner redirect if they don't exist:
   - `systems/tracker/ACTIVE.md` — from template
   - `systems/learnings/INSIGHTS.md` — empty template
   - `systems/coding/_INDEX.md` — breadcrumb + link to framework repo
   - `systems/design/_INDEX.md` — breadcrumb + link to framework repo
   - `systems/architecture/_INDEX.md` — breadcrumb + link to framework repo
   - `systems/security/_INDEX.md` — breadcrumb + link to framework repo
   - `systems/git/_INDEX.md` — breadcrumb + link to framework repo
   - `systems/documentation/_INDEX.md` — breadcrumb + link to framework repo
   - `systems/deployment/_INDEX.md` — breadcrumb + link to framework repo

4. **Create `systems/tracker/ACTIVE.md`**
   ```markdown
   # Active State
   ## Current Focus
   [Project name] — initial setup
   ## Active Goals
   - [ ] Complete project initialisation checklist
   ## Blockers
   None
   ## Last 3 Actions
   - [today] Initialised AgentFrameWork
   ## Last Compiled
   Never
   ```

5. **Run new-project-checklist interactively**
   Ask: "Want to run through the new project checklist now? (yes/skip)"
   If yes: read `scaffold/new-project-checklist.md` from the framework and walk through Phase 1 interactively.

6. **Report completion**
   ```
   Framework initialised at v[version].
   FRAMEWORK.mdc → .cursor/rules/
   ACTIVE.md + INSIGHTS.md → systems/tracker/ + systems/learnings/
   Run "what's next" to get started.
   ```

## Framework Repo Base URL
`https://raw.githubusercontent.com/[owner]/AgentFrameWork/main`

Update `[owner]` to the actual GitHub username after repo is created.
