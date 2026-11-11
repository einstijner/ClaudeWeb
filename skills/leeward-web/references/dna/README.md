# Design DNA

A Design DNA file is a JSON description of a site's visual identity in three parts: **design system**
(measured tokens: colour, type, spacing, layout, shape, elevation, motion, components), **design
style** (mood, composition, imagery, voice) and **visual effects** (canvas, WebGL, scroll effects
and so on). From [zanwei/design-dna](https://github.com/zanwei/design-dna) (MIT); `schema.md` and
`generation-guide.md` are the upstream files, unchanged.

## How Leeward uses it

1. **Analyse.** Screenshot each reference at 1440px and 390px (Playwright). Run
   `scripts/measure-colors.mjs` on each screenshot; use the measured hexes verbatim. Read type, size,
   tracking, radius and spacing from the browser's computed styles where you can, rather than
   estimating. Fill every field in `schema.md`.
2. **Apply the owner's hard rules on top** (`anti-slop.md`), and note each override in the JSON's
   notes: pills become 6–8px rectangles, two hero actions become one, one accent, no decorative
   gradients, no novelty or script display faces. Strong `visual_effects` only when the feel calls for
   it (cinematic or playful), with a static fallback and a reduced-motion version; low otherwise.
3. **Generate.** Leeward builds in the normal stack (`stack.md`), not as one self-contained HTML
   file: DNA tokens become the CSS custom properties in `app/globals.css`. Follow the priority order
   in `generation-guide.md` (colour and type first, effects last).
4. **Verify.** Screenshot the build and run `scripts/verify.mjs` against the DNA file. Fix colours
   that fail and re-run; don't ask the owner to judge colour by eye.

## Saved DNA

Save reusable DNA here as `<feel>-<source>.json` (for example `premium-tres.json`), so a new build of
that feel can start from it. A project's own DNA lives in that project as `design-dna.json`.
