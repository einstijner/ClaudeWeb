# Review in fresh eyes

The builder always thinks their page is fine. So the hero is reviewed before the rest is built, and the
whole page is reviewed by a reviewer that didn't build it. Adapted from Hallmark's hero-first build
and fresh-context reviews ([nutlope/hallmark](https://github.com/nutlope/hallmark), MIT).

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

Get the hero right before building anything below it. It's the screen most visitors judge the business by.

## Whole-page review (fresh context)

When the page is built and your own checks pass, get a review from a reviewer with no memory of the
build. In Claude Code, spawn a subagent (the general-purpose agent). Give it only the screenshots
(full page at 1440 and 390, the folds at 1280×800, 1440×900 and 1920×1080), the page source, the feel
and the DNA file if any, plus `anti-slop.md` and `ship-checklist.md`. Don't explain your intent.
Where subagents aren't available (claude.ai), do the review yourself in a separate pass, reading the
screenshots as if someone else had made the page.

The reviewer's instructions:

> You're reviewing a website you didn't build. Look at the screenshots first; open the source only to
> quote copy or locate a problem. First line, one word: `recapture` (a screenshot is missing or wrong;
> list what to recapture), `rebuild` (the first screen fails the brief or the feel wholesale), `fix`
> (findings follow) or `ship` (nothing owed). Then at most eight findings, worst first, one line each:
> the rule or defect, where, and the fix. Scroll the 1440 page one screen at a time: a screen with nothing
> big enough to be its reason to exist (a heading adrift, a narrow column beside empty space, an empty
> box where a photo belongs) outranks any detail. Name every headline that would work unchanged on a
> competitor's site. Check every hard rule and GATE. Then answer: does the page deliver the feel and
> the brief? Name the biggest gap. Close with one line on what must not be lost while fixing. Don't fix
> anything yourself.

Act on the first word. Fix the findings in one batch, re-screenshot, and check them yourself. At most
one confirming round, then report to the owner with the verdict and what changed. Never claim a review
passed that didn't run.
