# Drift check (returning to an existing site)

A site is built to a brief and a set of rules, then edited for months. Facts change in one place and
not another, a quick fix adds a second accent colour, and rules the owner added to `feedback-log.md`
after launch were never applied. Adapted from Google's Elephant-Goldfish Model (Apache-2.0).

## When

- Before changing a Leeward site you didn't build in this session. Do the short version: only the
  `feedback-log.md` rules dated after the site's last commit, plus the GATE lines.
- When the owner asks to check, audit or update an existing site. Do the full version.

## What to compare

Read the source fresh; don't trust what you remember about the site. For each source of truth, compare
it with the code as it is now:

| Source | Compare with | Typical drift |
| --- | --- | --- |
| `brief.md` (facts, decisions) | `lib/site.ts`, `lib/<thing>.ts`, page copy | Old hours, a phone number in two places, a trip that no longer runs, prices shown that were meant to be "quoted on request" |
| `feedback-log.md` and the hard rules | Components and CSS | A pill button, a second hero button, an accent added in a component instead of a token |
| `design-dna.json` / tokens in `globals.css` | Hex values, fonts and radii in components | Colours and sizes hard-coded outside the tokens; a third font |
| GATE lines in `ship-checklist.md` | Build, headers, privacy policy, licence log | A new third-party script not in the privacy policy, an image with no licence entry, a stray `noindex` |
| Google Business Profile (if the owner gives it) | Footer and JSON-LD | Name, address or phone no longer match exactly |

If a fact or rule has no obvious home in the code, search for it (grep the phone number, the hex, the
font name). If you can't find where something lives, say so and suggest the line to add to the README
so next time it's quicker.

## Report

Write `review/drift-report-YYYY-MM-DD.md`. Report only differences, never what matches:

```markdown
## <source>
- <what the source says> vs <what the code does>, at `file:line`. GATE / hard rule / fact / style.
```

A source with nothing wrong gets one line: `No drift.`

Then tell the owner the count by kind and list every GATE and hard-rule break first. **Don't fix
drift silently.** Each item has two possible fixes, change the code or update the source (the brief
may be the stale one), and the owner picks. Exceptions: a GATE break or a hard-rule break is fixed in
the code, and you say so.
