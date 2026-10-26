---
version: 1
slug: "layouts-partials-home-html"
primary_target: "layouts/partials/home.html"
related_targets: ["layouts/posts/single.html","layouts/posts/list.html"]
---

## Scope and mode

Blog-wide restructure inside the established SchoolChalk world: home, post, blog index, series pages
(new), journal entries in feeds, About, Contact; tag/category pages and 404 inherit. Visitor mode:
Read on every page. Code-led (read mode).

## Audience, job, constraints

QA leaders first; practitioners from search and people who know Ish also served. It must stay a
blog: the reverse-chronological feed is the spine of every list page. Performance first (throttled
mobile LCP measured before/after), JS ≤3KB, WCAG 2.2 AA, RSS / llms.txt / llms-full.txt / index.md
outputs keep working, the anchor-jump fix stays.

## Direction contract

THESIS: A blog visibly written by one person: the writing leads in the main column and Ish stays
present beside it on every page. Refuses the centred avatar-over-list template and any funnel that
puts curation ahead of the writing.

OWN-WORLD: SchoolChalk on pure white: charcoal ink pressure steps, SC Display chalk lettering with
grain only on page titles, Patrick Hand body, Schoolbell annotations, rough chalk strokes drawn left
to right, wobble-radius frames, slate code boards; pink chalk for the one accent.

STORY: The reader sees the newest writing first, understands within one glance who writes it (photo,
name, roles, a dated Now note in his words), finds topics and a quiet "new here?" path in the same
column, reads, and ends each post with a next step (series part, related post, RSS/LinkedIn).

FIRST VIEWPORT: Home at 1440: header; two columns (writing ~720px, author column ~280px, gap ~64px).
Main: "Latest writing" label, newest post large (display title ~40px, meta line, first lines, keep
reading), then 3+ dated entries. Column: photo in chalk frame (~120px), name in chalk script, roles,
Now note (only when set and <90 days old), What I write about (3 topic doors with counts), New here?
line, links (RSS, LinkedIn, GitHub, Topmate). Primary action: the newest post's title.

FORM: Author column, position 4 of 7 on the third ranked list (user-locked from the dealt hand).
seed:6aea07763fff42d1

FINISH: unreviewed and undocumented is unfinished; this build ends with the finish review, the verdict, DESIGN.md, and every shipping raster carrying its provenance

## Unresolved

- Real signature (SVG/scan) from Ish; until then the name is set in the chalk display face.
- Now note text + date from Ish (config `params.now`); hidden until provided.
- Optional series intros.
