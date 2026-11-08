# Taste

Leeward sites don't all look alike. Each project picks a **feel** first, and the feel sets type,
colour, density and motion. The constants below apply to every feel.

## Constants (every site, every feel)

- **Rectangular buttons.** Radius 4–10px. Never pill-shaped (no `border-radius: 999px` / `50vh` on
  buttons, chips, tags or inputs). Circles are fine only for icon badges that aren't buttons.
- **One action in the hero, at most.** Zero buttons is fine when the photo and headline carry it and
  the booking button lives in the header. Never a primary + secondary pair ("Book now" + "Learn more").
- **Restrained type and colour.** Fonts that read cleanly: no novelty, script, ultra-condensed,
  ultra-wide or heavily distorted display faces, no all-caps paragraphs. A neutral base (white, off-white,
  near-black or a deep brand tone) plus **one** accent taken from the brand or place. No neon, no
  rainbow sections, no gradients as decoration. Personality comes from photography, spacing and copy,
  not from loud fonts or colours.
- **Photo or product first**, with very little text above the fold.
- **Real details** (times, capacities, inclusions, locations) written plainly. Specific beats clever.
- **Calm motion**: short transitions, nothing that moves when `prefers-reduced-motion` is set.

## Feels

Pick one at the start from the brief and the client's brand, and say which you picked. Don't mix.

| Feel | When | Type | Colour | Density & layout | Motion |
| --- | --- | --- | --- | --- | --- |
| **Premium** | Yachts, fine dining, villas, boutique hotels | Refined serif or elegant sans for display, quiet sans body; generous size, tight leading | Near-monochrome, deep tone + one muted accent | Lots of whitespace, big full-bleed photography, few words per screen | Slow, subtle fades; nothing bouncy |
| **Playful** | Tours, beach bars, water sports, family activities | Friendly rounded or geometric sans (not a novelty font) | Brighter accent from the place (sea, sand, brand), still one accent | Looser rhythm, tilted/overlapping photos allowed, short punchy copy | A little more life: hover lifts, small reveals |
| **Simple** | Small local businesses, one-page sites, a single offer | One clean sans for everything | Neutral + brand accent | One page, short sections, booking/contact always one tap away | Minimal |
| **In-depth** | Many products, routes, menus, rooms; info-heavy clients | Highly legible sans, clear heading hierarchy | Neutral + accent used for wayfinding | Detail pages per product, filters/tabs, FAQ, comparison tables; structured, scannable | Minimal; speed matters more |

### Open question: eyebrows, tracked caps and accent words

Reel Charters and several of the owner's references (ZapCat, Leeward Digital, Tres) use small
uppercase labels above headings, and one coloured or italic word in headlines. Hallmark lists all of these
as AI tells when they're used by reflex. Until the owner decides: **at most one eyebrow and one accent
word per page**, where they carry meaning, never on every section.

Reel Charters is **premium leaning in-depth**: Fraunces + Manrope, navy/ocean palette, photo-led hero
with no buttons, detail pages per boat and island, booking prefilled from every card.

### Cinematic (proposed, waiting on the owner's examples)

The owner likes the cinematic sites shown by @webloved on TikTok. This feel is for premium clients who
want a site that feels like a film: full-bleed video or very large photography, slow scroll-driven
reveals, big type over moving imagery, dark palettes. It's the one feel where `visual_effects` in the DNA
may be strong, but only with a poster image, a pause control, a static reduced-motion version and good
mobile performance. Fill this in from the owner's chosen examples (DNA per site in `dna/`).

## Reference sites the owner likes

Studied 2026-11-07 (screenshots at 1440px and 390px, styles measured in the browser).

| Site | Feel | What to take from it |
| --- | --- | --- |
| [Tres Rotterdam](https://www.tresrotterdam.com/) | Premium (restaurant) | Full-bleed video hero with **nothing on it** but a small floating nav holding the logo and one "Reserve" button. One quiet italic line in a corner ("Complex without being complicated") and a tracked uppercase season label. Playfair Display for display, Source Sans 3 for body. Warm off-white `#f6f3ee`, brown-black ink `#38332e`. Confidence through restraint. |
| [Apple](https://www.apple.com/) | Premium / simple | The product photo *is* the hero. Headline = product name + one short line, centred. One family (SF Pro), semibold, tight negative tracking, 17px body. Black/white/grey with a single blue `#0071e3`. Every section repeats the same pattern, so the page feels calm however long it gets. |
| [Google Antigravity](https://antigravity.google/) | Simple (tech) | White page, huge 80px headline at **regular weight (450)**, not bold, with tight tracking; one Download button; a faint particle field as the only decoration. One font family (Google Sans Flex), near-black `#121317`. Shows a hero can be big without being loud. |
| [Leeward Digital](https://www.leewarddigital.com/) | Leeward's own (bold) | Very large bold headline (~120px, about -4% tracking) where two words carry the accent colour; small line above saying who and where ("Brand growth studio · St. Maarten & worldwide"); one-sentence subline. Navy `#0a1a3a` ink. |
| [ZapCat Tours](https://zapcattours.vercel.app/) | Playful (Leeward build) | Action photo full-bleed with people actually on the boats. Barlow Condensed 800 uppercase headline, tracked uppercase eyebrow ("ZAPCATS & ROCKET RIDES · SXM"), **square** yellow `#ffc400` buttons (radius 0), small GPS-coordinates detail in the corner. Energy comes from the photo and the type, not effects. |
| Reel Charters (Leeward) | Premium, in-depth | Photo-led hero with no buttons, booking prefilled from every boat/island card, WhatsApp fallback when the form fails. |

**Patterns across all of them:** one photo/product/video does the work in the hero; one type family or
one display + one body; one accent colour; very little copy above the fold; big headline with tight
tracking. Several add a small "who/where" line above the headline (see the open question below).

**Where they break the owner's rules (don't copy these parts):** Tres, Apple, Antigravity and Leeward
use pill buttons; Apple, Leeward and ZapCat put two buttons in the hero; Leeward's soft blue
glow background and ZapCat's orange script accent are the closest any of them get to "drastic".

## Sites that are bad / template-y (owner to fill in)

| Site | What's wrong |
| --- | --- |
| _TODO_ | |
