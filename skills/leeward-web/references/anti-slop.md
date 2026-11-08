# Never ship these

These mark a site made from a template, or by AI without thought. Any one of them means the section isn't
finished. Partly adapted from open-design's anti-AI-slop rules (Apache-2.0).

## Owner's hard rules (no exceptions, whatever a reference site does)

1. **No pill-shaped buttons.** Buttons, chips, tags and inputs use a 0–10px radius.
2. **No two buttons in the hero.** One action at most, or none.
3. **No drastic fonts or colours.** No novelty, script, distorted or ultra-condensed display faces
   (unless the owner approves one for a playful site), no neon, no multi-colour palettes, no decorative
   gradients. One accent colour per site.

## The tells (must fix)

1. **Default AI colours.** Tailwind indigo/violet (`#6366f1`, `#4f46e5`, `#8b5cf6`, `#7c3aed`,
   `#a855f7`) or any accent that doesn't come from the brand or place.
2. **Two-stop "trust" gradient** on a hero or as section background (purple→blue, blue→cyan,
   indigo→pink), gradient text, glowing blobs.
3. **Emoji as icons** (✨🚀🎯⚡🔥💡) in headings, buttons or lists. Use monoline SVG icons in
   `currentColor`, and only where they carry meaning.
4. **Invented facts.** Testimonials, star ratings, "500+ happy guests", "#1 in SXM", awards, years in
   business, prices, staff names. Use a clearly marked placeholder and list it in the handoff.
5. **Filler copy.** Lorem ipsum, "Feature one/two/three", "Your journey begins", "Experience the
   magic", "Unforgettable", "elevate", "seamless", "curated", "nestled", "paradise awaits", "look no
   further", "world-class".
6. **Rounded card with a coloured left border.**
7. **Generic headline.** Swap in a competitor's name; if it still works, rewrite it.

## Soft tells (should fix)

- The default SaaS order: centred hero → three icon cards → testimonial carousel → pricing → FAQ → CTA,
  with no variation. Hospitality pages are built around photos, places, the offer and the booking path.
- Everything centred, every section the same height and padding, every card identical.
- The accent used all over the screen (more than about 2 visible uses per screen).
- Inter/Roboto/system font as the whole personality.
- Three-word triads ("Relax. Explore. Indulge.") and rhetorical-question headlines.
- Stock photos of people pointing at laptops, handshakes, posed models; placeholder-image services
  (`placehold.co`, `picsum.photos`) in anything the client sees.
- Carousels for primary content (nobody sees slide 2). Use a grid or one strong image.
- Scroll fade-ins on every section, parallax for its own sake, hover animations on everything.
- Decorative blob, wave or particle backgrounds that mean nothing. (Antigravity's particle field
  works because it's the product's identity; a beach bar doesn't need one.)
- Glassmorphism as a style. One glass button over a photo is fine.
- Dark-mode toggles, chat widgets, newsletter popups and cookie walls nobody asked for. A required
  cookie notice should be small.
- Social icons for accounts that don't exist, or `href="#"`.

## Template tells from Hallmark (must fix)

From [nutlope/hallmark](https://github.com/nutlope/hallmark) (MIT), the patterns that read as machine-made:

- **Eyebrows above every heading.** A small label ("OUR FLEET", "WHY US") over each section title is
  the most common AI tell. At most one per page where it carries real information (the hero's
  location line), and never over every section. *(Open question for the owner; see `taste.md`.)*
- **One coloured or italic word in a headline,** used by reflex on every heading. At most once per site,
  and only when that word is the point. *(Open question for the owner.)*
- **Tracked capitals everywhere:** nav links, tags, captions and table heads in spaced-out caps. Labels
  are the body face, a step smaller, sentence case.
- **Template punctuation:** meta strings joined with middle dots on every card ("Half day · 6 guests · From $"),
  arrows glued to every link ("Learn more →"), decorative status dots before labels.
- **Card inside a card;** three equal icon-on-top tiles; the same hover lift on every card; images
  zooming on hover.
- **Hand-drawn browser windows, phone frames or fake product UIs** made of divs.
- **Drawn illustrations** (SVG beaches, palm trees, boats) where a photograph belongs; empty
  gradient boxes standing in for photos; rows of identical dots or icons standing for a number.
- **The photo wall:** below the hero, photos covering more than about a third of the page so it reads as a
  stock gallery (a real gallery page is the exception).
- **The echo:** the same fact (a price, a time) repeated in four or more sections.
- **The fake send:** a form that says "Sent!" or "Reserved!" with nothing behind it. No success state
  until the form is really wired.
- **Too many words:** more than about 80 words on any one screen at 1440px. Fullness comes from scale and
  photography, never more copy.
- **Thin sections:** a heading and a line floating in a wide empty space; section headings under 40px
  on desktop.
- **The stock close:** an email sign-up band as the last section on a business that doesn't send a
  newsletter.

## Build floor (mechanical, always)

- Every colour and font goes through a token on `:root`; no literal colours or `font-family` outside it.
- Never `transition: all`; never animate `width`, `height`, `top`, `left`, `margin` or `padding`.
- `overflow-x: clip` on `html` and `body`; never `100vw` widths; no horizontal scroll at any width from 320
  to 1920.
- Image grids use `minmax(0, 1fr)`; display headings have `overflow-wrap: break-word; min-width: 0`.
- Hero height in `svh`/`dvh`, not `vh`. Container capped (about 1240–1440px) and centred at 1920.
- `:focus-visible` on every interactive element, appearing instantly, 3:1 contrast against its background.
- Every animation has a reduced-motion fallback; content is visible with JavaScript off (never hide
  content behind a reveal class that only JavaScript removes).
- Autoplay video is `muted playsinline` with a poster; never `loading="lazy"` on the LCP image.
- Controls 44–52px tall; inputs and the button beside them share a height; disabled shown by more
  than opacity alone.
- Button labels and main nav links never wrap at any width.
- No two `position: sticky; top: 0` elements fighting each other.
- One icon library per site; decorative SVGs get `aria-hidden="true"`.

## Build tells

- Tailwind class soup or an untouched UI-kit look when the brand needs its own.
- More than about 12 raw hex values outside `:root`, which means the tokens weren't followed.
- Images without dimensions or `sizes`, giant unoptimised JPEGs, `<img>` where `next/image` fits.
- Forms that fail silently or leave no other way to reach the business.
- Layout that only works at 1440px. Most guests book on their phone.

## Adding soul without breaking the rules

Aim for about 80% proven patterns and about 20% choices that belong to this client:
- **One bold move:** a type choice, a single colour decision, an unexpected crop or proportion.
- **Voice:** copy only this business would write ("Anguilla and St. Barts are full-day only").
  Button labels that say exactly what happens ("Request this trip" rather than "Submit").
- **One remembered detail:** ZapCat's GPS coordinates in the corner, Tres's season label, a menu
  that changes with the time of day.

The test: screenshot any section and show it to a stranger. If they can tell which business it
belongs to, it has soul. If not, it's a template.
