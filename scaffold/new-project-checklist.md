# New Project Checklist

← [Scaffold _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../.cursor/rules/FRAMEWORK.mdc)

Run through this checklist when starting any new project. The `init-framework` skill executes this automatically.

## Phase 1: Repository Setup

- [ ] Create the repository (or initialise git in an existing directory)
- [ ] Create `.gitignore` using the baseline from [security/what-never-commits.md](../systems/security/what-never-commits.md)
- [ ] Create `.env.example` if the project will use environment variables
- [ ] Create `README.md` with project name and one-paragraph description

## Phase 2: Framework Bootstrap

- [ ] Create `.cursor/rules/FRAMEWORK.mdc` (copied from this framework, version stamped)
- [ ] Create `systems/` skeleton — `_INDEX.md` files for each relevant subsystem
- [ ] Create `systems/tracker/ACTIVE.md` — set current focus to "Project initialisation"
- [ ] Create `systems/learnings/INSIGHTS.md` — empty, ready for first insights

## Phase 3: Coding Standards

- [ ] Confirm stack with user (even if abstract) and note in `systems/architecture/_INDEX.md`
- [ ] Create `docs/architecture/folder-structure.md` with the planned project structure
- [ ] Note any stack-specific convention overrides in project `conventions.md`

## Phase 4: Security Baseline

- [ ] `.gitignore` includes all entries from `what-never-commits.md`
- [ ] `.env.example` committed with placeholder values
- [ ] Confirm how secrets will be managed (platform env vars, secret manager, etc.)

## Phase 5: Git Setup

- [ ] Confirm default branch name (`main`)
- [ ] Confirm branching strategy (see [git/branching-strategy.md](../systems/git/branching-strategy.md))
- [ ] Set up branch protection on `main` if the project has a remote
- [ ] Note commit convention in project docs (defaults to Conventional Commits)

## Phase 6: Design (if UI involved)

- [ ] Copy `systems/design/tokens.md` into `docs/design/tokens.md`
- [ ] Fill in brand colors, typography, and spacing values
- [ ] Confirm icon library
- [ ] Note any design-system overrides

## Phase 7: First Commit

- [ ] All setup files in place
- [ ] `README.md` describes what the project is
- [ ] `git add`, `git commit` with `chore: initial project setup`

## Last Updated
2026-05-07
