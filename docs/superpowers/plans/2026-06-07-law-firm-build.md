# Khoury Law Firm — Ultra-Premium Website Implementation Plan

> **For agentic workers:** Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Full rewrite of `index.html` as a single self-contained ultra-premium law firm website.

**Architecture:** Single HTML file with inline CSS (~600 lines) and inline JS (~400 lines). No build step. All sections, animations, and trilingual logic in one file.

**Tech Stack:** Vanilla HTML/CSS/JS, Google Fonts (Noto Serif Hebrew, Playfair Display, Heebo, Cairo), FormSubmit.co, Google Maps iframe.

---

### Task 1: CSS design system + HTML skeleton
**Files:** Modify `index.html`
- [x] Write CSS variables, reset, base typography, reveal animation class
- [x] Write full HTML skeleton with all section IDs as empty placeholders
- [x] Open in browser — verify blank dark page loads with no console errors
- [x] Commit: `feat: html skeleton + css design system`

### Task 2: Global UI — cursor, progress bar, header, hamburger
**Files:** Modify `index.html`
- [x] Add magnetic cursor (dot + ring, lerp, touch disable)
- [x] Add scroll progress bar (2px gold, fixed top)
- [x] Add language bar (עב/عر/EN buttons)
- [x] Add fixed header (logo seal, nav links, CTA button)
- [x] Add hamburger menu (full-screen overlay, X animation, focus trap)
- [x] Verify in browser: scroll shows gold bar, hamburger opens/closes
- [x] Commit: `feat: global ui — cursor, progress bar, header, hamburger`

### Task 3: Curtain intro animation
**Files:** Modify `index.html`
- [x] Add two curtain panels (fixed, z-index 9999, dark-gold gradient)
- [x] Add firm name text on each curtain panel
- [x] Add JS: 600ms pause → slide apart → fade out → display:none
- [x] Add sessionStorage gate (plays once per session)
- [x] Add skip button (appears after 800ms)
- [x] Add prefers-reduced-motion bypass
- [x] Verify in browser: curtain plays on first load, skipped on refresh
- [x] Commit: `feat: gold curtain intro animation`

### Task 4: Hero section + particle canvas
**Files:** Modify `index.html`
- [x] Add hero HTML: eyebrow → H1 (3 lines) → subtitle → CTA buttons → trust trio
- [x] Add `<canvas id="hero-canvas">` behind content
- [x] Add particle system JS: 80 particles, connecting lines, mouse repel
- [x] Add word-by-word H1 stagger reveal on load
- [x] Add animated scroll-down chevron
- [x] Verify: particles animate, mouse moves particles, headline staggers in
- [x] Commit: `feat: hero section + particle canvas`

### Task 5: Stats bar + About + Manifesto
**Files:** Modify `index.html`
- [x] Stats bar: 4-column dark band, odometer counters (IntersectionObserver + easeOutExpo)
- [x] About: cream bg, 2-col grid, quote card, value pills, slide-in reveal
- [x] Manifesto: full-width dark, 2nd particle canvas (40 particles), 3-language stagger
- [x] Verify: counters animate on scroll, about columns slide in, manifesto lines stagger
- [x] Commit: `feat: stats bar, about, manifesto sections`

### Task 6: Services section — 3D flip cards
**Files:** Modify `index.html`
- [x] Add 8 service cards in 4×2 grid on cream background
- [x] CSS: `transform-style:preserve-3d`, front + back faces
- [x] RTL-aware flip direction (`[dir=rtl] .service-card:hover { rotateY(-180deg) }`)
- [x] Back face: dark bg, large SVG icon, "לפרטים נוספים →" CTA
- [x] Verify: cards flip on hover, back face visible, RTL direction correct
- [x] Commit: `feat: services section with 3d flip cards`

### Task 7: Process + Partners sections
**Files:** Modify `index.html`
- [x] Process: 4 steps dark bg, SVG connector line, stroke-dashoffset draw animation
- [x] Step icons drop in with bounce on viewport entry
- [x] Partners: 2 large cards, `<img>` slots for rami-khoury.jpg / walid-khoury.jpg
- [x] Photo: grayscale(40%)→color on hover, scale(1.04), gold border
- [x] Contact buttons per card: phone + WhatsApp + email
- [x] Verify: connector draws in on scroll, photo color reveal works
- [x] Commit: `feat: process + partners sections`

### Task 8: Testimonials + Contact + Footer + WhatsApp
**Files:** Modify `index.html`
- [x] Testimonials: 5 cards, `scroll-snap-type:x mandatory`, arrow nav buttons, gold stars
- [x] Contact: floating label CSS (`:placeholder-shown` + `:focus` trick), form HTML
- [x] Google Maps iframe embed (Kafr Kanna 32.7228°N 35.3441°E), rounded corners
- [x] Footer: 3-col dark grid, logo, links, copyright
- [x] WhatsApp float: pulse ring, tooltip, `https://wa.me/9720522597010`
- [x] Verify: testimonials snap-scroll, labels float on focus, map loads, WA button pulses
- [x] Commit: `feat: testimonials, contact, footer, whatsapp`

### Task 9: Full translation system + form submission JS
**Files:** Modify `index.html`
- [x] Add complete `translations` object (he/ar/en) covering ALL sections including new ones
- [x] Add `setLang()`: updates all text IDs, dir attribute, lang attribute, active button
- [x] Add `placeholders` + `selectOptions` objects
- [x] Add `submitForm()`: fetch to FormSubmit.co, trilingual validation, success/error states
- [x] Add `DOMContentLoaded` to load saved language from localStorage
- [x] Verify: switching languages updates all text, form validates and submits
- [x] Commit: `feat: complete translation system + form submission`

### Task 10: Text scramble, mobile responsiveness + accessibility
**Files:** Modify `index.html`
- [x] Text scramble effect on all H2 section titles (IntersectionObserver, 0.8s)
- [x] All `@media` breakpoints: <768px single-col + hamburger, 768–1024px 2-col
- [x] Skip-to-content link, ARIA labels on icon buttons, aria-expanded on hamburger
- [x] focus-visible gold outline on all interactive elements
- [x] Verify on mobile viewport: hamburger works, all sections single-column
- [x] Commit: `feat: scramble effect, mobile responsive, accessibility`
