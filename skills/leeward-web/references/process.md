# Process

How to work with the owner on a site, from first message to handoff. Adapted from the brainstorming,
verification-before-completion, receiving-code-review and systematic-debugging skills in
[obra/superpowers](https://github.com/obra/superpowers) (MIT). Writing the brief down, the weakest
point and the direction stress-test are adapted from the brainstorm skill in Google's
[elephant-goldfish-model](https://github.com/google/elephant-goldfish-model) (Apache-2.0).

## Brief

You build what you *believe* the owner wants, and that belief is usually thinner than it feels.

**First, what do you actually know?**
- Everything that matters is in the request ("make the hero photo the sunset one"). Do it, say what you did.
- Something non-trivial is missing. Find out before designing.

**Look before you ask.** Read everything the owner pointed at (brief, client's current site, photos,
Instagram, menu PDF, earlier conversation, existing code) before asking anything. Never ask what the
material already answers, and never reopen what the owner already decided.

**Then ask, briefly.** One message, at most about five questions, the ones whose answers change the
design. Good questions for a client site:
- What does a visitor need to do? (Book, reserve a table, enquire, call, WhatsApp, buy.)
- Who is the visitor? (Cruise-ship day-trippers, villa guests, locals, families, high-end.)
- What makes this business different from the one next door?
- What real material exists? (Photos, logo, menu, prices, reviews they actually have.)
- Which feel? Offer your recommendation: "I'd go premium, like Tres; agree?"

If the owner says "just build it", stop asking and make sensible calls, listing your assumptions.

**Then write it down.** Save `brief.md` at the project root: the business in two or three sentences,
the visitor and their one job, what makes the place different, the facts the owner gave (with where
each came from), what's still missing, and the decisions made so far. Add every later decision the
owner makes in conversation ("no prices", "the sunset photo leads") with its date. The conversation
ends; the brief stays. It's what the fresh-eyes reviewers compare the page with (`review.md`), and what
the next session reads before touching the site (`drift.md`).

## Direction (sign-off before building)

For a new site or a redesign, propose before you build. Keep it short enough to read on a phone,
and open with the brief in two sentences so the owner can catch a misunderstanding before it costs a
build:

- **Feel:** premium / playful / simple / in-depth, and why.
- **Draws on:** which reference sites or DNA file.
- **Type:** display + body font. **Palette:** neutrals + one accent (hex).
- **Hero:** what photo/video, what headline, the one action (or none).
- **Pages/sections:** list.
- **Booking path:** how a visitor goes from landing to enquiry/booking, and the fallback.

- **Weakest point:** the strongest case against this direction, in one line ("premium may read cold
  to cruise-ship day-trippers who want the price and the time"). Find it before the owner does.

If there are two genuinely different good directions, show both in a line each and recommend one.
Wait for a yes. Small changes to an existing site don't need this step.

**Stress-test it first (new sites, Claude Code).** Before sending the direction, give one fresh
subagent only `brief.md` and the direction text (no conversation) and ask it, with the shared rules
from `reviewers.md`: does the direction serve the visitor's job in the brief? Is any fact in it not in
the brief (invented)? Does it break a hard rule in `anti-slop.md`? Would the hero headline work
unchanged for a competitor? What's missing from the booking path? Fix what it finds, or mention it
in the proposal; don't send the owner a direction a stranger could pick apart in a minute.

## Plan (bigger builds)

For a multi-page site, write the build order as a short checklist (data files → tokens → layout and
header/footer → hero → sections → booking → detail pages → SEO → checks) and work through it,
checking each item off. Keep each step small enough to verify on its own.

## Verify (evidence before claims)

**No completion claims without fresh evidence from this session.**

Before saying something is done, fixed, working or matching:
1. Identify what proves it: a screenshot, `npm run build`, `npm run lint`, a test submission,
   `verify.mjs` output.
2. Run it, in full, now.
3. Read the output or look at the screenshot properly.
4. Only then state the result, with the evidence. If it failed, say so plainly and what you'll do.

Words that signal a claim without evidence (stop and verify first): "should work", "looks good",
"probably", "I've made it match", "done!" before looking.

For visual work, "verified" means you opened the screenshots at 390px and 1440px and checked them
against `anti-slop.md` and the checklist, not that the code compiled.

## Taking feedback

When the owner critiques something:
- **Understand it fully** before changing anything. If one point is unclear, ask about that point
  before implementing the rest, because points are often related.
- **Don't perform agreement.** No "You're absolutely right!", no "great point", no apology. Just
  fix it and say what changed, or give the corrected reasoning.
- **Push back when it's wrong for the client,** with the reason (for example, it would break
  accessibility contrast or the booking flow), then let the owner decide.
- **Generalise it.** Ask yourself: would this correction apply to other sites too? If yes, write it to
  `feedback-log.md` as a rule.
- Apply one point at a time and check each one.

## When something breaks

Find the cause before fixing. Read the error fully, reproduce it, check what changed recently, form one
hypothesis, test it with the smallest change. If three fixes in a row fail, stop and rethink the
approach instead of piling on a fourth.
