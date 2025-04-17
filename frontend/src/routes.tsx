import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { resources } from "./environment/resources";
import HomePage from "./pages/home/homepage";

export default function ApplicationRouter() {
  return (
    <Router>
      <Routes>
        <Route path={resources.paths.basePath} element={<HomePage />} />
      </Routes>
    </Router>
  );
}
