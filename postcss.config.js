// PostCSS pipeline consumed by Hugo's `css.PostCSS` (see layouts/_default/baseof.html).
// Requires postcss, postcss-cli, autoprefixer and tailwindcss in node_modules.
const autoprefixer = require('autoprefixer');
const tailwindcss = require('tailwindcss');

module.exports = {
  plugins: [
    tailwindcss('./tailwind.config.js'),
    autoprefixer,
  ],
};
