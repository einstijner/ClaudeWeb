---
name: leeward-web
description: Leeward's playbook for designing, building, reviewing and launching client websites (hospitality, charters, tours, restaurants, beach bars, villas, local Caribbean businesses). Use for ANY website, landing page, page, section, redesign, front-end build, design review or "make it look like this site" request, even a single hero or footer. Covers the brief, choosing a feel, design DNA from reference sites, craft rules, the stack, hard SEO/speed, security and legal gates, the anti-slop list, fresh-eyes review by independent subagents, drift checks on existing sites, and the ship checklist.
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
3. The gates: `legal.md`, `security.md`, `seo-performance.md`; then the owner's hard rules in
   `anti-slop.md`. A gate is never traded for looks: if a video breaks the speed budget, the video
   changes.
4. The rest of this skill.
5. Reference sites and design DNA. They teach *why* something works; they never override a rule.

## What to read for the job

Always: `feedback-log.md` and `anti-slop.md`. Then only what the job needs:

| Job | Also read | Steps |
| --- | --- | --- |
| **Small change** (a colour, a phone number, a line of copy) | Nothing else. On a site you didn't build this session, `drift.md` (short version). | Build, verify (6), report (8). |
| **A section or page on an existing site** | `craft.md`, `review.md`, `reviewers.md`; `drift.md` (short) if you didn't build it this session; `anatomy.md` if it holds the booking path. | 4–8. |
| **New site or redesign** | Everything, each file at the step that names it. | 1–9. |
| **Review or audit only** | `review.md`, `reviewers.md`, `ship-checklist.md`; `drift.md` for an existing site. | 6–8. |
| **Owner feedback on a build** | `process.md` → Taking feedback. | Fix, verify, learn (9). |

Other files, when their moment comes: `process.md` (brief, direction, verify, feedback), `taste.md`
(feels, reference sites, open questions), `stack.md` (before writing code), `seo-performance.md`,
`security.md`, `legal.md` (before code, before using any photo, font, claim or review, and before
launch), `ship-checklist.md` (before calling anything finished), `dna/` (matching a reference site).

## Workflow

**Two roles.** You hold the project: the owner's words, the brief, every decision. Reviewers hold
nothing: fresh subagents that see only the page and the files they're given, so they see what a
visitor sees instead of what you meant. Write what you know into `brief.md` so it outlives the
conversation; never hand your intent to a reviewer.

1. **Brief.** Read everything the owner gave you, then ask only what's missing, in one short batch.
   Ask for the logo first: it sets the palette and the type mood. Ask where the photos come from and
   whether the client has terms, policies and a registration number. Never invent prices, reviews,
   awards, stats or names. Save it as `brief.md` at the project root. (`process.md` → Brief.)
2. **Direction, then sign-off.** Name the visitor's job (`anatomy.md`) and the feel (`taste.md`).
   Propose in a few lines: the brief in two sentences, feel, fonts, palette (one accent), hero,
   pages, booking path, and the direction's weakest point. On a new site, have a fresh subagent pick
   it apart first. Wait for the owner's yes. (`process.md` → Direction.)
3. **Design DNA, when matching references.** Screenshot each at 1440 and 390px, measure the colours
   with the scripts below, write the DNA (`dna/schema.md`), apply the hard rules on top
   (`dna/README.md`), save as `design-dna.json`.
4. **Content and tokens first.** Facts in typed data files; colour, type, spacing, radius, shadow and
   motion as CSS custom properties. (`stack.md`, `craft.md`.)
5. **Build, hero first.** Header and hero alone, screenshot, pass `review.md` → Hero first, then the
   rest. Photography leads, the booking path is the product, every state exists. Build the speed
   budget, security headers, SEO and legal pages in from the start, and log every asset's licence as
   you add it.
6. **Verify with evidence.** Screenshot at 390, 768 and 1440px and look at them. Run `npm run build`,
   `npm run lint`, `npm audit` and Lighthouse mobile on the production build; with a DNA file,
   `scripts/verify.mjs`. If the owner has installed Impeccable, `npx impeccable detect --json` on the
   local URL gives the reviewers extra evidence (Leeward's rules win where it disagrees). Claim
   nothing you haven't seen work in this session. (`process.md` → Verify.)
7. **Fresh-eyes review, then fix.** Run the lenses for the job (`reviewers.md`) as parallel subagents,
   decide on every finding, fix, and re-run until a round is clean (cap: three). On claude.ai, do each
   lens yourself as a separate pass and call it a self-review. (`review.md`.)
8. **Report plainly.** What's done, what's a placeholder, what the client or their lawyer still has to
   supply, Lighthouse scores, screenshots, the review verdict with each lens's status, and the
   review's questions for the owner. A failed **GATE** is a blocker, stated first.
9. **Learn.** Each correction from the owner becomes a one-line rule in `feedback-log.md` (and the
   relevant file is updated), so it never needs saying twice.

## Measuring colours

Set `SKILL_ROOT` to the directory containing this file and use absolute paths:

```bash
npm install --prefix "$SKILL_ROOT/scripts" --silent
node "$SKILL_ROOT/scripts/measure-colors.mjs" /abs/path/reference.png > /abs/path/reference-colors.json
node "$SKILL_ROOT/scripts/verify.mjs" /abs/path/build-screenshot.png /abs/path/design-dna.json
```

## Credits

Built on obra/superpowers, zanwei/design-dna, nexu-io/open-design, nutlope/hallmark,
google/elephant-goldfish-model and pbakaus/impeccable, adapted to Leeward's rules. See `NOTICE.md`.
