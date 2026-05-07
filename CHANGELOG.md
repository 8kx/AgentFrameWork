# Changelog

All notable changes to the AgentFrameWork are documented here. The format follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and versioning follows [Semantic Versioning](https://semver.org/).

The `upgrade-framework` skill reads this file to determine what has changed between a project's pinned version and the latest.

---

## [1.0.0] — 2026-05-07

### Initial Release

**Core framework established:**

- `FRAMEWORK.mdc` — root macro agent with hierarchy map, mandates, and trigger table
- `BOOTSTRAP.mdc` — single-file fallback for non-personal machines
- `scripts/install.ps1` + `scripts/install.sh` — one-time skill installers

**11 subsystems created:**
- `systems/coding/` — best-practices, conventions, error-handling, testing, debugging, ai-code-review
- `systems/design/` — visual-system, tokens, component-patterns
- `systems/architecture/` — folder-structure, decision-log, dependencies
- `systems/security/` — secrets-management, auth-patterns, what-never-commits
- `systems/git/` — commit-conventions, branching-strategy, pr-protocol
- `systems/deployment/` — environments, cicd-philosophy, release-protocol
- `systems/documentation/` — doc-update-protocol, module-doc template, feature-doc template
- `systems/agents/` — prompting-framework, workflows
- `systems/tracker/` — ACTIVE.md, tracking-protocol, log structure
- `systems/learnings/` — INSIGHTS.md, learning-protocol, log/research/reviews structure
- `systems/tools/` — skills registry, MCP server registry, personal-brain DESIGN + ROADMAP

**Scaffold:**
- `scaffold/new-project-checklist.md`
- `scaffold/upgrade-checklist.md`
- `scaffold/onboarding-path.md`

**Skills:**
- `.cursor/skills/init-framework/SKILL.md` — bootstrap any project
- `.cursor/skills/upgrade-framework/SKILL.md` — audit and upgrade existing projects

---

## Upgrade Guide

### To 1.0.0 (initial)
Run `init framework` in any project to bootstrap, or use `BOOTSTRAP.mdc` fallback.

---

*Next release notes will appear above this line.*
