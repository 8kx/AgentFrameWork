# Agent Workflows

← [Agents _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

Common workflow patterns for agent-assisted coding work.

## Workflow: New Feature

```
1. Open session → agent reads FRAMEWORK.mdc + ACTIVE.md + INSIGHTS.md
2. Describe the feature → ask agent to plan (files, approach, unknowns)
3. Review plan → correct misunderstandings before any code is written
4. Implement in phases (one logical unit at a time)
5. Review AI-generated code per [ai-code-review.md](../coding/ai-code-review.md)
6. Update docs per living-docs protocol
7. Tracker logs the session automatically
```

## Workflow: Bug Fix

```
1. Reproduce the bug minimally (see [debugging.md](../coding/debugging.md))
2. Paste reproduction case + error + relevant code to agent
3. Ask for hypothesis, not immediate fix
4. Validate hypothesis before applying fix
5. Apply minimal fix → verify reproduction case no longer fails
6. Add regression test
```

## Workflow: Refactor

```
1. Define the goal of the refactor (why, not how)
2. Ask agent to identify all affected files before touching anything
3. Agree on the approach
4. Refactor one module at a time → run tests between each
5. Do not mix refactor with feature work in the same session
```

## Workflow: Code Review (AI-Generated Code)

See [ai-code-review.md](../coding/ai-code-review.md) for the full checklist. Summary:
```
1. Read the code as if you wrote it
2. Trace the main path manually
3. Check every item in the review checklist
4. Accept → you now own the code
```

## Workflow: Research Session

```
1. Trigger: "search for [topic]"
2. Agent searches web → saves findings to systems/learnings/research/
3. Agent compares to existing INSIGHTS.md + current project patterns
4. Agent presents digest: "Found X things. Worth adopting: [list]. Questions: [list]."
5. You decide what to adopt → agent updates relevant docs
```

## Workflow: Weekly Review

```
Trigger: "compile log" or "learning review"

Agent:
1. Reads tracker raw logs since last compile → generates work summary
2. Reads learnings raw logs → surfaces key insights
3. Reads any research files since last compile
4. Produces structured review with "opportunities to consider" and questions
5. Asks which improvements to adopt
6. On approval, updates INSIGHTS.md and relevant subsystem docs
```

## Workflow: New Project Bootstrap

```
Trigger: "init framework"

Agent reads init-framework SKILL.md:
1. Creates .cursor/rules/FRAMEWORK.mdc in the project
2. Creates systems/ skeleton (INDEX files only, not full content)
3. Creates ACTIVE.md and INSIGHTS.md (empty)
4. Creates scaffold/onboarding-path.md
5. Runs new-project-checklist.md interactively
6. Logs the session in tracker
```

## Last Updated
2026-05-07
