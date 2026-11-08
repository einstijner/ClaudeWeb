# Security: hard rules

Small business sites get attacked by bots constantly: form spam, credential stuffing on admin panels,
leaked API keys, domain hijacking. These are release gates.

## Secrets

- API keys, Stripe secret keys, SMTP passwords and webhook secrets live only in environment variables
  (Vercel project settings), **never** in the repo, in client components, or in `NEXT_PUBLIC_*`
  variables. Anything starting `NEXT_PUBLIC_` is public.
- `.env*` is in `.gitignore`; ship `.env.example` with names only.
- If a secret is ever committed or pasted somewhere public: rotate it immediately. Deleting the commit
  isn't enough.

## Headers (set in `next.config.ts` `headers()` or `vercel.json`)

- HTTPS only, with `Strict-Transport-Security: max-age=63072000; includeSubDomains; preload` once the
  domain is stable.
- `Content-Security-Policy` listing only the origins the site uses (self, the form endpoint, Stripe,
  analytics). Start with `Content-Security-Policy-Report-Only` if unsure, then enforce.
  `frame-ancestors 'none'` (or `'self'`) to stop clickjacking.
- `X-Content-Type-Options: nosniff`, `Referrer-Policy: strict-origin-when-cross-origin`,
  `Permissions-Policy` turning off camera, microphone and geolocation unless used.
- Check the result with securityheaders.com (aim for an A) before launch.

## Forms and user input

- Validate on the server too, not only in the browser. Limit field lengths. Treat every input as
  untrusted.
- Spam protection on every public form: a honeypot field plus a time check at minimum; Cloudflare
  Turnstile or similar if spam gets through. No CAPTCHA that blocks real guests.
- Never put user input into email headers (header injection), raw HTML (`dangerouslySetInnerHTML`),
  or database queries without escaping and parameters.
- Rate-limit any API route that sends email or creates something.
- Don't collect what the booking doesn't need. Never collect passport numbers, ID scans or card
  numbers through a form or email.

## Payments

- Use Stripe Checkout or Payment Links (or the client's processor's hosted page). The site never sees
  or stores card data, which keeps it out of most PCI scope.
- Calculate amounts on the server from your own price data; never trust a price sent from the browser.
- Verify the Stripe signature on every webhook; make webhook handling idempotent.
- Test mode keys in previews, live keys only in production.

## Links, embeds and content

- `target="_blank"` links get `rel="noopener noreferrer"`.
- Embed only from trusted providers; sandbox iframes where possible.
- Any HTML from a CMS is sanitised before rendering.
- Uploads (if any): restricted types and sizes, stored outside the app, never executed.

## Dependencies

- Minimal dependencies; each one must earn its place. Commit the lockfile.
- `npm audit` before launch; no high/critical issues in production dependencies left unexplained.
- Keep Next.js and React on supported, patched versions; note in the handoff who updates them.

## Accounts and ownership (the client must not be locked out or hijacked)

- The **client** owns the domain, registrar account, Google Business Profile, Search Console,
  analytics and Stripe accounts; Leeward is added as a user, not the owner.
- Registrar: 2FA on, transfer lock on, auto-renew on, contact email that someone reads.
- 2FA on every account involved (GitHub, Vercel, registrar, email, CMS, Stripe).
- Domain email: SPF, DKIM and DMARC records set, so form notifications and the client's email don't
  land in spam and the domain can't easily be spoofed.
- Write down in the handoff where everything lives and who has access, with no passwords in the doc.

## Admin areas

- No `/admin`, CMS login or dashboard exposed without strong authentication (2FA). Prefer a hosted CMS
  with its own login over building one.
- Error pages and API responses never show stack traces, keys or internal paths in production.
