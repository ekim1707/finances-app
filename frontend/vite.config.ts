import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

// const isDev = process.env.NODE_ENV === "dev";

// https://vite.dev/config/
export default defineConfig({
  base: "./",
  define: {
    "process.env": {
      VITE_API_ENDPOINT:
        process.env.VITE_API_ENDPOINT || "http://localhost:4200",
    },
  },
  plugins: [react()],
  build: {
    // minify: !isDev,
    // sourcemap: isDev
  },
  server: {
    port: 4200,
    // proxy: {},
    // resolve: {
    //   alias: {}
    // }
  },
});
