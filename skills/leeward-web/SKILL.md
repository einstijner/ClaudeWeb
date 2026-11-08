---
name: leeward-web
description: Leeward's complete playbook for designing and building client websites (hospitality, charters, tours, restaurants, beach bars, local Caribbean businesses). Use for ANY website, landing page, homepage, section, redesign, front-end build, design review, or "make it look like this site" request, even a single hero or footer. Covers the brief, choosing a feel, extracting design DNA from reference sites, craft rules, the stack, the hard rules and anti-slop list, verification and the ship checklist.
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
3. The hard rules in `references/anti-slop.md`.
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
| `references/craft.md` | While designing and building: type, colour, spacing, motion, states, forms, UX laws, accessibility. |
| `references/stack.md` | Before writing code. |
| `references/ship-checklist.md` | Before calling anything finished. |
| `references/dna/` | When matching reference sites or screenshots, or when a feel has a DNA file. |

## Workflow

Scale it to the job: a one-line fix ("make the button navy") goes straight to building and verifying;
a new site does every step.

1. **Brief.** Understand the business before designing: who books, what they book, how they pay or
   enquire, what makes this place different. Read what the owner gave you first; ask only what's still
   missing, in one short batch. Never invent prices, reviews, awards, stats or names.
   (`process.md` → Brief.)
2. **Direction, then sign-off.** Pick the feel (`taste.md`), name the references or DNA it draws on, and
   propose the direction in a few lines: feel, fonts, palette (one accent), hero idea, page list,
   booking path. For a new site, wait for the owner's yes. (`process.md` → Direction.)
3. **Design DNA (when matching references).** Screenshot each reference at 1440px and 390px, measure
   its colours with the scripts, and write a DNA JSON following `references/dna/schema.md`, then apply
   the hard rules on top (`references/dna/README.md`). Save it in the project as `design-dna.json`.
4. **Content and tokens first.** Real facts go in typed data files; colour, type, spacing, radius,
   shadow and motion go in CSS custom properties, from the DNA or the feel. (`stack.md`, `craft.md`.)
5. **Build.** Photography leads, the booking path is the product, and every state exists (loading,
   empty, error, success). Follow `craft.md`.
6. **Verify with evidence.** Run the site, screenshot it at 390, 768 and 1440px, and look at the
   screenshots. Run `npm run build` and `npm run lint`. With a DNA file, score the screenshots'
   colours with `scripts/verify.mjs`. Claim nothing you haven't seen work in this session.
   (`process.md` → Verify.)
7. **Self-critique, then fix.** Review your screenshots against `anti-slop.md` and the checklist the way
   a harsh senior designer would. Fix, re-screenshot, and only then report.
8. **Report plainly.** What's done, what's a placeholder, what the client still has to supply, with
   the screenshots.
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

Built on ideas and material from obra/superpowers, zanwei/design-dna and nexu-io/open-design,
adapted to Leeward's rules. See `NOTICE.md` and `licenses/`.
