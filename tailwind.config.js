const path = require("path");
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./components/**/*.{js,ts,jsx,tsx,mdx}",
    "./app/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      container: {
        center: true,
        padding: "1rem",
        screens: {
          sm: "100%",
          md: "100%",
          lg: "100%",
          xl: "1536px",
        },
      },
      backgroundColor: {
        topHeaderColor: "#242323",
        buttonBgColor: "#0074BC",
        sectionBgColor: "#242323",
      },
      textColor: {
        textColor: "#FFFFFF",
        hoverBgColor: "#0074BC",
      },
    },
  },
  plugins: [],
};
