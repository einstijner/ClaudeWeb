# Default stack

Use this unless the brief says otherwise. Reel Charters (`reel-charters-site/` in github.com/einstijner/reelcharter) is
the working reference implementation.

- **Next.js (App Router) + React + TypeScript**, deployed on **Vercel**.
- **Plain CSS** in `app/globals.css` with design tokens on `:root`. No Tailwind, no UI kit, unless asked.
- **Fonts** through `next/font/google`, exposed as CSS variables (`--font-display`, `--font-body`),
  `display: "swap"`. One display face plus one body face.
- **Icons**: `lucide-react`, used sparingly. Brand icons (WhatsApp etc.) as small inline SVG components.
- **Images**: `next/image` with real `sizes`; every photo registered once in `lib/images.ts` with
  width, height, alt text, optional `focus` (object-position) and stock credit.
- **Enquiries**: FormSubmit (or the client's tool) with fetch submit + plain HTML POST fallback, inline
  success/failure, and a WhatsApp/email link prefilled with what the guest typed if sending fails.
  Deep links preselect the trip (`/?trip=...#book`).
- **Payments**: Stripe Checkout when the client takes deposits online; otherwise "quoted on request".
- **SEO**: per-page metadata, canonical URLs, Open Graph images, LocalBusiness JSON-LD, sitemap, robots.
- **Security headers** in `next.config.ts` `headers()` (see `security.md`).
- **Legal pages:** `/privacy`, `/terms` (or booking terms), `/accessibility`, plus any client disclaimers.
- **Credits/licences:** every asset logged in `lib/images.ts` (or `CREDITS.md`) with source and licence.
- Node 22+, `npm run build` and `npm run lint` must pass.

## Structure

| What | Where |
| --- | --- |
| Business facts: contact, WhatsApp, addresses, hours | `lib/site.ts` |
| Products: boats, rooms, menu, trips | `lib/<thing>.ts` |
| Photos + alt + credits | `lib/images.ts` |
| Page sections | `components/<page>-sections.tsx` |
| Booking form + book buttons | `components/booking.tsx` |
| Tokens and styles | `app/globals.css` |

The client should be able to change a phone number, time or price in one file. Write a README with
that table for every project.
