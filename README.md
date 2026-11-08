# ClaudeWeb

Leeward's website build playbook as one Claude skill. Once installed, Claude follows it whenever it
builds or reviews a website: brief → direction sign-off → design DNA from reference sites → build →
verify with screenshots → self-critique → learn from feedback.

It combines Leeward's own rules and taste with the best parts of four open-source projects:
[superpowers](https://github.com/obra/superpowers) (the process), [design-dna](https://github.com/zanwei/design-dna)
(extracting a site's look into a measured JSON spec, with colour-checking scripts) and
[OpenDesign](https://github.com/nexu-io/open-design) (craft rules for type, colour, motion, states, forms and UX) and [Hallmark](https://github.com/nutlope/hallmark)
(page anatomy by business type, hero-first building, fresh-eyes review, template tells).
Leeward's hard rules override all of them. See `skills/leeward-web/NOTICE.md`.

The skill itself is in [`skills/leeward-web/`](skills/leeward-web/SKILL.md).

## Install

**Claude Code** (once per computer; works in every project):

```
/plugin marketplace add einstijner/ClaudeWeb
/plugin install leeward-web@leeward
```

To pick up changes later: `/plugin marketplace update leeward`.

**claude.ai**: download `dist/leeward-web.zip` and upload it under Settings → Capabilities → Skills.
After changing the skill, run `./scripts/build-zip.sh` and upload the new zip.

## Files

| File | What it holds |
| --- | --- |
| `SKILL.md` | The workflow Claude follows and which file wins in a conflict |
| `references/anti-slop.md` | Hard rules and what never ships |
| `references/seo-performance.md` | Hard speed budgets (Core Web Vitals, Lighthouse), technical and local SEO, structured data |
| `references/security.md` | Secrets, security headers, forms, payments, dependencies, account ownership |
| `references/legal.md` | Photo and font rights, copyright, truthful claims and reviews, prices, disclaimers, privacy and cookies, accessibility |
| `references/anatomy.md` | What a page is built around for each kind of business (book a trip, book a table, stay, visit…) |
| `references/review.md` | Hero-first check and the fresh-eyes review |
| `references/process.md` | Briefing, sign-off, verifying with evidence, taking feedback |
| `references/craft.md` | Type, colour, spacing, shape, motion, states, forms, UX laws, accessibility |
| `references/dna/` | Design DNA: schema, generation guide, how Leeward applies it, saved DNA files |
| `scripts/` | Measure colours from a screenshot and score a build against a DNA file (Node, needs `sharp`) |
| `references/taste.md` | The constants, the four feels, and notes on each reference site |
| `references/stack.md` | Default stack and project structure |
| `references/ship-checklist.md` | Checks before anything is called finished |
| `references/feedback-log.md` | Corrections from Leeward, newest first; these override everything else |

## Improving it

When Claude gets something wrong, say what and why. The correction goes into `feedback-log.md` as a rule
(and into the relevant file), so it doesn't need saying twice.

This repo has no Vercel project, so changes here never trigger a deployment.
