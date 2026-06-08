# Khoury Law Firm — Ultra-Premium Website Redesign
**Date:** 2026-06-07  
**File:** `index.html` (full rewrite, single self-contained file)  
**Backup:** `uiux.html` (preserved as-is)

---

## 1. Project Summary

Complete rewrite of `index.html` from scratch delivering an ultra-premium, cinematic law firm website. The existing translation system (Hebrew/Arabic/English), FormSubmit.co contact form, and WhatsApp float logic are all preserved and integrated into the new design.

**Tone:** Think Skadden, Linklaters, White & Case — maximum prestige and gravitas. Not a regional boutique site — a world-class legal brand.

---

## 2. Design System

### Color Palette
| Token | Hex | Use |
|---|---|---|
| `--black` | `#050508` | Primary background |
| `--black2` | `#080810` | Header / footer |
| `--black3` | `#0a0a14` | Section backgrounds |
| `--gold` | `#c9a227` | Primary accent |
| `--gold2` | `#d4a843` | Hover / highlight |
| `--gold-pale` | `rgba(201,162,39,.08)` | Subtle fills |
| `--gold-border` | `rgba(201,162,39,.15)` | Hairline borders |
| `--cream` | `#f5f0e8` | Light section base |
| `--cream2` | `#f0ebe0` | Light section alt |
| `--ink` | `#1a1a2e` | Dark text on light |
| `--slate` | `#5a6272` | Body text on light |
| `--white` | `#ffffff` | Pure white |

### Typography
| Language | Heading Font | Body Font |
|---|---|---|
| Hebrew (עב) | Noto Serif Hebrew 700 | Heebo 300/400/500 |
| Arabic (عر) | Cairo 700 | Cairo 300/400/600 |
| English (EN) | Playfair Display 700 | Heebo 300/400/500 |

**Google Fonts import:**
```
Playfair+Display:wght@400;500;700
Noto+Serif+Hebrew:wght@300;400;600;700
Heebo:wght@300;400;500;600
Cairo:wght@300;400;600;700
```

### Spacing & Shape
- Base radius: `12px` (cards), `20px` (large cards), `50px` (pills)
- Section padding: `7rem 5rem` desktop, `4rem 1.5rem` mobile
- Max content width: `1280px`, centered

---

## 3. Global Elements

### Fixed Header Stack (top of every page)
1. **Language bar** — 42px tall, `--black2` bg, `backdrop-filter:blur(16px)`. Buttons: עב / عر / EN. Active button has gold border + gold text.
2. **Main header** — 70px tall, same blur background. Logo left (seal + firm name), nav center, CTA button right. On scroll: adds `box-shadow`. On mobile: nav collapses to hamburger.

### Magnetic Cursor
Custom cursor: 12px gold dot + 40px hollow ring that lags behind with spring physics (`lerp` at 0.12). Ring expands on hover over interactive elements. Disabled on touch devices.

### Scroll Progress Bar
2px gold line at very top of viewport, `position:fixed`, grows from 0% to 100% width as user scrolls.

### Floating WhatsApp Button
Bottom-right fixed. Gold pulse ring animation (`waglow`). Tooltip "סיוע דחוף — זמין" on hover. Links to `https://wa.me/9720522597010`.

### Mobile Hamburger Menu
Appears below 768px. Three-line icon animates to X on open. Full-screen overlay menu, dark background, nav links stacked, large touch targets (min 48px).

---

## 4. Intro Animation (plays once per session)

**Type:** Gold curtains parting — `sessionStorage` gate so it only plays on first visit per session.

**Sequence:**
1. Screen starts fully covered by two dark-gold curtains (left + right halves).
2. Firm name "חורי ושות׳ — עורכי דין" is typeset in Noto Serif Hebrew on the left curtain; "Khoury & Co. — Law Firm" on the right curtain. Both in muted gold.
3. After 600ms pause, curtains slide outward simultaneously (`translateX(-100%)` left, `translateX(100%)` right) over 1.8s with `cubic-bezier(0.4, 0, 0.2, 1)`.
4. Behind the curtains: the hero section is already rendered and visible — particles already animating.
5. Curtain overlay fades out completely (`opacity:0`) at end, then `display:none`.
6. Total duration: ~2.4s. Skip button ("דלג / Skip") appears after 800ms.

---

## 5. Page Sections

### ① Hero
- **Layout:** Full viewport height (`100vh`), centered content, dark background.
- **Background:** `<canvas>` with 80 gold particles. Each particle: radius 1–2.5px, random velocity ±0.4. Particles within 100px draw connecting lines (opacity proportional to distance). Canvas reacts to mouse position — particles in 150px radius are gently pushed away.
- **Content:** Language eyebrow tag → H1 headline (3 lines, `clamp(2.6rem,5vw,4.2rem)`) → subtitle → CTA buttons (primary + WhatsApp) → trust trio (years / cases / partners).
- **Scroll indicator:** Animated chevron-down at bottom center, fades out after first scroll.
- **Reveal:** H1 words animate in one by one (`translateY(30px)→0`, staggered 120ms).

### ② Stats Bar
- **Layout:** Full-width dark band, 4 columns separated by 1px gold hairlines.
- **Content:** 4 stats — `20+` שנות ניסיון / `500+` תיקים / `8` תחומים / `2` שותפים.
- **Animation:** Numbers count up with odometer effect when bar enters viewport (`IntersectionObserver`). Duration: 2s, easing: `easeOutExpo`.

### ③ About
- **Layout:** Cream background (`--cream`). Two-column grid: left = text, right = quote card.
- **Left:** Section eyebrow → H2 title → body paragraph → value pills (5 pills: שירות אישי / ניסיון מוכח / זמינות 24/7 / שיקול דעת / תמחור הוגן).
- **Right:** Dark card (`--ink` bg, gold border) containing the firm motto as a `<blockquote>` in Noto Serif Hebrew italic, attributed to both partners.
- **Reveal:** Both columns slide in from opposite sides on scroll (`translateX ±60px → 0`).

### ④ Manifesto
- **Layout:** Full-width, full-height section. Background `--black` with gold particle canvas (same as hero but slower, 40 particles, opacity 0.5).
- **Content:** Small eyebrow label "THE KHOURY PROMISE" → the firm motto displayed 3 times, once per language, stacked vertically:
  - Hebrew: full opacity, Noto Serif Hebrew
  - Arabic: 60% opacity, Cairo
  - English: 30% opacity, Playfair Display italic
- **Animation:** Lines animate in sequentially with 400ms stagger, `translateY(40px)→0`.

### ⑤ Services
- **Layout:** Cream background. Intro row (eyebrow + title left, CTA link right) → 4×2 grid of cards.
- **Cards:** White background, gold-border on hover, `translateY(-6px)` lift. Each card has: icon (SVG, gold stroke), H3 title (Noto Serif Hebrew), body text.
- **Flip animation:** On hover, card does a 3D Y-axis flip (`rotateY(180deg)`). Back face: dark background (`--ink`), gold icon large, "לפרטים נוספים →" CTA. In RTL layouts the flip direction reverses (`rotateY(-180deg)`) so the card folds the natural reading direction.
- **8 services:** נדל"ן / ירושה / תעופה / בנקאות / הוצאה לפועל / חדלות פירעון / תרגום / עסקי.

### ⑥ Process — How We Work
- **Layout:** Dark background (`--black3`). Centered content. Eyebrow → title → 4-step horizontal row (desktop) / vertical stack (mobile).
- **Steps:** `01 ייעוץ` → `02 אסטרטגיה` → `03 לחימה` → `04 ניצחון`. Each step: circle number, title, 2-line description.
- **Connector animation:** Gold SVG line between circles draws in left-to-right when section enters viewport (`stroke-dashoffset` animation, 600ms per segment).
- **Step icons:** Each step has a small SVG icon that drops in with a bounce (`translateY(-20px)→0`, spring easing).

### ⑦ Partners
- **Layout:** Dark background (`--black`). Eyebrow → title → subtitle → 2-column grid of large cards.
- **Cards:** Each card: full-height photo (aspect-ratio 3/4), dark gradient overlay at bottom, partner name + role + specialty tags + bio + contact buttons.
- **Photo treatment:** Default `filter: grayscale(40%) brightness(0.85)`. On card hover: `grayscale(0%) brightness(1)` + `scale(1.04)`, transition 0.5s. Card border animates to gold.
- **Contact buttons per card:** Phone (Rami: 052-259-7010, Walid: 052-489-1619) + WhatsApp + Email.
- **Photo slots:** `<img src="rami-khoury.jpg">` and `<img src="walid-khoury.jpg">` — user provides files.

### ⑧ Testimonials
- **Layout:** Dark background (`--black3`). Eyebrow → title → horizontally scrollable card row.
- **Cards:** 5 testimonials. Each card: gold `★★★★★` stars → quote text (Noto Serif Hebrew italic) → client name + case type. Card: dark glass bg, gold hairline border, `min-width:320px`.
- **Scroll behavior:** CSS `scroll-snap-type:x mandatory` on container, `scroll-snap-align:start` on cards. Arrow nav buttons (◀ ▶) for accessibility.
- **Content:** 5 placeholder testimonials in Hebrew (2), Arabic (2), English (1) — replace with real quotes.

### ⑨ Contact
- **Layout:** Cream background. Two-column: left = form, right = info + map.
- **Form fields:** Name / Phone / Email / Practice Area (select) / Description. **Floating label** pattern: label starts as placeholder, floats above on focus/fill. Gold underline animation on focus.
- **Submission:** `fetch` to `https://formsubmit.co/ajax/saed.l.messi@outlook.com`. Success state replaces form. All validation messages trilingual.
- **Right column:** 3 contact detail rows (phone Rami, phone Walid, email) → Google Maps `<iframe>` embed for כפר כנא (32.7228°N, 35.3441°E), height 280px, rounded corners.

### ⑩ Footer
- **Layout:** Dark background (`--black2`). 3-column grid: logo + tagline | services links | contact info. Bottom bar: copyright + privacy + terms.
- **Style:** Gold hairline top border. Logo seal glows subtly on hover.

---

## 6. Animation Inventory

| Animation | Trigger | Duration |
|---|---|---|
| Gold curtains intro | Page load (once/session) | 2.4s |
| Gold particle field | Continuous (hero + manifesto) | ∞ |
| Magnetic cursor | Mouse move | Real-time |
| Scroll progress bar | Scroll | Real-time |
| Text scramble on H2s | Section enters viewport | 0.8s |
| Stagger word reveal (hero H1) | Page load | 0.6s |
| Stats odometer | Stats bar enters viewport | 2.0s |
| About columns slide-in | Section enters viewport | 0.7s |
| Manifesto lines stagger | Section enters viewport | 1.2s |
| Service card 3D flip | Hover | 0.5s |
| Process connector draw | Section enters viewport | 2.4s |
| Partner photo desaturate→color | Card hover | 0.5s |
| Testimonial snap-scroll | Drag / arrow click | Native |
| Contact field float label | Focus / fill | 0.25s |
| Button gold ink ripple | Click | 0.6s |
| WhatsApp pulse ring | Continuous | 3s loop |
| Section entrance reveals | `IntersectionObserver` | 0.6s |

---

## 7. Accessibility

- All interactive elements have `:focus-visible` gold outline
- Skip-to-content link as first element in `<body>`
- All images have descriptive `alt` attributes
- `aria-label` on icon-only buttons (WhatsApp, close, arrows)
- `role="navigation"` on `<nav>`, `aria-current="page"` on active nav link
- Color contrast: all text meets WCAG AA (4.5:1 minimum)
- `prefers-reduced-motion: reduce` disables ALL animations globally — curtain skipped, particles static, no scramble, no counter count-up, no reveals. Site is fully usable without motion.
- Hamburger menu: `aria-expanded`, `aria-controls`, focus trap when open

---

## 8. Responsiveness

| Breakpoint | Layout changes |
|---|---|
| `< 768px` | Single column all sections, hamburger nav, curtain text hidden, magnetic cursor disabled |
| `768px–1024px` | 2-col hero, 2×2 services grid, stacked process steps |
| `> 1024px` | Full desktop layout as described above |

---

## 9. Preserved Logic (carry over from existing index.html)

- **Translation system:** `translations` object (he/ar/en), `setLang()`, `localStorage` persistence, `dir` attribute switching, `placeholders` + `selectOptions` objects — all preserved verbatim or enhanced.
- **Form submission:** `submitForm()` async function → FormSubmit.co AJAX, trilingual validation messages, success/error states.
- **WhatsApp link:** `https://wa.me/9720522597010`
- **Email:** `saed.l.messi@outlook.com`

---

## 10. File Deliverable

Single file: `/Users/saeedkhoury/Desktop/Khoury's Law Firm/index.html`

Structure:
```
<!DOCTYPE html>
<html lang="he" dir="rtl" id="site">
  <head>
    <!-- meta, fonts, title -->
    <style>/* ALL CSS inline — ~600 lines */</style>
  </head>
  <body>
    <!-- Cursor elements -->
    <!-- Scroll progress bar -->
    <!-- Intro curtain overlay -->
    <!-- Language bar -->
    <!-- Header -->
    <!-- Hero + canvas -->
    <!-- Stats bar -->
    <!-- About -->
    <!-- Manifesto + canvas -->
    <!-- Services -->
    <!-- Process -->
    <!-- Partners -->
    <!-- Testimonials -->
    <!-- Contact -->
    <!-- Footer -->
    <!-- WhatsApp float -->
    <script>/* ALL JS inline — ~400 lines */</script>
  </body>
</html>
```
