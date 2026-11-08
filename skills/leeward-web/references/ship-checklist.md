# Ship checklist

Don't call a build finished until every line is true, or the handoff says why not.

## Looks right
- [ ] Screenshotted at 390px, 768px and 1440px; nothing overflows, overlaps or wraps badly.
- [ ] No horizontal scroll on mobile. Tap targets ≥ 44px.
- [ ] Passes the hard rules and the anti-slop list; every headline specific to this business.
- [ ] One accent colour, used at most about twice per screen. Type tracking follows `craft.md` (caps tracked out, display tightened).
- [ ] If there's a `design-dna.json`: `verify.mjs` passes on the 1440px screenshot.
- [ ] Every photo crops well at every width (check `object-position`).
- [ ] 404 page and footer designed, not default.

## Works
- [ ] The main action (book / reserve / enquire / WhatsApp) is reachable from every screen on mobile.
- [ ] Form: validation on blur, submitting state, inline success and failure, input kept on failure, fallback contact route, test submission done.
- [ ] Every state rendered: hover, focus, disabled, loading, empty, error, long text.
- [ ] Every link and phone/WhatsApp/email link works. No `href="#"`.
- [ ] `npm run build` and `npm run lint` pass.

## Fast
- [ ] Hero image preloaded, sized and in a modern format; everything else lazy.
- [ ] Fonts via `next/font`, no layout shift. Lighthouse mobile performance ≥ 90.

## Accessible
- [ ] One `h1`, logical headings, landmarks, `aria-labelledby` on sections.
- [ ] Real alt text (empty alt for decorative duplicates). Colour contrast ≥ 4.5:1 for text.
- [ ] Visible `:focus-visible` styles; whole site usable by keyboard; menu traps and restores focus.
- [ ] `prefers-reduced-motion` respected.

## Found
- [ ] Unique title + description per page, canonical URL, OG image per page.
- [ ] LocalBusiness (or Restaurant/TouristTrip) JSON-LD with real address and contact.
- [ ] `sitemap.xml`, `robots.txt`, favicon, apple icon, `theme-color`.

## Handoff
- [ ] README: how to run, where each fact lives, what the client must do (e.g. activate FormSubmit).
- [ ] List of placeholders and anything still needed from the client.
