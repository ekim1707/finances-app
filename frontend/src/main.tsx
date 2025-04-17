import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import "./index.scss";
import { Provider } from "react-redux";
import { store } from "./redux/store/store.ts";
import AppConfigured from "./components/app-configured.tsx";

createRoot(document.getElementById("root")!).render(
  <StrictMode>
    <Provider store={store}>
      <AppConfigured />
    </Provider>
  </StrictMode>
);
