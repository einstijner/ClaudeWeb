# Never ship these

These are the signs of a site made from a template or by AI without thought. Any one of them means the
section isn't finished.

## Owner's hard rules (no exceptions)
- **No pill-shaped buttons.** Buttons, chips, tags and inputs use a 4–10px radius.
- **No two buttons in the hero.** One action at most, or none.
- **No drastic fonts or colours.** No novelty/script/distorted display fonts, no neon, no multi-colour
  palettes, no decorative gradients. One accent colour per site.

## Copy
- Empty superlatives: "unforgettable", "elevate", "seamless", "curated", "world-class", "experience
  the magic", "nestled", "paradise awaits", "your journey begins", "look no further".
- Headlines that could belong to any business. Test: swap in a competitor's name. If it still works, rewrite it.
- Invented facts: testimonials, star ratings, "500+ happy guests", awards, years, prices, staff names.
  Use a clearly marked placeholder and list it in the handoff.
- Three-word triads ("Relax. Explore. Indulge.") and rhetorical questions as headlines.
- Feature lists of generic icons + "Quality / Service / Passion".
- Emoji in UI copy.
- Lorem ipsum anywhere in a version the client sees.

## Visual
- Hero with "Book now" + "Learn more" side by side.
- Purple/blue/pink gradient heroes, gradient text, glowing blobs, glassmorphism everywhere.
  (One glass button over a photo is fine; a glass UI is not.)
- The default SaaS layout: centred hero → three icon cards → testimonial carousel → pricing → CTA.
  Hospitality sites are built around photos, places and the booking path.
- Inter/Roboto/system font as the whole personality. Pick a display face that fits the place.
- Everything centred. Everything in identical rounded cards with identical shadows.
- Icons as decoration. An icon earns its place by carrying meaning (WhatsApp, map pin, check).
- Stock photos of people pointing at laptops, handshakes, generic smiling models.
- Hover animations on everything, scroll-triggered fade-ins on every section, parallax for its own sake.
- Carousels/sliders for primary content (nobody sees slide 2). Use a grid or a single strong image.
- Dark mode toggles, cookie popups and chat widgets nobody asked for.
- Random accent colours. Every colour comes from the token set.

## Build
- Tailwind class soup, or a UI kit look (shadcn defaults untouched) when the brand needs its own look.
- Images without width/height or `sizes`, giant unoptimised JPEGs, `<img>` where `next/image` fits.
- Forms that fail silently, or with no way to reach the business if the send fails.
- Links that go nowhere (`href="#"`), social icons for accounts that don't exist.
- Layout that only works at 1440px. Mobile is where most guests book.
