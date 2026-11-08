# Legal and rights: hard rules

The goal is a site that gives nobody a reason to sue the client or Leeward: no stolen photos, fonts or
words, no false claims, no hidden data collection, no inaccessible booking path, and clear terms.

**Limits.** No site is "sue-proof", and this file is not legal advice. Claude does not write binding
legal documents (terms and conditions, waivers, cancellation policies, privacy policies) as final text.
It drafts them as **placeholders marked for the client's lawyer to review**, and lists them in the
handoff. When something is legally unclear, say so and flag it; don't guess.

## Which laws to assume

Leeward's clients are mostly in Sint Maarten / Saint-Martin and the Caribbean, and their visitors come
from the US, Canada, the Netherlands and the rest of Europe. Build for the strictest that plausibly
applies:
- **EU GDPR and ePrivacy** apply when a business is established in the EU (French Saint-Martin is part
  of the EU) or targets visitors in the EU. Treat every site as if GDPR applies.
- **Local data protection law** on the Dutch side, and the rules of the client's own country.
- **US accessibility lawsuits (ADA)** are routinely filed against websites of businesses serving US
  customers, including tourism businesses. Meeting WCAG 2.2 AA is the defence.
- **Consumer protection and advertising rules** (EU, US FTC): truthful claims, clear prices, no fake
  reviews.
If the client operates somewhere else, note it and ask.

## Photos, video and other media

Every image, video, illustration, icon, font and sound file on the site needs a known source and a
licence that allows commercial use on a website. Record it.

- **Track every asset** in `lib/images.ts` (or `CREDITS.md`): file, source, owner, licence, date, and
  any credit required. No entry means it doesn't ship.
- **Client photos:** confirm in writing (email is fine) that the client owns them or has a licence to
  use them on the website and social media. A photographer's photos usually belong to the photographer,
  not the client, unless a contract says otherwise.
- **People in photos:** an identifiable person needs a model release or clear consent for marketing
  use. Children: written parental consent or don't use it. Avoid identifiable people from stock in
  ways that imply endorsement.
- **Stock:** only from sources with a commercial licence (Unsplash, Pexels, or paid stock) and within
  the licence's limits (no implying the person endorses the business, no reselling as-is). Credit even
  when not required, as Reel Charters does. Watermarked previews are never used.
- **Never:** images from Google Images, Instagram, Pinterest, TripAdvisor, competitors' sites or
  other businesses' social accounts without written permission. Screenshots of other sites only for
  internal reference.
- **AI-generated images:** don't use them to show the real business, boat, food, room or place as if
  they were photos (that misleads customers). If used for decoration, follow the generator's
  commercial terms and keep a record.
- **Trademarks and logos:** don't show other companies' logos (payment brands, partners, "as seen on")
  unless the client actually has that relationship and the brand's guidelines allow it. Describing
  facts is fine ("Sunseeker 52").
- **Maps:** use Google Maps/OpenStreetMap through their official embeds or APIs, with attribution.
- **Fonts:** Google Fonts (OFL) are fine. Commercial fonts need a web licence for this client's
  domain. Never self-host a font copied from another site.
- **Music in video:** licensed for commercial web use, or no music.
- **Code and templates:** respect the licence of anything copied in (MIT/Apache notices kept). Never
  copy another site's design or text wholesale.

## Words and claims

- **No copying.** Never lift text from competitors, TripAdvisor or other sites. Write original copy.
- **True claims only.** No "best", "#1", "safest", "cheapest", "award-winning", "licensed and
  insured", "eco-friendly" or numbers ("10,000 happy guests") unless the client provides proof, and
  record where it came from.
- **Reviews and testimonials:** only real ones, with the reviewer's permission or from a public
  source quoted accurately with a link, never edited to change their meaning, never written by the
  business or Leeward. Fake reviews are illegal in the US (FTC rule, 2024) and the EU. Don't show a star
  rating that isn't the real current one.
- **Prices:** if shown, state the currency, what's included, and taxes, fees and port charges. "From"
  prices must be genuinely available. Drip-pricing hidden fees is illegal in many places. Keep prices
  in one data file so they can't go out of date in five places.
- **Availability and schedules:** say what's a request and what's a confirmed booking ("Send a request
  — we confirm by WhatsApp within a day"). Never show "Booked!" for an enquiry.

## Disclaimers and terms the client must supply (placeholders until they do)

Where they fit the business, link these from the footer and the booking form:
- **Booking terms and cancellation and refund policy,** including weather cancellations, no-shows,
  deposits and changes.
- **Activity and safety notice** for tours, boats, water sports and diving: participation at own risk,
  instructions from the crew, health conditions, swimming ability, age and weight limits, no alcohol
  before operating equipment, and that conditions or itineraries can change. A liability waiver is a
  signed document from the client's lawyer, not website text.
- **Alcohol:** a legal-drinking-age statement where alcohol is served or sold; no marketing of alcohol
  to minors.
- **Health and allergens** for food businesses: "Tell us about allergies; dishes may contain
  traces of…"
- **Third-party services** (transfers, partner venues): who provides what.
- **Information accuracy:** "Times, menus and prices may change; confirmed details are in your booking
  confirmation."

## Privacy and cookies

- **Privacy policy** on every site that collects anything (forms, analytics, cookies, newsletter,
  WhatsApp links). It names the business and its contact details, what's collected and why, the
  processors (for example FormSubmit, Vercel, Stripe, Google, Meta), where data goes (often outside
  the EU), how long it's kept, and how to ask for access or deletion. Draft from the site's real setup;
  mark it for the client to review.
- **Collect the minimum.** Forms ask only what the booking needs. Explain why next to sensitive fields
  (phone/WhatsApp for confirming).
- **Consent before tracking.** No analytics, Meta Pixel, Google Ads tags, TikTok pixels, Hotjar or
  embedded YouTube/maps that set cookies before the visitor agrees, where GDPR applies. Reject must be
  as easy as accept; no pre-ticked boxes. Prefer cookie-less analytics so no banner is needed.
  Strictly necessary cookies need no consent.
- **Marketing email:** separate opt-in checkbox, never pre-ticked, never required to book.
- Forms send over HTTPS, and notification emails don't contain more personal data than needed.

## Business identity

- Footer: the business's legal or trading name, physical address, phone and email, and its Chamber of
  Commerce or registration number where the client has one. EU rules require clear trader
  identification for businesses selling to consumers online.
- `© {current year} {legal name}`. Leeward credit only if the client agrees.
- **Accessibility statement** page: the standard aimed for (WCAG 2.2 AA), known limits, and a contact
  for problems. Combined with actually meeting the standard, this is the best defence against
  accessibility lawsuits.

## Handoff: what Claude lists for the client every time

- Every placeholder (terms, policies, prices, claims, reviews) still waiting on the client or their lawyer.
- The asset and licence log, and any photo whose rights still need written confirmation.
- Every third-party service the site uses (for the privacy policy and consent banner).
- Which accounts the client owns.
