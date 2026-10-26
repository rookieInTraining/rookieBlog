---
name: Ish's Blog
description: SchoolChalk on a pure-white whiteboard. Charcoal chalk ink, one pink stick, hand-lettered type, slate code boards.
colors:
  whiteboard: "#ffffff"
  ink-full: "rgba(42, 45, 43, 0.92)"
  ink-strong: "rgba(42, 45, 43, 0.78)"
  ink-subdued: "rgba(42, 45, 43, 0.66)"
  ink-faint: "rgba(42, 45, 43, 0.32)"
  ink-ghost: "rgba(42, 45, 43, 0.14)"
  ink-dust: "rgba(42, 45, 43, 0.06)"
  line-strong: "rgba(42, 45, 43, 0.42)"
  line-heavy: "rgba(42, 45, 43, 0.7)"
  focus-ring: "rgba(42, 45, 43, 0.5)"
  chalk-pink: "#b0566e"
  chalk-green: "#3f7a50"
  board-slate: "#1d211f"
  board-deep: "#141715"
  chalk-on-slate: "rgba(242, 240, 233, 0.92)"
  chalk-on-slate-subdued: "rgba(242, 240, 233, 0.55)"
  code-comment: "#9a9680"
  code-pink: "#ff4f8b"
typography:
  display:
    fontFamily: "'SC Display', 'Comic Sans MS', cursive"
    fontSize: "2.25rem"
    fontWeight: 700
    lineHeight: 1.25
  display-md:
    fontFamily: "'SC Display', 'Comic Sans MS', cursive"
    fontSize: "3rem"
    fontWeight: 700
    lineHeight: 1.25
  lead-title:
    fontFamily: "'SC Display', 'Comic Sans MS', cursive"
    fontSize: "clamp(2rem, 1.4rem + 1.8vw, 2.625rem)"
    fontWeight: 700
    lineHeight: 1.1
  headline:
    fontFamily: "'SC Display', 'Comic Sans MS', cursive"
    fontSize: "1.6em"
    fontWeight: 700
    lineHeight: 1.25
    letterSpacing: "0.01em"
  author-name:
    fontFamily: "'SC Display', 'Comic Sans MS', cursive"
    fontSize: "2rem"
    fontWeight: 700
    lineHeight: 1
  wordmark:
    fontFamily: "'SC Display', 'Comic Sans MS', cursive"
    fontSize: "1.5rem"
    fontWeight: 700
  title:
    fontFamily: "'Patrick Hand', 'Comic Sans MS', cursive"
    fontSize: "1.375rem"
    fontWeight: 400
    lineHeight: 1.25
  title-md:
    fontFamily: "'Patrick Hand', 'Comic Sans MS', cursive"
    fontSize: "1.5rem"
    fontWeight: 400
    lineHeight: 1.25
  subhead:
    fontFamily: "'Patrick Hand', 'Comic Sans MS', cursive"
    fontSize: "1.2em"
    fontWeight: 700
    lineHeight: 1.25
  body:
    fontFamily: "'Patrick Hand', 'Comic Sans MS', cursive"
    fontSize: "1.125rem"
    fontWeight: 400
    lineHeight: 1.55
    letterSpacing: "0.01em"
  body-prose:
    fontFamily: "'Patrick Hand', 'Comic Sans MS', cursive"
    fontSize: "1.25rem"
    fontWeight: 400
    lineHeight: 1.6
    letterSpacing: "0.01em"
  label:
    fontFamily: "'Schoolbell', 'Patrick Hand', cursive"
    fontSize: "0.875rem"
    fontWeight: 400
    letterSpacing: "0.1em"
  meta:
    fontFamily: "'Schoolbell', 'Patrick Hand', cursive"
    fontSize: "0.95rem"
    fontWeight: 400
  code:
    fontFamily: "'Cutive Mono', 'Courier New', monospace"
    fontSize: "0.875rem"
    fontWeight: 400
    lineHeight: 1.6
rounded:
  wobble: "255px 15px 225px 15px / 15px 225px 15px 255px"
  wobble-2: "15px 255px 15px 225px / 225px 15px 255px 15px"
  pill: "48% 52% 50% 50% / 55% 48% 52% 45%"
  photo-frame: "43% 57% 51% 49% / 58% 45% 55% 42%"
  nib: "6px 3px 7px 4px / 4px 7px 3px 6px"
spacing:
  line-thin: "1.5px"
  line-thick: "2.5px"
  gutter: "1.25rem"
  gutter-md: "2rem"
  header-height: "4rem"
  section: "2.5rem"
  stack-gap: "3.5rem"
  column-gap: "4.5rem"
  author-column: "17.5rem"
  sticky-top: "6rem"
  page-max: "72rem"
  measure: "66ch"
  touch-target: "2.75rem"
components:
  nav-link:
    textColor: "{colors.ink-subdued}"
    typography: "{typography.body}"
  nav-link-current:
    textColor: "{colors.ink-full}"
  wordmark:
    textColor: "{colors.ink-full}"
    typography: "{typography.wordmark}"
    height: "{spacing.touch-target}"
  wordmark-hover:
    textColor: "{colors.chalk-pink}"
  feed-title:
    textColor: "{colors.ink-full}"
    typography: "{typography.title}"
  feed-title-hover:
    textColor: "{colors.chalk-pink}"
  col-label:
    textColor: "{colors.ink-subdued}"
    typography: "{typography.label}"
  chalk-pill:
    textColor: "{colors.ink-subdued}"
    typography: "{typography.meta}"
    rounded: "{rounded.pill}"
    padding: "0.15rem 0.8rem"
    height: "2rem"
  chalk-pill-filled:
    backgroundColor: "{colors.ink-dust}"
    textColor: "{colors.ink-strong}"
    typography: "{typography.body}"
    rounded: "{rounded.pill}"
    padding: "0.15rem 0.8rem"
    height: "2rem"
  chalk-pill-hover:
    textColor: "{colors.chalk-pink}"
  code-board:
    backgroundColor: "{colors.board-slate}"
    textColor: "{colors.chalk-on-slate}"
    typography: "{typography.code}"
    rounded: "{rounded.wobble}"
    padding: "1.25rem 1.4rem"
  board-copy:
    textColor: "{colors.chalk-on-slate-subdued}"
    typography: "{typography.label}"
    rounded: "{rounded.wobble}"
    padding: "0.1rem 0.6rem"
  board-copy-hover:
    textColor: "{colors.chalk-on-slate}"
  prose-link:
    textColor: "{colors.ink-full}"
    typography: "{typography.body-prose}"
  prose-link-hover:
    textColor: "{colors.chalk-pink}"
  inline-code:
    backgroundColor: "{colors.ink-dust}"
    textColor: "{colors.ink-full}"
    rounded: "{rounded.nib}"
    padding: "0.1em 0.4em"
  author-now:
    backgroundColor: "{colors.ink-dust}"
    textColor: "{colors.ink-strong}"
    rounded: "{rounded.wobble-2}"
    padding: "0.9rem 1.1rem 1rem"
  author-photo:
    rounded: "{rounded.photo-frame}"
    size: "120px"
  author-photo-post:
    rounded: "{rounded.photo-frame}"
    size: "72px"
  toc-panel-mobile:
    rounded: "{rounded.wobble}"
    padding: "1.25rem"
  skip-link:
    backgroundColor: "{colors.whiteboard}"
    textColor: "{colors.ink-full}"
    typography: "{typography.meta}"
    rounded: "{rounded.wobble}"
    padding: "0.5rem 1rem"
---

# Design System: Ish's Blog

## Overview

**Creative North Star: "The Whiteboard Lesson"**

A single practitioner chalking a lesson on a clean whiteboard. The page is pure white (a binding owner constraint, not a preference), and everything on it is drawn in charcoal chalk whose darkness is chosen by *pressure*: a short ladder of one charcoal colour at fixed opacities, never a run of unrelated greys. One pigment stick, pink, carries every accent. Type is hand-lettered in four hands (display lettering, a print hand for reading, a schoolroom note hand for annotations, a typewriter for code). Code is the one dark surface: small slate blackboards hung on the white board.

Density is a reading density: one main column of writing at a 66-character measure, with the author's column beside it from 1024px so the writing always leads and the person who wrote it is always present. Ornament is limited to what chalk physically does: rough strokes, wobbly hand-drawn corners, a faint dust halo on big lettering, and a grain mask on page titles. Motion has exactly one material, the chalk stroke being drawn left to right.

The system is built under a hard performance budget. Fonts are self-hosted core subsets, textures are small inlined data URIs, and the only first-party behaviour script stays within about 3KB gzipped. No 3D, no dark mode, no blurred drop shadows.

**Key Characteristics:**
- Pure white board, charcoal ink at six pressure steps, pink as the one accent.
- Four hand-lettered faces, self-hosted, each with a fixed job.
- Wobble radii and rough chalk strokes in place of perfect geometry and ruled lines.
- Slate code boards as the only dark surface.
- One motion material: a chalk stroke drawn left to right via clip-path.
- Writing leads in the main column; the author column sits beside it.

## Colors

One charcoal chalk at pressure steps on pure white, one pink stick for accent, and a slate board for code.

### Primary
- **Rose Chalk** (chalk-pink): the one accent. Hover colour for titles, the wordmark and prose links; the "keep reading" link; the current series part number; the reading-progress stroke along the header; pill hover; text selection (at 22% alpha) and the blockquote rule (at 55% alpha). It measures about 4.8:1 on white, so it may set text.

### Secondary
- **Slate Blackboard** (board-slate) with **Board Shadow** (board-deep): the code board surface and its 1.5px edge. The Chroma `monokai` palette is recompiled for this board in `baseof.html`: the board background becomes slate, comments are lifted to **Worn Chalk Comment** (code-comment, about 5.5:1 on slate) and the keyword pink to **Bright Board Pink** (code-pink, about 5.2:1). Text on the board is **Chalk on Slate** (chalk-on-slate) and its annotations **Faded Chalk on Slate** (chalk-on-slate-subdued).

### Tertiary
- **Leaf Chalk** (chalk-green): used only for the end-of-post tick. It is a status mark, not a second accent.

### Neutral
- **Whiteboard** (whiteboard): the page, the sticky header, the open phone menu. Always pure white.
- **Pressed-hard ink** (ink-full): headings, titles, strong text, wordmark, current nav item, links at rest.
- **Normal-stroke ink** (ink-strong): body copy and the filled pill's text.
- **Light-stroke ink** (ink-subdued): meta lines, labels, descriptions, nav at rest, footer. The lightest step that may set text (about 4.7–4.8:1 on white).
- **Half-erased ink** (ink-faint): banner and mobile Contents frames. Lines only.
- **Eraser smudge** (ink-ghost): hairlines between feed entries, header and footer rules, column dividers, table rows.
- **Chalk dust film** (ink-dust): fills for the filled pill, the Now note, inline code and table headers.
- **Strong line** (line-strong) and **Heavy line** (line-heavy): ruled section labels, table header rules and image frames (strong); the author photo's 3px frame (heavy).

### Named Rules
**The Pressure Not Grey Rule.** Every neutral is the same charcoal (42, 45, 43) at a pressure step. Pick a step; never introduce a new grey hex.

**The Lightest Text Rule.** ink-subdued (alpha 0.66) is the lightest text step. ink-faint and ink-ghost are for lines and borders only, never text, at any size.

**The One Stick Rule.** Pink is the only accent. Green appears only as the end-of-post tick. The other pigment sticks defined in the token files are unused; don't bring them in without a reason the system records.

**The Pure White Rule.** The board is #ffffff. No tinted page, no section bands, no dark mode.

## Typography

**Display Font:** SC Display (a renamed Cabin Sketch Bold subset, OFL), with Comic Sans MS, cursive
**Body Font:** Patrick Hand, with Comic Sans MS, cursive
**Label Font:** Schoolbell, with Patrick Hand, cursive
**Mono Font:** Cutive Mono, with Courier New, monospace

**Character:** Sketchy display lettering for anything large, a friendly print hand for reading, a looser schoolroom hand for annotations, and a typewriter for code. All four are self-hosted as a small core subset plus the full latin file that loads only when a page needs a character outside the core. Only the body core face is preloaded, so the display face never competes with the banner for LCP.

### Hierarchy
- **Display** (700, 2.25rem; 3rem from 768px; line-height 1.25 on posts): page titles on every page type, with the dust halo and the grain mask.
- **Lead title** (700, clamp(2rem, 1.4rem + 1.8vw, 2.625rem), 1.1): the newest post opening the home feed, with the dust halo.
- **Headline** (700, 1.6em, 1.25): article H1/H2 in the display face, with the dust halo but no grain. Also the author name (2rem, 1.625rem on posts and in the phone strip) and the large year and series numbers (2rem, light-stroke ink).
- **Title** (400, 1.375rem; 1.5rem from 768px; 1.25): feed entry titles in the body hand. Journal entries switch the title to the note hand so personal notes read differently from essays.
- **Subhead** (700, 1.2em / 1.1em): article H3/H4 in the body hand pressed hard; the display face muddies when small.
- **Body** (400, 1.125rem, 1.55, +0.01em): UI copy. Article prose steps up to **1.25rem from 768px** (line-height 1.6), because Patrick Hand has a small x-height. Prose text blocks are capped at **66ch**; code boards, tables and images keep the full column.
- **Label** (400, 0.875rem, +0.1em, uppercase, Schoolbell): block names such as "Latest writing" and "Contents". The ruled variant carries a 2.5px strong-line rule underneath so it heads a block. Table headers and code-board annotations use the same uppercase note voice at smaller sizes.
- **Meta** (400, 0.95rem, Schoolbell): dates, topic, reading time, series line, captions, blockquotes.
- **Code** (400, 0.875rem, 1.6, Cutive Mono): code boards; inline code at 0.85em.

### Named Rules
**The Grain On Titles Rule.** The chalk grain mask goes on page titles (and the wordmark) only. Inside an article, H2s keep the dust halo but no grain, because grain made them paler than the text they introduce.

**The Four Hands Rule.** Each face has one job: display for big lettering, print hand for reading, note hand for annotations and meta, typewriter for code. No system or sans fallback is designed for.

## Layout

The writing leads; the author stays beside it.

- **Page frame:** max width 72rem, centred; side gutters 1.25rem on phones and 2rem from 768px; vertical padding 3rem/4rem (5rem bottom from 768px). The sticky header is 4rem tall, white, ruled underneath with eraser-smudge ink.
- **Author column (from 1024px):** two-column grid, main column `minmax(0, 1fr)` and a 17.5rem author column, 4.5rem column gap. The column is sticky at 6rem from the top, scrolls on its own if taller than the screen, and is divided from the writing by a 1px ghost rule with 2rem of inner padding. At 1440px this gives a main column of roughly 736px.
- **Below 1024px:** one column. On home, the author's identity becomes a strip (64px photo, name, roles) above the writing; the column's topics and links follow the feed, ruled off with a ghost line and 2.5rem of padding. Posts show a small byline (32px photo) in the meta line instead.
- **Post page:** one grid. Phones: header, banner, Contents (in a wobble frame), article. From 1024px the side column holds the post-size author card (72px photo) with the Contents beneath it, sticky and scroll-spied.
- **Feeds:** reverse chronological, entries separated by ghost hairlines with 1.25rem of padding; the newest post on home is the lead entry (display title, first lines, keep reading). The blog index groups by year with the year chalked large. Series pages number each part in the margin.
- **Exceptions:** the About page drops the column (it is the column's long version, with a 160px photo leading). Tag and category indexes and the 404 page are single-column.
- **Touch:** on coarse pointers every standalone control gets a 44px target (pills, nav rows, Contents rows, topic doors, author links, series parts, code-board copy). Links inside sentences stay inline.
- **Breakpoints:** 768px (type and gutter step up, nav goes horizontal) and 1024px (author column).

### Named Rules
**The Writing Leads Rule.** The feed or article is always the main column and comes first in source order; the author column supports it, never precedes it.

**The 66ch Rule.** Prose text never runs wider than 66ch.

## Elevation & Depth

The board is flat. Depth comes from chalk, not light: a hard, offset "lift" (an unblurred double-stroke) where something is physically hung on the board, and a faint dust halo around big lettering. There are no blurred drop shadows, no backdrop blur, no 3D and no elevation on hover.

### Shadow Vocabulary
- **Lift S** (lift-s, 2px offset, no blur): the focused skip link pinned to the corner.
- **Lift M** (lift-m, 3px offset, no blur): code boards.
- **Dust halo** (text-shadow, 1px tight plus 6px wide charcoal at 0.3 and 0.1): display lettering (page titles, lead title, article H1/H2, author name, wordmark). It is chalk dust around a stroke, not a shadow.

### Named Rules
**The Hung Board Rule.** Only an object hung on the board (a code board, a pinned note) gets a lift, and the lift is always a hard offset, never a blur.

## Shapes

Nothing is geometrically perfect. Frames use asymmetric elliptical radii that read as hand-drawn: **wobble** (code boards, the copy control, the skip link, the phone Contents frame) and its mirror **wobble-2** (banners, prose images, the Now note). Pills use the **pill** lozenge, slightly off-round. The author photo uses its own **photo-frame** radius, because the pill reads as a plain circle at that size, inside a 3px heavy-line border tilted -2deg; the author name tilts with it. Inline code and concept tags use the tiny **nib** radius.

Lines are chalk weights, thicker than ink: 1.5px thin and 2.5px thick. Where a ruled line would be, the system uses the rough chalk underline stroke instead: prose links, horizontal rules (repeated at 60% opacity), the drawn hover/current stroke, and the reading-progress line. Hairline dividers between list items stay as 1px ghost rules.

## Components

### Navigation
Quiet, hand-written and drawn on. The wordmark is display lettering in pressed-hard ink with halo and grain, a 44px tall target, pink on hover. Nav items are body hand at 1rem in light-stroke ink; hover and the current page go to pressed-hard ink and draw the chalk stroke beneath the word. On phones a CSS-only checkbox opens a white panel of padded tap rows (works without JS); the menu icon is three hand-drawn strokes. On posts, a pink chalk stroke along the bottom of the header is drawn by scroll position (scroll-driven animation only; hidden where unsupported).

### Chips (Pills)
- **Style:** topics are filled (dust fill, normal-stroke ink, body hand); tags are outline only (1.5px ghost border, light-stroke ink, note hand, "#" prefix). Both use the pill radius and a 2rem minimum height, 2.75rem on coarse pointers.
- **State:** hover turns text pink and the border pink at 45%.

### Feed entries
A meta line (note hand, light-stroke ink: date, topic, reading time on the lead), a title (pressed-hard ink, pink on hover, 0.2s colour ease), and a description capped at 62ch. The lead adds its opening lines (1.1875rem, 60ch) and a pink "keep reading →" link that draws its stroke.

### Author column
Photo in the chalk frame, name in display lettering, roles in light-stroke ink, then the dated **Now** note on a dust panel (shown only when set and under 90 days old at build time), "What I write about" as topic doors with counts on ghost-ruled rows, a "New here?" line with chalk-underlined links, and follow links (RSS, LinkedIn, GitHub, Contact) in the note hand that draw their stroke.

### Code boards (signature)
A slate blackboard: board-slate fill, 1.5px board-deep edge, wobble radius, Lift M, Cutive Mono at 0.875rem, horizontal scroll inside the board. The language is annotated uppercase in the top-right corner in faded chalk. A **Copy** control sits on the board's wrapper (so it stays put while wide code scrolls): note hand, uppercase, faded chalk with a faint chalk border; hover and focus brighten it, and success draws a small chalk tick before "Copied". Inline code is typewriter on a dust smudge with a ghost border and nib radius.

### Prose
Links wear a rough chalk underline in pressed-hard ink and turn pink on hover. Blockquotes are margin notes: note hand, light-stroke ink, a 2.5px pink rule at 55%. Images sit in a wobble-2 frame with a 1.5px strong-line border. Tables scroll inside their own strip with a dust fade at the edge while more remains; headers are uppercase note hand on a dust fill over a 2.5px strong rule. Heading jumps land 5.5rem below the top to clear the sticky header.

### Contents and series
Contents entries are light-stroke ink that go to pressed-hard ink and draw their stroke on hover, focus and when scroll-spied as the current section. The series block lists parts in order with display-face numbers, the current part in pressed-hard ink with its number in pink, then a "Next part →" link. The post ends with a green chalk tick ("lesson complete") drawn once the reader reaches it, then series, related posts, previous/next and a follow line.

### Motion
One material: the rough chalk stroke, revealed left to right with `clip-path` (never stretched, so the wobble keeps its shape). It marks hover/focus, the current nav item, the current Contents entry, the reading-progress line, the copy tick and the end-of-post tick. Entrances take 0.45s on a quick-out ease; exits are quicker (0.18s ease-in). Content never waits on motion. Under `prefers-reduced-motion`, strokes appear at once (the state still shows), the end tick is left drawn, and in-page jumps don't glide; the progress line stays because it moves only with the reader's scroll.

### Long posts
Article blocks from the eighth onward use `content-visibility: auto` so phones paint the banner and opening first. chalk.js renders the whole article before any in-page jump, on arrival with a hash, on Back/Forward, and once the page is idle, so anchor jumps land in the right place.

## Do's and Don'ts

### Do:
- **Do** pick a neutral by pressure step (full, strong, subdued, faint, ghost, dust) of the one charcoal; never add a grey hex.
- **Do** keep text at ink-subdued (alpha 0.66) or darker; use ink-faint and ink-ghost for lines and borders only.
- **Do** use chalk-pink as the only accent, for hover, current and "go here" states.
- **Do** set prose at 20px from 768px and 18px below, with text blocks capped at 66ch.
- **Do** put the grain mask on page titles only; article H2s get the dust halo without grain.
- **Do** express motion as the chalk stroke drawn left to right via clip-path, and show it instantly under reduced motion.
- **Do** give every standalone control a 44px target on coarse pointers.
- **Do** hang code on slate boards (#1d211f) with the lifted monokai (comments #9a9680, pink #ff4f8b).
- **Do** keep the writing in the main column with the author column beside it.
- **Do** keep first-party JS within about 3KB gzipped and measure throttled-mobile LCP before and after any change.

### Don't:
- **Don't** set any text in ink-faint or ink-ghost.
- **Don't** use blurred drop shadows, backdrop blur, glows or elevation on hover; depth is a hard offset lift only on hung objects.
- **Don't** add a dark mode, a tinted page background or any 3D.
- **Don't** use perfect radii or perfect circles for frames; use the wobble, pill or photo-frame radii.
- **Don't** add a second motion material (fades, slides, scale or bounce), or make content wait on animation.
- **Don't** put the grain mask on in-article headings.
- **Don't** introduce a second accent colour; green is reserved for the end-of-post tick.
- **Don't** change prose link colour at rest; links are marked by the chalk underline.

## Open items

- **Signature:** a real signature asset (SVG or scan) from Ish is not yet supplied; until then the name is set in the display face.
- **Now note:** `params.now` text and date are empty, so the note is hidden. When set, it auto-hides 90 days after its date at build time.
