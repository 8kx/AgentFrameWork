# Debugging Protocol

← [Coding _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

A systematic first-response protocol for when something is broken. Follow the steps in order — skipping steps wastes more time than it saves.

## Step 1: Reproduce It Minimally

Before touching any code, confirm you can reproduce the problem reliably. If you can't reproduce it, you can't verify a fix.

- What is the exact input/action that causes the failure?
- Does it happen every time, or intermittently?
- Does it happen in all environments, or only some?

Intermittent bugs are often concurrency, state, or network issues. Environment-specific bugs are often configuration or dependency issues.

## Step 2: Read the Full Error

Read the complete error message and stack trace before doing anything else. The answer is often in the message you skimmed.

- What is the exact error type?
- Which line triggered it? (The root cause is often several frames up the stack, not the topmost frame.)
- What state was the system in when it failed?

## Step 3: Check the Obvious First

Before deep investigation, rule out:
- Environment (is the right env var set? Is the right version installed?)
- Configuration (has a config file changed?)
- Dependencies (did a package update recently?)
- Data (is the input data in the expected shape?)

These are embarrassingly common root causes. Check them fast and move on.

## Step 4: Form a Hypothesis Before Searching

State your hypothesis explicitly before you act on it:
> "I think the error is caused by X because Y."

Then test it with the smallest possible change. If the hypothesis is wrong, form a new one. Do not make multiple changes simultaneously to "see what fixes it" — this makes diagnosis impossible.

## Step 5: When to Ask the Agent

Good use of the agent in debugging:
- "Here is the error and the relevant code. What are the most likely causes?"
- "I've ruled out X and Y. What else could cause this error?"
- "Here is my hypothesis. What would you check to validate it?"

Bad use of the agent in debugging:
- Pasting the error without context and asking for a fix
- Asking the agent to make changes before you understand the cause

## Step 6: Fix, Then Verify, Then Document

Once you have a fix:
1. Apply the minimal change that fixes the root cause (not just the symptom)
2. Verify the original reproduction case no longer fails
3. Check that nothing adjacent broke
4. If the bug was non-obvious, add a comment explaining what was wrong and why the fix works

## When You Are Stuck

If you've been stuck for more than 20 minutes:
- Write down what you know and what you've ruled out (rubber duck)
- Take a break — context collapse is real
- Ask the agent with full written context: what you tried, what you ruled out, the exact failure

## Last Updated
2026-05-07
