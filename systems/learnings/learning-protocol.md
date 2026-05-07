# Learning Protocol

← [Learnings _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

## Passive Capture Rules

After any session where a pattern, a better approach, or friction is noticed, silently:

1. Append one line to `log/raw/YYYY-MM-DD.md`:
   ```
   [HH:MM] <type>: <observation> | <area>
   ```
2. Do not narrate this to the user unless they ask

**Types:**
- `insight:` — a better way to do something
- `pattern:` — a recurring behaviour or preference observed
- `friction:` — something that slows down or creates repeated problems
- `question:` — an open question worth researching
- `win:` — something that worked especially well

**Examples:**
```
[14:32] insight: splitting tracker and learnings reduces cognitive load | systems/tracker
[15:01] pattern: user prefers options before decisions, then commits quickly | agents/prompting
[15:44] friction: ACTIVE.md needs trimming more often than expected | tracker
```

## INSIGHTS.md Curation Rules

INSIGHTS.md is a curated shortlist, not an accumulation. The agent prunes it when:
- A new insight supersedes an older one
- An insight has become obvious or well-internalized
- The file exceeds 15 lines

Pruned insights are not deleted — they are moved to the latest compiled summary.

## Research Protocol

Triggered by: `"search for [topic]"`, `"what's new in [topic]"`, `"scan for improvements"`

1. Run web searches on the topic
2. Save findings to `research/YYYY-MM-DD-[topic-slug].md`
3. Compare findings to existing INSIGHTS.md and current subsystem docs
4. Present a digest: what was found, what is potentially useful, what is noise
5. Ask: "Want to adopt any of these?" — approved items update INSIGHTS.md or the relevant subsystem doc

### Research File Format

```markdown
# Research: [Topic] — YYYY-MM-DD

## Sources
- [URL or source name]

## Key Findings
[Bullet summary of relevant discoveries]

## Compared to Current Approach
[What we do now vs. what was found]

## Recommendation
[Adopt / Investigate further / Not relevant]
```

## Weekly Review (Compile) Protocol

Triggered by: `"compile learnings"`, `"learning review"`, `"what have I learned"`

1. Read all `log/raw/` files since "Last Compiled" date
2. Read all `research/` files since "Last Compiled" date
3. Pull the compiled tracker summary for the same period (for work context)
4. Generate `reviews/YYYY-WXX-review.md`
5. Update "Last Compiled" in `INSIGHTS.md`
6. Present the review and ask about adoptions

### Review File Format

```markdown
# Learning Review — Week of YYYY-MM-DD

## Work Context (from Tracker)
[Summary of what was worked on]

## Key Insights This Period
[From raw learning log]

## Research Findings
[Any searches conducted]

## Patterns Noticed
[Recurring observations about working style, friction, wins]

## Opportunities to Consider
- [ ] [Specific approach to adopt?] — [one-line reason]
- [ ] [Topic worth investigating?] — [one-line reason]

## Questions for You
[2-3 open questions about direction, workflow, or priorities]
```

## Last Updated
2026-05-07
