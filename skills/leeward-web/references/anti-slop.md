# Never ship these

Anything here means the section isn't finished. Sources: open-design's anti-AI-slop rules
(Apache-2.0), Hallmark's template tells (MIT), Impeccable's default looks (Apache-2.0); see `NOTICE.md`.

## The owner's hard rules (whatever a reference site does)

1. **No pill-shaped buttons.** Buttons, chips, tags and inputs: 0–10px radius. Circles only for icon
   badges that aren't buttons.
2. **One action in the hero, or none.** Never a primary + secondary pair ("Book now" + "Learn more").
   Zero is fine when the photo and headline carry it and Book lives in the header.
3. **No drastic fonts or colours.** No novelty, script, distorted, ultra-condensed or ultra-wide
   display faces (unless the owner approves one for a playful site), no all-caps paragraphs, no neon,
   no multi-colour palettes, no decorative gradients. **One accent colour per site,** taken from the
   brand or the place. Personality comes from photography, spacing and copy.

## Must fix

**Facts and words**
- **Invented facts:** reviews, ratings, "500+ happy guests", "#1 in SXM", awards, years, prices, staff
  names. Use a marked placeholder and list it in the handoff (`legal.md`).
- **Generic headline:** swap in a competitor's name; if it still works, rewrite it.
- **Filler copy:** lorem ipsum, "Your journey begins", "Experience the magic", "Unforgettable",
  "elevate", "seamless", "curated", "nestled", "paradise awaits", "look no further", "world-class".
- **Too many words:** more than about 80 on one screen at 1440px. Fullness comes from scale and photos.
- **The echo:** the same fact (a price, a time) repeated in four or more sections.
- **The fake send:** "Sent!" or "Reserved!" with nothing wired behind it.

**Colour and surface**
- Default AI colours (Tailwind indigo/violet: `#6366f1`, `#4f46e5`, `#8b5cf6`, `#7c3aed`, `#a855f7`),
  or any accent not from the brand or place.
- Two-stop "trust" gradients (purple→blue, blue→cyan, indigo→pink), gradient text, glowing blobs.
- Shadows with no offset (a coloured glow or halo); hard offset "block" shadows (`4px 4px 0`) outside a
  deliberately brutalist site.

**Template patterns**
- **Eyebrows over every heading** ("OUR FLEET", "WHY US") and **a coloured or italic word in every
  headline.** Current limit: one of each per page, only where it carries meaning (open question,
  `taste.md`).
- Tracked capitals everywhere: nav links, tags, captions, table heads. Labels are the body face, a step
  smaller, sentence case.
- Template punctuation: middle-dot meta strings on every card ("Half day · 6 guests · From $"),
  arrows on every link ("Learn more →"), decorative status dots.
- Card inside a card; three equal icon-on-top tiles; a rounded card with a coloured left border; the
  same hover lift or image zoom on every card.
- Section numbers (01 / 02 / 03) when the order means nothing to the visitor.
- Emoji or glyphs as icons. One SVG icon library in `currentColor`, only where an icon carries meaning.
- Drawn illustrations (SVG beaches, palms, boats) or empty gradient boxes where a photograph belongs;
  div-drawn browser windows or phone frames; circle or polygon cut-outs faking the edge of something
  in a photo; rows of dots or icons standing for a number.
- **The photo wall:** below the hero, photos covering more than about a third of the page (a real
  gallery page is the exception).
- **Thin sections:** a heading and a line adrift in empty space; section headings under 40px on desktop.
- **The stock close:** an email sign-up band ending the page of a business that sends no newsletter.
- Monospace as decoration rather than for times, coordinates or codes.
- A modal or pop-up for something that could sit on the page.

**Build**
- Tailwind class soup or an untouched UI-kit look; more than about 12 raw hex values outside `:root`.
- Images without dimensions or `sizes`, unoptimised JPEGs, `<img>` where `next/image` fits.
- Forms that fail silently or leave no other way to reach the business.
- Layout that only works at 1440px. Most guests book on their phone.

## Should fix

- The default SaaS order (centred hero → three icon cards → testimonial carousel → pricing → FAQ →
  CTA). Build around the visitor's job instead (`anatomy.md`).
- Everything centred, every section the same height, every card identical.
- Inter, Roboto or the system font as the whole personality.
- Three-word triads ("Relax. Explore. Indulge.") and rhetorical-question headlines.
- Stock clichés (laptops, handshakes, posed models); `placehold.co` or `picsum.photos` in anything the
  client sees.
- Carousels for primary content. Use a grid or one strong image.
- Fade-ins on every section, parallax for its own sake, hover animation on everything.
- Blob, wave or particle backgrounds that mean nothing; glassmorphism as a style (one glass button over
  a photo is fine).
- Dark-mode toggles, chat widgets, newsletter pop-ups and cookie walls nobody asked for.
- Social icons for accounts that don't exist, or `href="#"`.

## Default looks

Left to choose, AI-built sites land on a few looks whatever the business is. Fine when the logo, the
DNA or the owner asks for one; landing there by default means nobody decided.
- **Cream page, high-contrast serif, terracotta or red accent.** Claude's own habit for anything warm,
  family or "boutique" (the Hanami failure in `feedback-log.md`). Treat that first palette as spent.
- Near-black page, one neon accent, glowing edges.
- Editorial hairlines, italic display serif, tracked mono labels.
- Flat bright colour, black boxes, block shadows, heavy condensed type.
- **The Caribbean postcard:** turquoise, sand and coral, palm leaves, wave dividers, a script
  "paradise". The place is the photos' job, not the palette's.

**The check:** could someone guess the look from the category alone ("beach bar, so turquoise and
sand")? If yes, rework it from the logo, the photos and the DNA.

**Reflex fonts** need a reason specific to this client (the logo's lettering, a DNA file); "it's a
yacht, so a serif" isn't one: Fraunces, Playfair Display, Cormorant, Lora, Crimson, Newsreader, DM
Serif, DM Sans, Outfit, Plus Jakarta Sans, Space Grotesk, Space Mono, IBM Plex, Syne, Instrument Sans,
Inter as display. (Reel Charters uses Fraunces: open question, `taste.md`.)

## Photo stand-ins (no client photos yet)

Light boxes in a paper tone with a hairline border and a caption saying which photo goes there; never
dark slabs (Hanami). At most two per page; slim (3:1) for wide ones. If the name is strong, let the
type lead the hero.

## Build floor (mechanical, always)

- Every colour and font through a token on `:root`.
- Never `transition: all`; animate only `transform` and `opacity`.
- `overflow-x: clip` on `html` and `body`; never `100vw`; no horizontal scroll from 320 to 1920px.
- Image grids `minmax(0, 1fr)`; display headings `overflow-wrap: break-word; min-width: 0`.
- Hero in `svh`/`dvh`, never `vh`. Container capped (about 1240–1440px) and centred at 1920.
- `:focus-visible` on everything interactive, instant, 3:1 against its background.
- Reduced-motion fallback for every animation; content visible with JavaScript off.
- Autoplay video `muted playsinline` with a poster; never `loading="lazy"` on the LCP image.
- Controls 44–52px tall; an input and its button share a height; disabled shown by more than opacity.
- Button labels and main nav links never wrap.
- No two `position: sticky; top: 0` elements fighting.
- Decorative SVGs `aria-hidden="true"`.

## Soul

About 80% proven patterns, 20% choices that belong to this client:
- **One bold move:** a type choice, a colour decision, an unexpected crop or proportion.
- **Voice:** copy only this business would write ("Anguilla and St. Barts are full-day only"); buttons
  that say what happens ("Request this trip", not "Submit").
- **One remembered detail:** ZapCat's GPS coordinates, Tres's season label, a menu that changes with
  the time of day.

The test: show any section to a stranger. If they can tell which business it belongs to, it has soul.
