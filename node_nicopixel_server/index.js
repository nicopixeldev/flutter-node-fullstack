import express from "express";
import cors from "cors";
import routes from "./src/route-handlers.js"; // Import the route handlers

const app = express();

app.use(cors()); // Enable CORS
app.use(express.json()); // Enable JSON parsing

// Use the modular routes
app.use("/api", routes);

// Start the server
const PORT = 8000;
app.listen(PORT, () => {
  console.log(`🚀 Server is running on http://localhost:${PORT}`);
});
