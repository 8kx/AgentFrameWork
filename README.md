# AgentFrameWork

A hierarchical, self-maintaining agent framework for AI-assisted coding projects. Stack-agnostic. Designed to scaffold any project and keep itself up to date.

## What This Is

A tree of knowledge rooted in a single `FRAMEWORK.mdc` that the AI agent reads on every session. From there, 11 subsystems cover everything from coding conventions to deployment philosophy to project tracking and personal learning.

The framework dogfoods itself — this repo uses its own framework while being built.

## Structure

```
.cursor/rules/FRAMEWORK.mdc    ← Root agent — read first every session
systems/
├── coding/                    ← Best practices, conventions, debugging, AI code review
├── design/                    ← Visual system, tokens, component patterns
├── architecture/              ← Folder structure, decisions, dependencies
├── security/                  ← Secrets, auth, what never commits
├── git/                       ← Commit conventions, branching, PR protocol
├── deployment/                ← Environments, CI/CD, release protocol
├── documentation/             ← Living-docs protocol and templates
├── agents/                    ← Prompting framework, workflows
├── tracker/                   ← Project manager: ACTIVE.md, logs, weekly compile
├── learnings/                 ← INSIGHTS.md, research, weekly reviews
└── tools/                     ← Skills registry, MCP servers, personal brain design
scaffold/
├── new-project-checklist.md   ← Bootstrap any new project
├── upgrade-checklist.md       ← Compliance checklist (used by upgrade skill)
└── onboarding-path.md         ← Reading order for new/returning contributors
```

## Quick Start

### Personal Machine (once only)

```powershell
# Windows
.\scripts\install.ps1
```
```bash
# Mac/Linux
bash scripts/install.sh
```

Then in any project, say: **"init framework"**

### Any Other Machine

```bash
curl -o .cursor/rules/BOOTSTRAP.mdc \
  https://raw.githubusercontent.com/[owner]/AgentFrameWork/main/BOOTSTRAP.mdc
```

Then open the project in Cursor — the agent reads `BOOTSTRAP.mdc` and fetches the rest.

## Keeping Projects Up to Date

Say: **"upgrade framework"** in any project to audit and sync to the latest standards.

## Key Trigger Phrases

| Phrase | Action |
|--------|--------|
| `"init framework"` | Bootstrap framework into current project |
| `"upgrade framework"` | Audit + upgrade existing project |
| `"compile log"` | Generate weekly work summary |
| `"compile learnings"` | Generate learning review + ask about adoptions |
| `"search for [topic]"` | Web research → findings → adoption questions |
| `"what's next"` | Current state + suggested next action |
| `"project status"` | Read ACTIVE.md and summarise |

## Version

Current: **v1.0.0** — see [CHANGELOG.md](CHANGELOG.md)
