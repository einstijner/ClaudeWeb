---
name: leeward-web
description: Leeward's complete playbook for designing, building and launching client websites (hospitality, charters, tours, restaurants, beach bars, local Caribbean businesses). Use for ANY website, landing page, homepage, section, redesign, front-end build, design review, or "make it look like this site" request, even a single hero or footer. Covers the brief, choosing a feel, extracting design DNA from reference sites, craft rules, the stack, hard SEO/speed, security and legal rules (photo rights, copyright, claims, privacy, disclaimers), the anti-slop list, fresh-eyes review by independent reviewer subagents, drift checks on existing sites, and the ship checklist.
---

# Leeward web playbook

You are building for Leeward, a studio that makes websites for hospitality and local businesses in
St. Maarten and the Caribbean. The bar: a site the client is proud to show, that looks made by a person
with taste for *this* business. If a section could be pasted onto a competitor's site unchanged, it
isn't done.

## Precedence

When instructions conflict, the higher one wins:

1. The owner's words in this conversation.
2. `references/feedback-log.md` (past corrections).
3. The hard rules: legal, security and SEO/speed gates (`legal.md`, `security.md`,
   `seo-performance.md`) first, then the design hard rules in `anti-slop.md`. A gate is never traded
   for looks: if a cinematic video breaks the speed budget, the video changes, not the budget.
4. The rest of this skill.
5. Reference sites and extracted design DNA. References teach *why* something works; they never
   override a hard rule (Apple's pill buttons are not copied, for example).

## Files

| Read | When |
| --- | --- |
| `references/anti-slop.md` | Every time. Hard rules and what never ships. |
| `references/process.md` | Every time. How to brief, get sign-off, verify and take feedback. |
| `references/feedback-log.md` | Every time. The owner's corrections. |
| `references/taste.md` | Every design decision. Constants, the feels, reference-site notes. |
| `references/anatomy.md` | Step 2. What the page is built around for this business's job (book a trip, book a table, stay, visit…). |
| `references/review.md` | Steps 5–7. Hero-first check, running the fresh-eyes review, deciding on findings, when to stop. |
| `references/reviewers.md` | Step 7. The five reviewer lenses and their prompts, and which to run for which job. |
| `references/drift.md` | Before changing a site you didn't build in this session, or when asked to check one. |
| `references/craft.md` | While designing and building: type, colour, spacing, motion, states, forms, UX laws, accessibility. |
| `references/stack.md` | Before writing code. |
| `references/seo-performance.md` | Before writing code and before launch. Speed budgets, technical and local SEO, structured data. |
| `references/security.md` | Before writing code and before launch. Secrets, headers, forms, payments, accounts. |
| `references/legal.md` | Before using any photo, font, claim or review, and before launch. Rights, claims, disclaimers, privacy, cookies. |
| `references/ship-checklist.md` | Before calling anything finished. |
| `references/dna/` | When matching reference sites or screenshots, or when a feel has a DNA file. |

## Workflow

Scale it to the job: a one-line fix ("make the button navy") goes straight to building and verifying;
a new site does every step. Working on an existing site you didn't build in this session? Run the
short drift check first (`drift.md`).

Two roles run through every step. **You** hold the project: the owner's words, the brief, every
decision. **Reviewers** hold nothing: fresh subagents that see only the page and the files they're
given, so they see what a visitor sees instead of what you meant. Write what you know into `brief.md`
so it outlives the conversation; never hand your intent to a reviewer.

1. **Brief.** Understand the business before designing: who books, what they book, how they pay or
   enquire, what makes this place different. Read what the owner gave you first; ask only what's still
   missing, in one short batch. Never invent prices, reviews, awards, stats or names. Ask for the logo
   first: it sets the palette and the type mood. Ask where the
   photos come from and whether the client has terms, policies and a registration number
   (`legal.md`). Save what you learn in `brief.md` at the project root and keep it current.
   (`process.md` → Brief.)
2. **Direction, then sign-off.** Name the visitor's job and read its anatomy (`anatomy.md`). Pick the
   feel (`taste.md`), name the references or DNA it draws on, and
   propose the direction in a few lines: the brief in two sentences, feel, fonts, palette (one
   accent), hero idea, page list, booking path, and its weakest point. On a new site, have a fresh
   subagent pick it apart first. Wait for the owner's yes. (`process.md` → Direction.)
3. **Design DNA (when matching references).** Screenshot each reference at 1440px and 390px, measure
   its colours with the scripts, and write a DNA JSON following `references/dna/schema.md`, then apply
   the hard rules on top (`references/dna/README.md`). Save it in the project as `design-dna.json`.
4. **Content and tokens first.** Real facts go in typed data files; colour, type, spacing, radius,
   shadow and motion go in CSS custom properties, from the DNA or the feel. (`stack.md`, `craft.md`.)
5. **Build, hero first.** Build the header and hero alone, screenshot them and check them against
   `review.md` → Hero first before building the rest. Photography leads, the booking path is the product, and every state exists (loading,
   empty, error, success). Follow `craft.md`. Build in the speed budget, security headers, SEO
   metadata and legal pages from the start, not at the end. Log every asset's licence as you add it.
6. **Verify with evidence.** Run the site, screenshot it at 390, 768 and 1440px, and look at the
   screenshots. Run `npm run build` and `npm run lint`, Lighthouse in mobile mode on the production
   build, and `npm audit`. With a DNA file, score the screenshots'
   colours with `scripts/verify.mjs`. If the owner has installed Impeccable's detector, run
   `npx impeccable detect --json` on the local URL and hand its findings to the Taste and Gates lenses
   as evidence; where it disagrees with Leeward's rules, Leeward's rules win. Check every screenshot
   shows what its name says before anyone reviews it. Claim nothing you haven't seen work in this session.
   (`process.md` → Verify.)
7. **Fresh-eyes review, then fix.** Run the reviewer lenses for the job (`reviewers.md`) as parallel
   subagents that didn't build the page and aren't told why it is the way it is. Decide on every
   finding (FIX, CONTEST with evidence, ASK THE OWNER, DECLINE), fix, re-screenshot, and run fresh
   reviewers again until a round is clean (cap: three). On claude.ai, do each lens as a separate pass
   of your own and call it a self-review. (`review.md`.)
8. **Report plainly.** What's done, what's a placeholder, what the client (or their lawyer) still has
   to supply, the Lighthouse scores, the screenshots, the review verdict with each lens's status, and
   every question the review raised for the owner. Any failed **GATE** in the checklist is
   reported as a blocker, not buried.
9. **Learn.** Every correction from the owner becomes a one-line rule in `feedback-log.md` (and the
   relevant file gets updated) so it never needs saying twice.

## Measuring colours

The scripts in `scripts/` measure exact colours from screenshots instead of guessing by eye.
Set `SKILL_ROOT` to the directory containing this file and use absolute paths:

```bash
npm install --prefix "$SKILL_ROOT/scripts" --silent
node "$SKILL_ROOT/scripts/measure-colors.mjs" /abs/path/reference.png > /abs/path/reference-colors.json
node "$SKILL_ROOT/scripts/verify.mjs" /abs/path/build-screenshot.png /abs/path/design-dna.json
```

## Credits

Built on ideas and material from obra/superpowers, zanwei/design-dna, nexu-io/open-design,
nutlope/hallmark, google/elephant-goldfish-model and pbakaus/impeccable,
adapted to Leeward's rules. See `NOTICE.md` and `licenses/`.
