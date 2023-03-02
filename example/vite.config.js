import { defineConfig } from "vite";
import elmPlugin from "vite-plugin-elm";

export default defineConfig({
  plugins: [elmPlugin()],
  server: {
    proxy: {
      "/helloworld": "http://127.0.0.1:3000",
    },
  },
});
