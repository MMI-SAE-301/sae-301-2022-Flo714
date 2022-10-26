const formKitTailwind = require("@formkit/themes/tailwindcss");

/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./index.html", "./src/**/*.{vue,js,ts,jsx,tsx}", './node_modules/tw-elements/dist/js/**/*.js'],
  theme: {
    colors: {
      'blanc':'#ffffff',
      'noir':'#000000',
      'rouge': '#E6332A',
      'bleu': '#72B0DD',
      'gris': '#D9D9D9',
    },

    extend: {
      "fontFamily": {
        "inter": "Inter"
      },
      boxShadow: {
        '3xl': '0 35px 60px -15px rgba(0, 0, 0, 0.3)',
      }
    }
  },
  plugins: [
    require("@tailwindcss/typography"),
    require("@tailwindcss/forms"),
    formKitTailwind,
    require("@headlessui/tailwindcss"),
    require('tw-elements/dist/plugin'),
  ],
};
