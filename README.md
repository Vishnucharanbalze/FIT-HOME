# FitAtHome – Smart Home Workout Planner

A modern, fully working web application that helps people **plan, perform and track home workouts** — no gym, no subscription, no API keys, no backend. Built with React + Vite, it runs entirely in the browser, saves data with `localStorage`, and works **offline** as an installable Progressive Web App (PWA).

> **Total running cost: ₹0.** No paid services, no accounts, no secrets.

---

## 1. Introduction

FitAtHome is a personal fitness dashboard for home training. Users can choose from predefined programs or build their own, follow along with a live workout player (with timers, rest periods and audio cues), and see their progress through charts, streaks, a calendar and personal records. It also includes a BMI calculator and a daily water tracker.

## 2. Problem Statement

Many people want to exercise at home but face three problems:

1. **No structure** – they don't know which exercises to do, in what order, or for how long.
2. **No motivation or feedback** – without tracking, progress is invisible and habits break.
3. **Cost and complexity** – most fitness apps need subscriptions, accounts, or an internet connection.

FitAtHome solves these with ready-made plans, a guided workout player and automatic progress tracking — free, private and offline-capable.

## 3. Objectives

- Provide structured workout plans for different goals and fitness levels.
- Offer a library of 60+ exercises with visual demonstrations and instructions.
- Guide users through workouts with a real timer, rest periods and audio cues.
- Track history, calories, streaks and records automatically.
- Keep all data on the user's device (privacy-first, zero cost).
- Work on desktop and mobile, online and offline.

## 4. Features (15 modules)

| # | Module | What it does |
|---|--------|--------------|
| 1 | **Dashboard** | Personalised greeting, today's planned workout, daily goal ring, total workouts, estimated calories, streak, weekly completion %, weekly activity chart, motivational messages, hydration widget, recent workouts |
| 2 | **Workout Planner** | 7 predefined plans (Weight Loss, Muscle Building, Full Body, Abs, Beginner, Strength, Flexibility); Beginner / Intermediate / Advanced scaling; filter by goal; add to schedule; create, edit, copy and delete custom plans |
| 3 | **Exercise Library** | 68 built-in exercises, each with an animated SVG demonstration, target muscles, difficulty, step-by-step instructions, recommended sets, reps/duration and rest; search + category + difficulty filters |
| 4 | **Live Workout Mode** | Start, pause, resume, reset, get-ready countdown, work timer, rest timer (+15 s / skip), next/previous exercise, "set done", "complete exercise", progress bar, Web Audio beeps, voice coach (speech synthesis), vibration, screen wake-lock, keyboard shortcuts, summary screen |
| 5 | **Custom Workout Builder** | Add/remove/reorder exercises, set sets, reps (or seconds) and rest, pick workout days and colour, live duration & calorie estimate, save |
| 6 | **Progress Analytics** | Daily activity (7/30/90 days), weekly workouts, monthly progress, completion statistics, current & best streak, calorie tracking, personal records, full day-by-day history with delete |
| 7 | **BMI Calculator** | Metric & imperial input, BMI value, category, colour scale, healthy weight range, educational explanation, saves measurements to profile, weight-trend chart. *BMI is a rough screening measure, not a medical diagnosis.* |
| 8 | **Water Tracker** | Daily goal, quick add (150/250/500 ml), custom amount, undo/remove entries, animated bottle, 7-day chart, automatic daily reset + manual reset |
| 9 | **Workout Calendar** | Month view with completed, scheduled, missed and rest days; click any day for its history and planned workouts |
| 10 | **User Profile** | Name, age, gender, height, weight, fitness goal, fitness level, preferred duration + workout preferences (sound, voice, vibration, countdown, auto-advance) |
| 11 | **Demo Mode** | Loads automatically on first launch: sample profile, ~10 weeks of realistic history (generated relative to today), weekly stats, custom plans, water logs and measurements. One-click **Reset demo** or **Start fresh** |
| 12 | **Local Data Storage** | Profile, plans, history, completed exercises, water, measurements, streak data and preferences saved in `localStorage`; survives refresh; JSON export/import backup |
| 13 | **Offline / PWA** | Web app manifest, service worker that precaches every built file, installable, works offline after first load |
| 14 | **Documentation** | This README |
| 15 | **Free Deployment** | Ready for local Windows use, GitHub and Netlify (SPA redirects included) |

### How the numbers are calculated

- **Calories (estimate):** `MET × body weight (kg) × hours`, using a MET value stored for every exercise, plus a low MET for rest periods. These are estimates, not medical measurements.
- **Streak:** consecutive workout days. Unscheduled rest days do **not** break a streak; a missed *scheduled* day does.
- **Weekly completion:** completed sessions ÷ scheduled sessions so far this week (Monday-based).
- **Level scaling:** Beginner = −1 set, 70 % reps/time, +30 % rest. Advanced = +1 set, 130 % reps/time, −20 % rest.

> **Note:** `localStorage` keeps data in *this browser on this device only*. It does **not** sync between devices or browsers. Use **Profile → Export backup / Import backup** to move data.

## 5. Technology Stack

| Layer | Technology |
|-------|-----------|
| UI library | React 18 |
| Build tool / dev server | Vite 5 |
| Language | JavaScript (ES2022), JSX |
| Styling | Custom CSS3 design system (dark theme, neon green, glassmorphism) |
| Icons | Lucide React |
| Charts | Recharts |
| Routing | React Router 6 |
| Fonts | Inter + Space Grotesk via Fontsource (bundled locally — no CDN) |
| Storage | Browser `localStorage` |
| Audio | Web Audio API + Speech Synthesis API |
| Offline | Service Worker + Web App Manifest (no extra libraries) |

## 6. System Requirements

- **OS:** Windows 10 / 11 (also works on macOS / Linux)
- **Node.js:** version 18 or newer (LTS recommended) — <https://nodejs.org>
- **Browser:** latest Chrome, Edge or Firefox (Chrome/Edge recommended for "Install app")
- **Disk:** ~250 MB for `node_modules`
- Internet is needed only for `npm install` and deployment.

## 7. Installation & Running (Windows)

### Option A – one double-click
Double-click **`start-windows.bat`**. It installs dependencies the first time and opens the app at <http://localhost:5173>.

### Option B – manually (Command Prompt or PowerShell)
```bash
cd "path\to\fit health"
npm install          # first time only
npm run dev          # development server → http://localhost:5173
```

### Production build (to test offline / PWA locally)
```bash
npm run build        # creates the dist/ folder
npm run preview      # serves the build → http://localhost:4173
```
The service worker is only active in the production build (`npm run preview` or the deployed site).

### Presentation tips
- The app opens in **Demo Mode** with a full sample history so every chart is populated.
- Use **Reset demo** (banner or Profile page) to restore the sample data before presenting.
- Use **Start fresh** to show the empty, first-time experience.
- Live workout keyboard shortcuts: **Space** = start/pause, **← / →** = previous/next exercise.

## 8. Project Architecture

```
fit health/
├── index.html                 # App shell, PWA meta tags
├── vite.config.js             # Vite + tiny plugin that writes the SW precache list
├── netlify.toml               # Netlify build + SPA redirect + headers
├── start-windows.bat          # One-click local launcher
├── public/
│   ├── manifest.webmanifest   # PWA manifest
│   ├── sw.js                  # Service worker (offline cache)
│   ├── _redirects             # Netlify SPA fallback
│   └── icons/                 # App icons (SVG + PNG + maskable)
└── src/
    ├── main.jsx               # Entry: router, provider, fonts, SW registration
    ├── App.jsx                # Routes
    ├── index.css              # Design system
    ├── context/
    │   └── AppContext.jsx     # Global state + all actions + localStorage persistence
    ├── data/
    │   ├── exercises.js       # 68 exercises (muscle, difficulty, sets, reps, rest, MET, steps)
    │   ├── poses.js           # Keyframes for the animated stick-figure demos
    │   ├── plans.js           # 7 predefined plans, goals, levels
    │   ├── demoData.js        # Demo-mode generator + empty state
    │   └── quotes.js          # Motivational messages
    ├── utils/
    │   ├── workout.js         # Level scaling, duration/calorie estimates, player steps
    │   ├── stats.js           # Streaks, series for charts, records, BMI
    │   ├── date.js            # Local-date helpers and formatting
    │   ├── audio.js           # Beeps, voice, vibration, notifications
    │   └── pwa.js             # SW registration, install prompt, online status
    ├── components/
    │   ├── Layout.jsx         # Sidebar, mobile bottom nav, demo banner, toasts
    │   ├── ExerciseFigure.jsx # Animated SVG exercise demonstration
    │   ├── ExerciseModal.jsx  # Exercise detail view
    │   ├── Modal.jsx          # Accessible modal dialog
    │   └── ui.jsx             # StatCard, ProgressRing, Stepper, Switch, charts tooltip…
    └── pages/                 # Dashboard, Planner, PlanDetail, Builder, Library,
                               # Workout (player), Progress, Calendar, BMI, Water, Profile
```

**Data flow:** every page reads from and writes to a single `AppContext`. Any change is saved to `localStorage` (key `fitathome:v1`) automatically. Charts, streaks and records are *derived* from workout history, so they are always consistent.

**Workout player:** a plan becomes a flat list of steps (`prepare → work → rest → work …`). A reducer manages the state machine, and the timer uses timestamps (not counting ticks), so it stays accurate even if the browser throttles the tab.

## 9. Deployment (free)

### GitHub
```bash
git init
git add .
git commit -m "FitAtHome – initial version"
git branch -M main
git remote add origin https://github.com/<your-username>/fitathome.git
git push -u origin main
```

### Netlify (free tier)
1. Log in at <https://app.netlify.com> → **Add new site → Import an existing project** → choose your GitHub repo.
2. Build command: `npm run build`  ·  Publish directory: `dist` (already set in `netlify.toml`).
3. Click **Deploy**. You get a public link like `https://fitathome-yourname.netlify.app`.

*Quick alternative:* run `npm run build` and drag the `dist` folder onto <https://app.netlify.com/drop>.

No environment variables or API keys are needed.

## 10. Future Enhancements

- Optional cloud sync (e.g. a free-tier backend) for multi-device use
- Real exercise videos / Lottie animations
- Pose detection with the webcam to count reps (on-device ML)
- Nutrition & meal logging
- Reminders via push notifications
- Social challenges and shareable achievement badges
- Multi-language support (Hindi, Tamil, Telugu …)
- Wearable / Google Fit integration

---

*Disclaimer: FitAtHome provides general fitness information. Calorie values are estimates, and BMI is a screening tool, not a diagnosis. Consult a qualified professional before starting a new exercise program.*
