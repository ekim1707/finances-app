import { useState } from "react";
import { AppConfig } from "../common/types";
import { AppContext } from "../common/app-context";
import Router from "../routes";

export default function AppConfigured() {
  const [config, setConfig] = useState<AppConfig | null>(null);
  return (
    <AppContext.Provider value={config}>
      <Router />
    </AppContext.Provider>
  );
}
