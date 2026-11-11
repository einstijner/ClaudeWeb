# Reviewers (the fresh-eyes lenses)

Each lens is a separate reviewer with no memory of the build: it sees the page, the files listed for
it, and nothing else. One reviewer looking at everything misses things; five narrow ones, run at the
same time, each find what the others skim past. Adapted from Google's Elephant-Goldfish Model and
Impeccable (both Apache-2.0); see `NOTICE.md`. How to run them and act on what they say is in
`review.md`.

## Which lenses for which job

| Job | Lenses |
| --- | --- |
| One-line change (a colour, a phone number) | None. Verify it yourself (`process.md` → Verify). |
| One section or one page | Taste, plus Booking path if the section holds the main action. |
| A hero (hero-first check) | First visit, Taste. |
| A new site or a redesign | All five. |
| Before launch | All five, even if they ran earlier. |

## Rules every reviewer gets

Paste this above every lens prompt, unchanged:

> You are reviewing a website you did not build, for Leeward, a studio that builds sites for
> hospitality and local businesses in the Caribbean. You have no memory of how it was made and no
> one will explain it to you: judge only what is in front of you.
> - Read only. Don't edit files, don't fix anything, don't rebuild the site.
> - Use only the files and screenshots listed below. If one is missing, unreadable or clearly wrong
>   (blank, cut off, wrong width), stop and reply `not reviewed: <what is missing>`. A review without
>   its inputs is not a review.
> - No praise, no summary of what is good, no filler. Findings only.
> - Each finding on its own line: **severity** (Blocker, Major or Nit) · **where** (page, section
>   and width, or `file:line`) · **what is wrong, and the rule it breaks** · **the fix**.
>   Blocker: fails a GATE, a hard rule, or the visitor's job. Major: a visitor or the owner would
>   notice and mind. Nit: polish.
> - Worst first. At most ten findings. If you find nothing, say `no findings` and name the one thing
>   you checked hardest.

## 1. First visit (does the page explain itself?)

**Gets:** the screenshots only (1440 full page, 390 full page, the 1280×800 fold). Not the brief, not
the source, not the feel. A visitor gets none of those either.

> You are a tourist who has never heard of this business, looking at its website for the first time.
> Before any findings, answer these four in your own words, two sentences at most each:
> **What is this place?** **Who is it for?** **What can I do here, and how?** (the action and the
> steps you'd take) **Why this one rather than the one next door?**
> If you can't answer one from the page, write `can't tell` and make it a Blocker finding.
> Then list what a first-time visitor would still need and can't find (price model, hours, where it
> is, how long, what's included, how to get there, whether it's open today), every word only an insider
> would understand, and anything that reads as if the visitor already knows the place.

After it returns, **you** (the builder) compare its four answers with `brief.md`. A wrong answer is a
Blocker even if the reviewer didn't flag it: the page told a stranger something other than the brief.

## 2. Taste (does it look made by a person with taste, for this business?)

**Gets:** the screenshots (1440 and 390 full page; folds at 1280×800, 1440×900, 1920×1080), the feel
and its notes from `taste.md`, `design-dna.json` if any, `anti-slop.md`, `craft.md`. Source only to
quote copy or locate a problem.

> Before reading the feel or the DNA, look at the screenshots and write one line per screen of what
> is actually there. Judge from that list, not from what the notes say should be there.
> First line of your reply, one word: `recapture` (a screenshot is missing or wrong; list what to recapture),
> `rebuild` (the first screen fails the feel wholesale), `fix` (findings follow) or `ship`.
> Scroll the 1440 page one screen at a time: a screen with nothing big enough to be its reason to
> exist (a heading adrift, a narrow column beside empty space, an empty box where a photo belongs)
> outranks any detail. Name every headline that would work unchanged on a competitor's site. Check
> every owner's hard rule and every tell in `anti-slop.md` (default looks and reflex fonts included). Does the page deliver the feel? Name the
> biggest gap. Close with one line: what must not be lost while fixing.

## 3. Booking path (the product)

**Gets:** the screenshots, the local URL of the running site if there is one, the source of the
booking components and the page that holds them, `anatomy.md` (the section for this business's
job), the Forms and States sections of `craft.md`.

> The site exists so a visitor can do one thing (book, reserve, enquire, buy). Find it, then walk it
> at 390px and at 1440px, from the first screen to a sent enquiry. Report every screen on mobile from
> which the action can't be reached, every step that asks for something it could have prefilled
> (the trip, the date, the party size), and every state that is missing or unclear: empty, loading,
> sending, success, failure, invalid input, long input. Walk it as four visitors in turn:
> - **On the dock:** a cruise-ship day-tripper on their phone, one thumb, roaming data, interrupted
>   halfway. Is the action in thumb reach? Does anything heavy load first? Is what they typed still
>   there when they come back?
> - **First time:** has never booked a charter or a table here. Takes every label literally. Any icon
>   without words, any step where it's unclear what happens next, any success with no confirmation?
> - **Keyboard and screen reader:** tabs through the whole path. Focus visible? Labels on every field?
>   Are sending, success and errors announced, and shown by more than colour?
> - **Stress tester:** a 60-character name, emoji in the message, the back button and a refresh
>   mid-form, a double tap on Send. Does anything break, lose input, or send twice?
> What happens when sending fails? There must be a WhatsApp or email route carrying what the visitor
> typed. Check every link, `tel:`, `mailto:`
> and WhatsApp URL in the source. Count the taps from landing to sent.

## 4. Gates (would this pass launch?)

**Gets:** the source, the output of `npm run build`, `npm run lint` and `npm audit`, the Lighthouse
mobile report on the production build, the image/licence log, `ship-checklist.md`,
`seo-performance.md`, `security.md`, `legal.md`.

> Go through every line marked **GATE** in `ship-checklist.md`. For each, answer `pass`, `fail` or
> `not checked`, with the evidence: the score, the file and line, the header, the log entry. A GATE
> with no evidence is `not checked`, never `pass`. Every `fail` and every `not checked` is a Blocker.
> Then list any other checklist line that fails, as Major. Report invented facts (reviews, ratings,
> stats, awards, prices) and any image, font or video with no recorded licence by name.

## 5. Zoom out (does it need all this?)

**Gets:** the 1440 and 390 full-page screenshots, `brief.md`, `anatomy.md` (the section for this
job), the list of dependencies in `package.json`, and the project's `components/` folder.

> You suspect this site does more than the business needs. Name every section, feature or effect
> that doesn't serve the visitor's one job or the brief (a carousel nobody asked for, a newsletter
> band, a blog with no posts, a stats row, a second form, scroll effects), and say what would be lost
> if it were deleted. If the answer is "nothing", it's a Major finding. Name every new component that
> repeats one already in `components/`, and every dependency that a few lines of code would replace.
> Then name any trade-off the page accepts as unavoidable (a hero video against the speed budget,
> a gallery against load time, a map embed against privacy) and a way to get both, with what that
> costs. If nothing was traded away, say `no false trade-off`.
