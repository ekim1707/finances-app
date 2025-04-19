import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { resources } from "./environment/resources";
import HomePage from "./pages/home/homepage";
import Health from "./pages/check-health";

export default function ApplicationRouter() {
  const basePath = import.meta.env.VITE_BASE_PATH;
  const { paths } = resources;
  return (
    <Router basename={basePath}>
      <Routes>
        <Route index element={<HomePage />} />

        <Route path={paths.health} element={<Health />} />
      </Routes>
    </Router>
  );
}
