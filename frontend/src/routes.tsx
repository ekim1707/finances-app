import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { resources } from "./environment/resources";
import HomePage from "./pages/home/homepage";
import Health from "./pages/health";

export default function ApplicationRouter() {
  return (
    <Router>
      <Routes>
        <Route path={resources.paths.base_path} element={<HomePage />} />
        <Route path={resources.paths.health} element={<Health />} />
      </Routes>
    </Router>
  );
}
