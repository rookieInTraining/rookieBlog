/** @type {import('tailwindcss').Config} */
// SchoolChalk design system, whiteboard (light) theme. Templates use these
// chalk "ink" pressure steps (charcoal at opacity, never 100% opaque) and the
// deep pigment chalk sticks; font stacks mirror assets/css/site.css tokens.
module.exports = {
  content: [
    './layouts/**/*.html',
    './content/**/*.md',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['"Patrick Hand"', '"Comic Sans MS"', 'cursive'],
        display: ['"Cabin Sketch"', '"Comic Sans MS"', 'cursive'],
        note: ['Schoolbell', '"Patrick Hand"', 'cursive'],
        mono: ['"Cutive Mono"', '"Courier New"', 'monospace'],
      },
      colors: {
        ink: {
          full: 'rgba(42, 45, 43, 0.92)',    // pressed hard
          strong: 'rgba(42, 45, 43, 0.78)',  // normal stroke
          subdued: 'rgba(42, 45, 43, 0.55)', // light stroke
          faint: 'rgba(42, 45, 43, 0.32)',   // half-erased
          ghost: 'rgba(42, 45, 43, 0.14)',   // eraser smudge
          dust: 'rgba(42, 45, 43, 0.06)',    // chalk dust film
        },
        board: {
          DEFAULT: '#1d211f', // slate blackboard
          deep: '#141715',
        },
        chalk: {
          white: '#f2f0e9',
          yellow: '#8f7420',
          blue: '#3e6c9e',
          green: '#3f7a50',
          pink: '#b0566e', // accent
          orange: '#a8642a',
          red: '#b04a42',
          purple: '#6d5399',
        },
      },
    },
  },
  plugins: [],
};
