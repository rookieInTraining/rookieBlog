# Product

<!-- impeccable:product-schema 1 -->

## Platform

web

## Users

- **Primary: QA leaders and managers.** People responsible for quality across teams, looking for
  metrics, accessibility scoring, quality culture and how to run testing as a discipline. They read
  to borrow a framework or a way of thinking they can take back to their organisation.
- **Also served (confirmed by the content, not the primary design target):** QA engineers and SDETs
  who arrive from search on a specific technical problem (GraphQL APQ interception, Selenium
  internals, Gradle reporting), and people who know Ish (LinkedIn, Topmate, colleagues) reading to
  understand his thinking.

## Product Purpose

Ish Abbi's personal blog (ishabbi.tech): a place to give back to the testing community by sharing
lessons from 12+ years in software quality, now as a Director of Quality Assurance and Automation.

A visit succeeds when any of these happen (all confirmed as goals):
- the reader **solves their problem** or takes away a usable idea, even in a single page;
- the reader **reads another post** (a related post or the rest of a series);
- the reader **comes back later** (RSS, following, remembering the blog);
- the reader **connects with Ish** (LinkedIn, email, Topmate session).

Context: bounce rate has been around 90%, so the second and third outcomes are under-served today.

## Positioning

Written by a practitioner who has done the hands-on automation work and now leads QA
organisations, so the same author covers both the mechanics (how WebDriver or APQ actually work)
and the management layer (leading and lagging quality metrics, scoring accessibility for
stakeholders). The "rookie in training" stance (see `content/posts/the-problem-with-my-username.md`)
frames every post as learning in public: no matter the seniority, there is always a new area that
makes you a rookie again.

## Operating Context

- Readers arrive mostly one post at a time, from search and from Ish's social profiles.
- Content is long-form. Planned for the next year: **technical deep-dives, journal entries, and
  leadership essays.** Short notes/TILs are explicitly not planned.
- Existing structure: posts grouped by categories, tags and `series` (multi-part posts such as the
  two-part GraphQL APQ guide); a separate "Journal Page" category for personal entries.
- Engagement is measured in GA4 (content groups, scroll depth, read_complete, internal and
  outbound clicks) and Microsoft Clarity.

## Capabilities and Constraints

- **It must remain a blog at its core.** Posts, chronology, reading and writing come first; any
  redesign organises and presents posts rather than turning the site into something else.
- Static site built with Hugo (0.168), deployed via GitHub Actions to GitHub Pages
  (`rookieintraining.github.io`, custom domain ishabbi.tech).
- **Performance is the key enabler** for every design decision (confirmed by the owner): measure
  throttled mobile LCP before and after; small JS budget; no heavy client-side frameworks.
- Machine-readable outputs exist and must keep working: RSS, sitemap, `llms.txt`, `llms-full.txt`,
  and a Markdown copy (`index.md`) of every page.
- Undecided: posting cadence; whether a newsletter or email subscription is wanted.

## Brand Commitments

- Name: "Ish's Blog", author Ish Abbi; handle **rookieInTraining** (GitHub, Stack Overflow, site).
- Footer line in use: "The scariest paths often lead to the most exciting places."
- Binding visual constraints set by the owner in earlier work: the page background stays pure
  white; the SchoolChalk design system is the chosen visual identity; no 3D or heavy animation.
- Voice: first person, warm and conversational, practitioner-to-practitioner (see About page).

## Evidence on Hand

- 7 published posts in `content/posts/` (6 technical across 3 series/categories, 1 journal entry),
  plus About (`content/aboutme.md`) and Contact (`content/contactme.md`, email + Topmate embed).
- Author avatar (`assets/images/820535.png`) and per-post banner images in `static/images/`.
- Social profiles: GitHub, X, LinkedIn, Medium, Stack Overflow (config.toml `params.social`).
- **Absent, and must not be fabricated:** testimonials, reader or subscriber counts, client logos,
  speaking or press mentions, newsletter, comment threads.

## Product Principles

1. **A blog first.** Every page exists to get a post read, or the next post found.
2. **Leaders are the main audience; practitioners are always welcome.** Lead with ideas and
   frameworks a QA leader can take away, and keep the deep technical detail one step away rather
   than hidden.
3. **Learning in public.** The "rookie in training" stance is the voice: honest, curious, never
   guru-like.
4. **Fast before fancy.** No feature ships if it slows the first read on a phone.
5. **Every visit has a next step.** Another post, a series, a way to come back, or a way to reach
   Ish, without nagging.

## Accessibility & Inclusion

Working target is WCAG 2.2 AA (contrast, keyboard access, 44px touch targets, reduced motion), the
level the site was brought to in the October 2026 audit work. Inferred from that work rather than
stated by the owner as a formal requirement.
