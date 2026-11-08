---
name: leeward-web
description: Leeward's playbook for building client websites (hospitality, charters, restaurants, beach bars, local Caribbean businesses). Use for ANY website, landing page, homepage, section, redesign or front-end build or review, even a single hero or footer. Sets the stack, design standards, banned "AI slop" patterns and the ship checklist.
---

# Leeward web build playbook

You are building for Leeward, a small studio that builds websites for hospitality and local businesses
in St. Maarten and the Caribbean. The bar is a site the client can show off: it looks
made by a person with taste for this specific business. If a section could be pasted onto any other
company's site unchanged, it is not done.

Read these before writing code:

1. `references/anti-slop.md`: what never ships. Read every time.
2. `references/stack.md`: the default stack and project structure.
3. `references/taste.md`: the visual standards and the reference sites, with reasons.
4. `references/ship-checklist.md`: run it before calling anything finished.
5. `references/feedback-log.md`: past corrections from the owner. These override everything else here.

## Workflow

1. **Understand the business first.** Who books, what they book, how they pay or enquire, what makes
   this place different from the one next door. If the brief doesn't say, ask; don't invent.
   Never make up prices, reviews, awards, guest counts, years in business or team names.
2. **Pick the feel.** Premium, playful, simple or in-depth (see `references/taste.md`). State which
   one and why in your first reply. The constants and hard rules apply whatever the feel.
3. **Content before layout.** Put the real facts (times, capacities, locations, contact, menu,
   inclusions) in typed data files in `lib/`, then render them. Copy is specific and short:
   "Anguilla and St. Barts are full-day only, 10am–5pm", never "Unforgettable experiences await".
4. **Tokens before components.** Set colour, type, spacing, radius and shadow as CSS custom properties
   from the brand (logo, photos, place) and the chosen feel, before building any section.
   Two typefaces at most, one accent colour.
5. **Photography leads.** Real client photos are the design. Crop deliberately (`object-position`
   per photo), size them correctly (`sizes`), write real alt text. Use stock only where the client
   has none, and credit it.
6. **The booking path is the product.** The main action (book, reserve, enquire, WhatsApp) is reachable
   from every screen on mobile, prefilled where possible, and has a fallback when the form fails.
7. **Build, then look at it.** Run the site and screenshot it at 390px and 1440px wide (Playwright is
   available). Fix what looks off before reporting. Don't describe a page you haven't looked at.
8. **Run the ship checklist.** Then report plainly: what's done, what's placeholder, what the client
   still has to supply.

## When the owner corrects something

Add the correction to `references/feedback-log.md` as a one-line rule with the reason, so it never
needs saying twice. If a rule elsewhere in this skill conflicts with it, update that rule too.
