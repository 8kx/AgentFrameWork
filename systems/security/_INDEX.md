# Security Subsystem

← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

Governs secrets management, authentication patterns, and what must never enter a repository. Read this before any work involving credentials, auth, or sensitive data.

## Contents

| File | Purpose |
|------|---------|
| [secrets-management.md](secrets-management.md) | How to handle API keys, tokens, and credentials |
| [auth-patterns.md](auth-patterns.md) | Abstract authentication and authorisation patterns |
| [what-never-commits.md](what-never-commits.md) | Strict list of file types that must never enter git |

## Agent Mandate

The agent reads `what-never-commits.md` before writing any file that could contain sensitive values. This is enforced from `FRAMEWORK.mdc` and cannot be overridden by project-level instructions.

## When to Load This Subsystem

- Setting up environment variables for any project
- Implementing authentication or authorisation
- Handling user data or third-party API credentials
- Reviewing code for security concerns
- Any time a credential, token, or key appears in conversation

## Last Updated
2026-05-07
