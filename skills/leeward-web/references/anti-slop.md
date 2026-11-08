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
