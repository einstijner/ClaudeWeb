# Ship checklist

Don't call a build finished until every line is true, or the handoff says why not. Lines marked
**GATE** block launch outright: a site that fails one doesn't go live.

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

## Fast (`seo-performance.md`)
- [ ] **GATE** Lighthouse mobile on the production build: Performance ≥ 90, Accessibility ≥ 95, Best Practices 100, SEO 100. Scores recorded in the handoff.
- [ ] **GATE** LCP ≤ 2.5s, CLS ≤ 0.1, INP ≤ 200ms.
- [ ] First-load JS ≤ 150KB gzipped per page; hero image ≤ 200KB, preloaded; everything else lazy.
- [ ] Fonts via `next/font`, at most 2 families; no layout shift.
- [ ] Every third-party script justified, deferred, and listed for the privacy policy.

## Accessible (`craft.md`, `legal.md`)
- [ ] **GATE** WCAG 2.2 AA: keyboard, contrast, labels, alt text, focus, zoom to 200%. The booking path is fully usable by keyboard and screen reader.
- [ ] One `h1`, logical headings, landmarks, `aria-labelledby` on sections.
- [ ] Real alt text (empty alt for decorative duplicates). Colour contrast ≥ 4.5:1 for text.
- [ ] Visible `:focus-visible` styles; whole site usable by keyboard; menu traps and restores focus.
- [ ] `prefers-reduced-motion` respected.

## Found (`seo-performance.md`)
- [ ] **GATE** Production is indexable (no stray `noindex`); one canonical https domain with 301s from the others.
- [ ] **GATE** Replacing an old site: every old URL with traffic or links has a 301 to the closest new page.
- [ ] Unique title (≤ 60 chars) and description (120–160) per page, canonical URL, 1200×630 OG image per page.
- [ ] LocalBusiness (or subtype) JSON-LD with real data, validated in the Rich Results Test. No self-made review markup.
- [ ] Business name, address and phone exactly match the Google Business Profile.
- [ ] `sitemap.xml`, `robots.txt`, real 404, `hreflang` if multilingual, favicon, apple icon, `theme-color`.

## Secure (`security.md`)
- [ ] **GATE** No secrets in the repo or in client code; nothing secret in `NEXT_PUBLIC_*`; `.env*` ignored.
- [ ] **GATE** HTTPS everywhere; security headers set (HSTS, CSP, nosniff, Referrer-Policy, Permissions-Policy, frame-ancestors).
- [ ] **GATE** Forms validated on the server, spam-protected, rate-limited where they send email.
- [ ] Payments only through Stripe Checkout or a hosted page; webhook signatures verified; prices calculated on the server.
- [ ] `npm audit`: no unexplained high/critical issues. `rel="noopener noreferrer"` on new-tab links.
- [ ] Client owns the domain and accounts; 2FA and registrar lock on; SPF/DKIM/DMARC set.

## Legal (`legal.md`)
- [ ] **GATE** Every image, video, font, icon and music file has a recorded source and commercial licence; client's written OK on their photos; releases for identifiable people.
- [ ] **GATE** No invented reviews, ratings, stats, awards or superlatives; every claim has a source.
- [ ] **GATE** Privacy policy matches the real setup; no tracking cookies or pixels before consent where GDPR applies.
- [ ] Prices (if shown) state the currency, inclusions, taxes and fees.
- [ ] Booking terms, cancellation policy, safety/activity notice and other disclaimers linked from the footer and booking form, as client-supplied text or clearly marked placeholders for their lawyer.
- [ ] Footer: legal/trading name, address, contact, registration number if any, © year. Accessibility statement page.
- [ ] Original copy only, nothing lifted from competitors or review sites.

## Reviewed (`review.md`)
- [ ] Fresh-eyes review ran with the lenses for the job: every lens completed (or is listed as `not run`), no unsettled Blocker or Major left. A self-review is called a self-review.
- [ ] A stranger's answer to "what is this place and how do I book?" (First visit lens) matches `brief.md`.
- [ ] `review/review-report.md` saved; every ASK THE OWNER item put to the owner.

## Handoff
- [ ] `brief.md` current: every decision the owner made is in it.
- [ ] README: how to run, where each fact lives, what the client must do (e.g. activate FormSubmit).
- [ ] List of placeholders and anything still needed from the client, including everything waiting on their lawyer.
- [ ] Asset and licence log, third-party services list, account ownership list.
