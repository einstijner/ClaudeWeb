# Review in fresh eyes

The builder always thinks their page is fine: they know what every section was *meant* to do, so they
see the intent instead of the page. So the hero is reviewed before the rest is built, and the whole page
is reviewed by reviewers that didn't build it and are told nothing about it. You (the builder) keep
the memory of the project and decide what to do with their findings; they keep none and judge only
what is on the screen.

Hero-first is adapted from Hallmark ([nutlope/hallmark](https://github.com/nutlope/hallmark), MIT).
The lenses, the resolve step and the rules for when to stop are adapted from Google's
Elephant-Goldfish Model ([google/elephant-goldfish-model](https://github.com/google/elephant-goldfish-model),
Apache-2.0).

## Hero first

Build the header and the hero only. Screenshot at 1280×800, 1440×900, 1920×1080 and 390×844.
Check:
- The headline, the one sentence, the one action (or none, by design) and the photo's focal point
  are all visible at 1280×800 without scrolling.
- The headline is short (about 7 words or fewer) and the supporting sentence is about 12 words or fewer. The
  hero holds no more than the headline, one sentence and the action.
- Size it with `svh`/`dvh`, not `vh` (mobile browser bars).
- At 1920 the container is capped and centred: gutters grow, the grid doesn't gain columns.
- No more than about 160px of empty band between the hero content and the fold.
- The photo crops well at every size (`object-position` set per breakpoint where needed).

- **The memory test:** if a visitor left after this one screen, what would they describe an hour
  later? "The boat at anchor off Tintamarre with the time and the Book button" passes; "a nice blue
  website" is a mood, and the hero isn't done.

On a new site, then run the First visit and Taste lenses (`reviewers.md`) on the hero screenshots
alone. Get the hero right before building anything below it. It's the screen most visitors judge the
business by.

## Whole-page review

When the page is built and your own checks pass (`process.md` → Verify).

### 1. Pack the inputs

Save everything the reviewers will read in `review/` at the project root, with absolute paths:
screenshots (named by page and width), command output (build, lint, audit), the Lighthouse report.
Add `review/` to `.gitignore` unless the owner wants reviews kept. If you know the width the owner
views on (their phone, their laptop), capture that too: it's the width they'll judge.

**Check every capture before sending it** (from Impeccable, Apache-2.0). Let entrance animations
finish or turn them off first: an element still faded out reads as missing and gets "fixed" into a
bug. Take full-page shots from the top of the document. Then open every file once and confirm it
shows what its name says: no blank or black areas, no half-loaded images, the right page at the right
width. A review of a broken screenshot is not a review. Each lens in `reviewers.md` lists
exactly what it gets; give it that and nothing more.

**Never give a reviewer your intent.** No summary of the conversation, no "I did X on purpose", no
"the owner wanted Y". `brief.md` is the one exception, and only for the lenses that list it. If a
reviewer needs your explanation to understand the page, the page is missing something.

### 2. Run the lenses

Choose the lenses for the job from the table in `reviewers.md`. In Claude Code, spawn one subagent
per lens (the general-purpose agent), all in the same message so they run at the same time. Each
prompt is the shared rules plus that lens's prompt, pasted verbatim, plus the absolute paths of its
inputs.

A lens that errors, times out, or replies `not reviewed` **did not review**. Fix the input
(recapture the screenshot, run the missing command) and run it once more. If it fails again, its
status is `not run`. Never count a lens that didn't run as a lens with no findings.

**Where subagents aren't available (claude.ai),** go through each lens yourself, one at a time, as
a separate pass, reading the screenshots as if someone else had made the page. That is a
**self-review**, not a fresh-eyes review: call it a self-review in the report and to the owner.

### 3. Decide on every finding

You built the page, so you're the one who knows what's intended, and the one most likely to wave a
real problem away. Give every Blocker and Major exactly one decision:

- **FIX.** The finding is right. Write down the change.
- **CONTEST.** The finding is wrong, and you can point to something the reviewer could have checked:
  a line in `brief.md`, a rule in `feedback-log.md` or a hard-rule file, a file in the project. Quote it.
- **ASK THE OWNER.** The finding is wrong only because of something no reviewer could see (a call the
  owner made in conversation, something the client said). Don't fix it, and don't silently ignore it:
  put it to the owner. If the answer should hold next time, write it into `brief.md`.
- **DECLINE.** Nits only: record it and move on, or fix it if it's cheap.

Rules for deciding:
- "It was intentional" is not evidence. If you can't quote something the reviewer could have read,
  it's FIX or ASK THE OWNER, never CONTEST.
- Never contest a First visit finding. If a stranger couldn't tell what the place is or how to book,
  the page didn't tell them, whatever you meant.
- Don't downgrade a severity. If you think a Blocker is a Nit, CONTEST it and say why.
- Don't add text to the page only to satisfy a reviewer; add it when a real visitor needs it.
- Wanting to contest is not a reason to. Assume the reviewer is right until you can show otherwise.

### 4. Fix, then run again

Fix everything marked FIX in one batch, re-screenshot (same file names), and check the fixes yourself.
Then run the lenses that raised a Blocker or Major again, as **new** reviewers with no memory of the
last round and never your account of what you changed. Give each one, besides its usual inputs, the
previous round's findings for its lens in the reviewer's own words, and this instruction first:

> Before looking for anything new, score each finding below from the new screenshots alone:
> `resolved`, `partial` or `unresolved`, one line each saying what you can see. A fix you can't see in
> the screenshots is unresolved. Something moved but still not right (the spacing changed, the
> headline is still generic) is partial at best. Then list at most three problems the fixes caused,
> then your normal review.

A partial or unresolved finding counts as open. A later "ship" covers what was scored and reviewed,
nothing more: say exactly that in the report.

Keep a list of **settled** findings (contested, or answered by the owner). If a new reviewer raises a
settled one again (same place, same issue), don't reopen it. A **fixed** finding is different: if it
comes back, the fix didn't work, so reopen it.

- **Clean round:** every lens that ran completed, and none raised a Blocker or Major that isn't
  settled. Nits don't count. Judge this from the findings, before fixing anything in that round.
- **Stop** at the first clean round. The round that found the problems is never the clean one, so a
  page with any Blocker or Major gets at least two rounds.
- **Cap:** three rounds. **Churn:** a new finding sits exactly where you fixed the last one, and undoing
  that fix would clear it. On cap or churn, stop and give the owner the open findings by severity, and
  ask one question: ship with these, keep going, or rethink the direction.

### 5. Report

Write `review/review-report.md`, then tell the owner in a few lines: the verdict, the lens table, what
changed, and every ASK THE OWNER item first. Don't paste the whole report into the chat.

```markdown
# Review: <page or site>, <date>

**Verdict:** ship | fix | rebuild   (fresh-eyes review | self-review)   Rounds: N

| Lens | Status | Blockers | Major | Nits |
| --- | --- | --- | --- | --- |
| First visit | completed / not run | | | |

## First visit vs the brief
What a stranger understood (the four answers) next to what `brief.md` says. Every mismatch.

## For the owner
Each ASK THE OWNER finding, with the question.

## Findings
### <finding>: Blocker | Major | Nit (<lens>)
- **Where:** …
- **Finding:** … (the reviewer's words)
- **Decision:** FIX | CONTEST | ASK THE OWNER | DECLINE: why, with the quote or file for a contest
- **Change made:** …

## Must not be lost
The Taste lens's last line.
```

Never claim a review passed that didn't run, and never call a self-review fresh eyes. If the owner
answers a "ship" with their own screenshot or a named problem, that outranks every capture you took:
put it in a new full review, don't patch it and declare it fixed.
