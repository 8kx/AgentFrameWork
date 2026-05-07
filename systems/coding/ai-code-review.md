# AI Code Review Protocol

← [Coding _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

AI-generated code is a draft. This protocol defines the handoff point between "agent wrote it" and "I own it."

## The Core Principle

You are responsible for every line in the codebase, regardless of who wrote it. "The AI generated it" is not a defence for a bug, a security issue, or a bad design decision.

## The Review Checklist

Run this checklist on every significant block of AI-generated code before accepting it.

### Correctness
- [ ] Does it actually solve the problem as stated?
- [ ] Does it handle the edge cases for this specific use case (nulls, empty inputs, boundary values)?
- [ ] Does the logic match your understanding of what it should do? Trace through it manually.
- [ ] Are there any off-by-one errors, wrong comparison operators, or incorrect conditions?

### AI-Specific Failure Modes
- [ ] **Hallucinated APIs** — does every function, method, or import actually exist in the version you're using? Verify unfamiliar APIs.
- [ ] **Plausible but wrong** — AI code often looks correct but has subtle logic errors. Don't trust it because it compiles.
- [ ] **Silent data loss** — check any code that transforms, filters, or persists data. AI commonly drops fields or silently truncates.
- [ ] **Assumed context** — AI fills in missing information with plausible defaults. Check every assumption matches your actual requirements.

### Security
- [ ] No hardcoded secrets, credentials, or tokens
- [ ] Input is validated before use
- [ ] No obvious injection vectors (SQL, shell, HTML)
- [ ] Auth checks are present where required — not assumed by the caller

### Error Handling
- [ ] Errors are handled, not swallowed
- [ ] The unhappy path has been considered, not just the happy path
- [ ] Async code has error paths

### Maintainability
- [ ] Names are clear and follow [conventions.md](conventions.md)
- [ ] Logic is understandable without needing to run it
- [ ] No unnecessary complexity introduced to solve a simple problem

## How to Give Feedback to the Agent

If the review fails, do not just ask the agent to "fix it." Describe what is wrong specifically:

- "The edge case where `input` is an empty array is not handled — it will throw on line 14."
- "The API `Array.prototype.at()` is not available in the target environment; use `array[array.length - 1]` instead."
- "This silently returns `undefined` when the user is not found, but the caller expects an error to be thrown."

Specific feedback produces better corrections than vague feedback.

## The Ownership Moment

Once you have reviewed and accepted the code, you own it. Update it in future sessions as you would any code you wrote yourself. Do not re-review it as AI code — it is now your code.

## Last Updated
2026-05-07
