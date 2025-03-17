import express from "express";
import * as logic from "./logic.js"; // Import logic functions

const router = express.Router();

// Route to get the list of Nobel Prizes
router.get("/nobelPrizes", async (req, res) => {
  try {
    const prizes = await logic.getNobelPrizes();
    res.json({ nobelPrizes: prizes });
  } catch (error) {
    console.error("❌ Error fetching Nobel Prizes:", error);
    res.status(500).json({ error: "Failed to fetch Nobel Prizes" });
  }
});

// Route to get details of a specific laureate
router.get("/laureate/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const laureate = await logic.getLaureateById(id);
    res.json(laureate);
  } catch (error) {
    console.error(`❌ Error fetching laureate ${id}:`, error);
    res.status(500).json({ error: "Failed to fetch laureate details" });
  }
});

export default router;
