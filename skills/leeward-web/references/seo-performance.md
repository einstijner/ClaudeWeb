# SEO and speed: hard rules

These are release gates, not nice-to-haves. A site that fails one doesn't ship; the handoff says
which one and why.

## Speed budgets (mobile, measured)

Measure with Lighthouse in mobile mode on the production build (`npm run build && npm start`, or the live
URL), plus PageSpeed Insights once it's live. Field data (Core Web Vitals) is judged at the 75th
percentile of real visits.

| Metric | Gate |
| --- | --- |
| Largest Contentful Paint (LCP) | ≤ 2.5s (aim for ≤ 2.0s) |
| Interaction to Next Paint (INP) | ≤ 200ms |
| Cumulative Layout Shift (CLS) | ≤ 0.1 (aim for ≤ 0.05) |
| Lighthouse mobile: Performance | ≥ 90 |
| Lighthouse: Accessibility / Best Practices / SEO | ≥ 95 / 100 / 100 |
| JavaScript shipped on first load | ≤ 150KB gzipped per page |
| Hero image | ≤ 200KB (AVIF/WebP), correct `sizes`, preloaded |
| Total first-load page weight | ≤ 1.5MB without video |

How to stay inside them:
- **Images:** `next/image` everywhere, with real `width`/`height` or `fill` plus an aspect-ratio box,
  correct `sizes`, AVIF/WebP. Preload only the hero (`priority`/`preload`); lazy-load everything else.
  Originals no larger than about 2400px on the long side.
- **Video:** never the LCP element on its own. Show a poster image first, use `preload="none"` or
  `metadata`, keep it muted and `playsinline`, keep it short (about 5–15s loop), and ≤ 3–5MB at 1080p
  (H.264/MP4 plus WebM). Ship a lower-resolution file for mobile, or the poster only on slow data and
  reduced motion.
- **Fonts:** `next/font` (self-hosted, subset, `display: swap`), at most 2 families and 4 files total.
  No layout shift from font swap.
- **JavaScript:** Server Components by default; `"use client"` only where there's interaction.
  No animation library for what CSS does. No jQuery, sliders or page-builder bundles.
- **Third-party scripts** (analytics, chat, pixels, maps, booking widgets): each one has to be
  justified. Load with `next/script` `lazyOnload`/`afterInteractive`; embed maps as a click-to-load
  static image. Every one also goes in the privacy policy.
- **Caching:** static generation where possible; long cache headers on hashed assets (Vercel does this).

## Technical SEO (every page)

- Unique `<title>` (≤ 60 characters, includes the place: "Private Boat Charters in St. Maarten |
  Reel Charters") and a unique meta description (120–160 characters, written to be clicked).
- Exactly one `h1`, describing the page. Headings in order. Real text, not text baked into images.
- Canonical URL on every page; one domain (redirect `www`/non-`www` and `http` to the canonical
  https URL with a 301).
- Clean, readable URLs (`/fleet/solara`, `/destinations/anguilla`), lower-case, hyphenated, stable.
- `sitemap.xml` (only canonical, indexable 200 pages) and `robots.txt` pointing to it.
- Production is indexable; previews and staging are not. Vercel marks preview deployments `noindex`;
  check production has no stray `noindex`.
- Open Graph and Twitter cards with a 1200×630 image per page (real photo, not just the logo).
- `lang` on `<html>`. Multilingual sites: one URL per language plus `hreflang` alternates (including
  `x-default`); never switch language only with JavaScript.
- Proper 404 page (real 404 status) and no broken internal links.
- **Replacing an old site:** list every old URL that has traffic or backlinks (Search Console, old
  sitemap) and 301 it to the closest new page. Never launch a redesign without a redirect map.
- Image `alt` describes the photo for this business ("Solara anchored off Shoal Bay, Anguilla").
  Descriptive file names.

## Structured data (JSON-LD)

- `LocalBusiness` or the closest subtype (`Restaurant`, `BarOrPub`, `TravelAgency`,
  `LodgingBusiness`…) with the real legal name, address, geo coordinates, phone, opening hours, `url`,
  `image`, `sameAs` (real social profiles) and `priceRange` only if true.
- Products or trips: `Product`/`Offer` or `TouristTrip` only with real data. `FAQPage` only for FAQs
  visible on the page. `BreadcrumbList` on deep pages.
- **Never** add review or rating markup the business didn't genuinely receive, or reviews it wrote about
  itself. Google penalises it, and fake reviews are illegal in many markets (see `legal.md`).
- Validate with Google's Rich Results Test before launch.

## Local SEO (where most of these clients win)

- Name, address and phone written exactly as on the Google Business Profile, in the footer and contact
  page, as real text.
- Link the Google Business Profile, TripAdvisor and others in `sameAs` and the footer.
- Content that answers what visitors search for: one page per real offer/place ("Anguilla day trip
  by boat"), real times, real pickup points, a real FAQ. No doorway pages or keyword stuffing.
- Embedded map: click-to-load or a static image linking to Google Maps.

## Launch steps

- Verify the domain in Google Search Console, submit the sitemap, and check coverage after a few days.
- Run PageSpeed Insights on the live URL and record the scores in the handoff.
- Analytics only with consent where the law requires it (`legal.md`); prefer privacy-friendly,
  cookie-less analytics (for example Vercel Analytics) where the client is happy with it.
