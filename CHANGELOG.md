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

## [1.1.0] — 2026-05-10

### Added

- **Current Task block** (`systems/tracker/tracking-protocol.md`) — when a goal has `[~]` status, agents must maintain a `## Current Task` block in `ACTIVE.md` with explicit sub-step checkboxes. Each step is checked off in real-time, not batched at end of session. This block is the live resume point for any agent or session picking up mid-task.

### Changed

- `ACTIVE.md` line limit raised from 20 to 25 to accommodate the Current Task block
- `FRAMEWORK.mdc` Mandate 3 (Silent Tracking) expanded to include Current Task real-time update requirement
- `scaffold/upgrade-checklist.md` Layer 4 — added checks for ACTIVE.md line limit and Current Task block presence when a `[~]` goal exists

### Why

A free-text "Resume Point" block goes stale within minutes of starting a multi-step task. Without sub-task checkboxes checked off in real-time, a second agent or returning session sees completed steps as still pending and either repeats work or mis-states project status. Discovered in practice on the kitchen-brain project (2026-05-10).

---

### Upgrade Guide: 1.0.0 → 1.1.0

1. In `FRAMEWORK.mdc`, bump `framework-version` to `1.1.0`
2. In `systems/tracker/tracking-protocol.md`, add the Current Task block rules (or pull from the framework source)
3. In `systems/tracker/ACTIVE.md`, update the header comment to mention the Current Task block and raise the line limit to 25
4. Replace any free-text `## Resume Point` section with a `## Current Task` block using sub-step checkboxes

---

*Next release notes will appear above this line.*
