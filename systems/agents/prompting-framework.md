# Prompting Framework

← [Agents _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

## The Mental Model: One Agent, Many Skills

The "Context Wall" is the core problem in AI-assisted work — getting the agent to reliably know your context, tools, and preferences without expensive infrastructure or constant re-explanation.

The solution is the file system. Organised folders and markdown files let a single agent specialise on the fly:

```
Agent reads FRAMEWORK.mdc
    → task involves UI → reads systems/design/
    → task involves auth → reads systems/security/
    → task needs a tool → reads systems/tools/
    → planning something → reads systems/planning/
```

No separate agent per domain. No complex orchestration. The agent is already capable — you just need to give it well-organised context to read.

This means: **the quality of your framework files directly determines the quality of your agent's output.** Keep them current. Keep them concise.

## The Core Principle: Context Engineering

The gap between effective and ineffective AI use is not prompting skill — it is how you engineer context. The goal is the *smallest high-signal set of information* that enables the agent to act correctly.

More context is not always better. Research shows output quality decreases when context doubles unnecessarily. Be deliberate about what you include.

## Prompt Structure

A well-formed request has four elements:

```
1. CONTEXT    — What situation are we in? What is the project/file/state?
2. GOAL       — What specific outcome do you want?
3. CONSTRAINTS — What must the solution respect? (stack, style, patterns in use)
4. FORMAT     — How should the output be structured?
```

You do not need all four in every prompt — a quick question doesn't need a format declaration. But for any substantial task, make all four explicit.

## Before Code, Always: Plan

For any task that touches more than one file or involves a design decision, ask the agent to plan before it codes:

> "Before writing any code, describe the approach you'd take and what files you'd change."

Review the plan. Correct it if needed. Then ask it to proceed. This prevents wasted effort from wrong-direction implementations.

## Constraints First

State constraints before asking for the solution. The agent anchors to what it reads first:

**Worse:** "Write a function to parse the user input. It should be pure, handle nulls, and match our existing snake_case convention."

**Better:** "Pure function, no side effects. Handle null/undefined input gracefully. snake_case naming per our conventions. Now write a function to parse user input."

## Feedback That Improves Future Output

When the agent produces something wrong, say *what* is wrong specifically rather than "that's not right":

**Vague:** "This isn't what I wanted."
**Specific:** "This uses `Array.filter` which creates a new array — I need this to mutate in place because it runs in a tight loop. Rewrite using an index-based splice."

Specific feedback trains the conversation context to avoid the same mistake.

## When to Use Plan Mode vs Agent Mode

| Use Plan mode when | Use Agent mode when |
|-------------------|-------------------|
| Task touches many files | Task is clear and bounded |
| Multiple valid approaches exist | One obvious right approach |
| Architectural decision required | Implementation decision only |
| You're uncertain about scope | Scope is clear |

## Splitting Long Tasks

Long sessions degrade context quality. For tasks that span many files:
1. Break into phases (plan, then implement one area at a time)
2. Start a new session for a new area when the current session is long
3. Use `ACTIVE.md` and docs to hand off context between sessions

## Last Updated
2026-05-07
