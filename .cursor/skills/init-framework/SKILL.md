---
name: init-framework
description: Bootstrap the AgentFramework into any new or existing project. Creates FRAMEWORK.mdc, systems skeleton, ACTIVE.md, and INSIGHTS.md. Use when the user says "init framework", "bootstrap project", "set up framework", "initialise framework", or wants to start a new project with the agent framework.
---

# Init Framework

Bootstrap the AgentFrameWork into the current project. Idempotent - safe to run on existing projects.

## Source Resolution (always in this order)

1. **Local path** - read `~/.cursor/agentframework.path` to get the local repo location (e.g. `D:\GitHub\AgentFrameWork`). Read files directly from there. This is the fastest and most up-to-date source.
2. **GitHub raw** - if no local path file exists: `https://raw.githubusercontent.com/8kx/AgentFrameWork/main/`
3. **Embedded fallback** - if both fail, use the embedded content at the bottom of this file.

Always report which source was used.

## Steps

### 1. Check for existing FRAMEWORK.mdc
- If present and already current version: report "Framework already initialised at vX.X.X" and stop (unless user says force)
- If present but older version: suggest running `upgrade framework` instead

### 2. Read framework version
From source: `CHANGELOG.md` - extract the latest version number from the first `## [X.X.X]` heading.
If unavailable, use `1.0.0`.

### 3. Create `.cursor/rules/FRAMEWORK.mdc`
Copy from source: `.cursor/rules/FRAMEWORK.mdc`
Then stamp with:
```
last-updated: [today's date]
framework-version: [version]
```

### 4. Create systems skeleton
For each subsystem, create a minimal `_INDEX.md` if it doesn't exist.
Copy from source:
- `systems/coding/_INDEX.md`
- `systems/design/_INDEX.md`
- `systems/architecture/_INDEX.md`
- `systems/security/_INDEX.md`
- `systems/git/_INDEX.md`
- `systems/deployment/_INDEX.md`
- `systems/documentation/_INDEX.md`
- `systems/agents/_INDEX.md`
- `systems/tools/_INDEX.md`

Also copy the always-loaded protocol files:
- `systems/tracker/tracking-protocol.md`
- `systems/learnings/learning-protocol.md`

### 5. Create ACTIVE.md
Copy `systems/tracker/ACTIVE.md` from source, then update:
- "Current Focus" -> "[project folder name] - initial setup"
- "Active Goals" -> "[ ] Complete project initialisation checklist"
- "Last 3 Actions" -> "[today] Initialised AgentFrameWork v[version]"

### 6. Create INSIGHTS.md
Copy `systems/learnings/INSIGHTS.md` from source as-is.

### 7. Run new-project checklist interactively
Ask: "Want to run through the new project checklist now? (yes/skip)"

If yes: read `scaffold/new-project-checklist.md` from source and walk through Phase 1 (Repository Setup) interactively, checking each item against what already exists in the project.

### 8. Assign project-id and register

Read `~/.cursor/project-registry.md` if it exists. Count existing entries to determine the next ID number (format: `af-NNN`, e.g. `af-002`). If no registry exists, this project is `af-001`.

Add a row to `~/.cursor/project-registry.md`:
```
| [id] | [project folder name] | [absolute path] | Active | [today] |
```

Create the registry file if it doesn't exist:
```markdown
# Project Registry

Maintained by init-framework skill. Read by the future root agent for cross-project navigation.

| ID | Name | Path | Status | Last Active |
|----|------|------|--------|------------|
```

Stamp the project-id and project-name into the project's `FRAMEWORK.mdc` metadata block:
```
project-id:    [assigned id]
project-name:  [folder name]
registry:      ~/.cursor/project-registry.md
```

### 9. Report completion
```
Framework initialised at v[version]. (source: [local|github|embedded])
  .cursor/rules/FRAMEWORK.mdc
  systems/ skeleton (N subsystems)
  systems/tracker/ACTIVE.md
  systems/learnings/INSIGHTS.md
  project-id: [id] — registered in ~/.cursor/project-registry.md

Say "what's next" to get started, or "tools review" to find relevant tools for this project.
```

---

## Embedded Fallback Checklist (Phase 1 only)

Use this if both local and GitHub sources are unavailable:

```
New Project Checklist - Phase 1: Repository Setup
- [ ] Create .gitignore (include: .env, .env.*, *.pem, *.key, node_modules/, .venv/)
- [ ] Create .env.example if the project uses environment variables
- [ ] Create README.md with project name and one-paragraph description

Phase 2: Framework Bootstrap
- [x] FRAMEWORK.mdc created
- [x] systems/ skeleton created
- [x] ACTIVE.md created
- [x] INSIGHTS.md created

Phase 3: Coding Standards
- [ ] Note the tech stack in systems/architecture/_INDEX.md
- [ ] Create docs/architecture/folder-structure.md with the planned structure

Phase 4: Security Baseline
- [ ] .gitignore has .env and key file entries
- [ ] .env.example committed with placeholder values

Phase 5: Git Setup
- [ ] Confirm default branch is main
- [ ] Commit convention confirmed (default: Conventional Commits)

Phase 6: Design (if UI involved)
- [ ] Copy systems/design/tokens.md into docs/design/tokens.md and fill in brand values
```
