/** @type {import('tailwindcss').Config} */
// Minimalist, monochrome design system. Layout/components use Tailwind's default
// neutral (zinc) palette directly in templates; only the font stacks are themed
// here so `font-sans`/Preflight match assets/css/site.css.
module.exports = {
  content: [
    './layouts/**/*.html',
    './content/**/*.md',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: [
          'Inter', '-apple-system', 'BlinkMacSystemFont', '"Segoe UI"', 'Roboto',
          'Oxygen', 'Ubuntu', 'Cantarell', '"Helvetica Neue"', 'Arial', 'sans-serif',
        ],
        mono: [
          'ui-monospace', 'SFMono-Regular', '"SF Mono"', 'Menlo', 'Consolas',
          '"Liberation Mono"', 'monospace',
        ],
      },
    },
  },
  plugins: [],
};
