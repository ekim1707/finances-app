import { useEffect, useState } from "react";
import { API_URL } from "../../config";

export default function Health() {
  const [backendStatus, setBackendStatus] = useState("Loading...");

  useEffect(() => {
    console.log(API_URL);
    fetch(`${API_URL}/health`)
      .then((response) => response.json())
      .then((data) => {
        setBackendStatus(
          `Backend: ${data.status} (${data.service} v${data.version})`
        );
      })
      .catch((error) => {
        setBackendStatus("Backend: Unreachable");
        console.log(error);
      });
  }, []);
  return (
    <div>
      <h1>Frontend is running</h1>
      <h2>{backendStatus}</h2>
    </div>
  );
}
