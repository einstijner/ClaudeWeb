# Craft

Rules for how type, colour, space, motion, states and forms behave on every Leeward site. The feel and
DNA decide *which* fonts and colours; this file decides *how they're used*. Adapted from open-design
(Apache-2.0, partly from refero_skill, MIT) and Impeccable (Apache-2.0); see `NOTICE.md`.

## Typography

**Scale.** Use a ratio of about 1.2–1.25 with at most 6–8 sizes per site. At most 3 sizes visible
above the fold.

| Role | Size |
| --- | --- |
| Display (hero) | 48–80px desktop, 36–48px mobile, via `clamp()` |
| H2 | 32–48px |
| H3 | 20–24px |
| Body | 16–18px |
| Small | 13–14px |
| Caption / eyebrow | 11–13px |

**Leading.** Display and headings 1.0–1.2; body 1.5–1.65.

**Letter-spacing** (the most skipped rule, and the most reliable tell when it's wrong):

| Text | Tracking |
| --- | --- |
| Body | 0 |
| Small text, labels, buttons | +0.01 to +0.02em |
| ALL CAPS (rare) | **+0.06 to +0.16em, always** |
| Headings 32px+ | −0.01 to −0.02em |
| Display 48px+ | −0.02 to −0.04em |

**Weights.** Usually three: read (400), emphasise (500–600), announce (600–700). Antigravity shows a
huge headline can sit at 400–450 and still dominate; don't default to bold.

**Font weight on the wire.** Japanese, Chinese and Korean fonts (Shippori Mincho, Noto Serif JP…) ship as
dozens of files even with `subsets: ["latin"]`; one cost Hanami 4MB and a 26-second LCP. For an English
site, use a Latin face and get any Japanese mood from spacing and photography. Load only the weights used
(usually 2 per family) and check `.next/static/media` stays under about 200KB.

**Pairing.** At most 2 families (display + body, or one family at several weights). Always declare a
fallback stack. Never `system-ui` alone as the personality.

**Line length.** Body copy 50–75 characters: `max-width: 65ch`. Use `text-wrap: balance` on headings
and `text-wrap: pretty` on paragraphs. Use `&nbsp;` to stop orphans in short headlines and to keep
names together ("St.&nbsp;Barts").

## Colour

**Structure.** Neutrals 70–90% of pixels (background, surface, text, muted, borders); **one** accent at
5–10%; semantic colours (success, error) only where needed; effects (gradients, glows) under 1%, and
usually zero.

**Accent discipline.** At most about 2 visible uses of the accent per screen (for example, a highlighted word and
the primary button). Links in body text can be the ink colour, underlined.

**Contrast gates.** Body text 4.5:1 minimum; large text (24px+, or 19px+ bold) 3:1; UI components and
borders that carry meaning 3:1. Text over photos needs a shade/scrim that guarantees this at every
crop, not just at 1440px.

**Near-black and near-white.** Prefer `#111`–`#1d1d1f` ink over pure black and an off-white
(`#fafafa`, or warm like Tres's `#f6f3ee`) where it suits the feel. On dark surfaces, use hairline
borders like `rgba(255,255,255,.08–.2)`.

**Light or dark comes from where the site is used,** not from the category. Write one sentence of the
scene first: a guest on a sunny deck checking times on a phone wants a light page with strong contrast
that survives glare; a night-time beach club's events page may want dark. A dark page in bright
sunlight is hard to read.

**Shadows** have an offset and a soft blur, and are used once as a depth system. A zero-offset coloured
glow is decoration, not depth.

**Name tokens by purpose** (`--ink`, `--paper`, `--accent`, `--line`), not by hue (`--blue-500`).

**Overscroll.** Set the `html` background to a brand tone so pulling past the top or bottom never
flashes the wrong colour.

## Space and layout

- Use a 4/8px base scale. Sections need generous vertical padding: `clamp(64px, 10vw, 140px)` for
  premium, tighter for in-depth.
- **Proximity groups.** 8–12px inside a group, 32–48px between groups. Uniform spacing everywhere reads
  as nothing being grouped.
- Use one max width (`--wrap`, about 1200–1280px) and a fluid gutter `clamp(20px, 4vw, 40px)`.
- Vary the density: alternate a tight section with a breathing one, so not every section is the same
  centred stack.
- Full-bleed photography breaks the grid on purpose; the text stays on the grid.
- More space above a heading than below it, so the heading belongs to what follows.

**The parts the browser draws.** Theme them from the tokens; models skip these most reliably:
`::selection` colours, `caret-color`, `accent-color` on checkboxes, radios and date pickers,
`scrollbar-color` where a panel scrolls, `text-underline-offset` and thickness on links, and
`font-variant-numeric: tabular-nums` wherever times, prices or durations line up in a column.

## Shape

Controls 0–10px (`anti-slop.md`; square is fine, as ZapCat shows). Cards and images take one radius
set by the feel (0–20px), the same across the site.

## Motion

Animate when the user moves through space, time or state (opening a menu, a form submitting, a page
transition). Don't animate to decorate or to "feel premium".

| Duration | Use |
| --- | --- |
| 50–100ms | Press, toggle, hover feedback |
| 150–200ms | Default state change |
| 200–300ms | Menus, drawers, modals entering |
| 300–500ms | Page transitions, larger reveals |

- Mobile motion runs 20–30% shorter. Frequent effects (hover) stay at 200ms or under.
- Easing: `cubic-bezier(0.2, 0, 0, 1)` for entering, plain `ease-out` for small things. No bounce
  unless the feel is playful.
- `@media (prefers-reduced-motion: reduce)` removes movement (translate, scale, parallax, autoplay
  video loops); keep simple fades where a state change must still show.
- Hero video: a pause control and a still image for reduced motion and slow connections (budget in
  `seo-performance.md`).

## States

Every interactive thing renders all its states, not just the happy one:

- **Forms:** untouched, focused, invalid (inline, specific message), submitting (button locked,
  "Sending…"), success (what happens next), failure (plain reason plus another way to reach the
  business, input kept).
- **Buttons and links:** default, hover, focus-visible, active, disabled.
- **Images:** loading (fixed aspect ratio so nothing jumps) and fallback colour.
- **Lists, menus and galleries:** the empty case and the very-long-text case (a 60-character dish
  name, a 3-line boat name) must not break the layout.

Error messages answer three things, in order: what happened, why (if known), and what to do now.

## Forms

- Validate on blur, not on the first keystroke; clear the error as soon as the field becomes valid.
- Use the right input types and `autocomplete` (`tel`, `email`, `name`, `bday`), plus `inputmode` for
  numbers.
- Labels stay visible; never use the placeholder as the label.
- Keep it as short as the booking really needs. Dates, guests, contact and a message box usually covers it.
- Use a native `<input type="date">` unless the client needs availability shown.
- On submit failure: keep everything typed, and offer a WhatsApp or email link prefilled with it.

## UX laws that decide composition

- **Hick's law:** fewer choices, faster decisions. One primary action per screen; a short nav (about
  5 items or fewer).
- **Fitts's law:** important targets are big and close: 44px+ tap targets, and the Book button within
  thumb reach on mobile (a sticky bottom bar or header).
- **Jakob's law:** visitors expect what other sites do: logo top-left goes home, nav top-right, contact
  in the footer. Be original in the look, not in the basic layout conventions.
- **Von Restorff:** the thing that looks different gets noticed, so only the primary action looks
  like a primary button.
- **Serial position and peak-end:** people remember the first and last things and the best moment.
  Spend effort on the hero, the booking confirmation and the footer.
- **Miller and chunking:** group information into small labelled chunks (times, inclusions, pickup)
  and don't write paragraphs of specs.
- **Aesthetic-usability:** a beautiful site is forgiven small friction, but never on the booking form.

## Accessibility baseline

- Semantic landmarks (`header`, `nav`, `main`, `footer`), one `h1`, headings in order, and
  `aria-labelledby` on sections.
- Everything works by keyboard, with a visible `:focus-visible` ring and a skip link. A mobile menu
  traps focus while open and returns it when closed.
- Real alt text that describes the photo for this business; `alt=""` for decorative duplicates.
- Never rely on colour alone to show an error or state.
- `lang` set on `<html>`, and on any block in another language.
- Text can zoom to 200% without breaking; no `maximum-scale=1`.
