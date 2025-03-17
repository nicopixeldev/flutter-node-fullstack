import fetch from "node-fetch";

const API_BASE_URL = "http://api.nobelprize.org/2.1";

/**
 * Fetches the list of Nobel Prizes from the external API.
 * @returns {Promise<Array>} A list of Nobel Prizes.
 */
export const getNobelPrizes = async () => {
  try {
    const response = await fetch(`${API_BASE_URL}/nobelPrizes?sort=asc`);
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }
    const data = await response.json();
    return data.nobelPrizes;
  } catch (error) {
    console.error("❌ Error fetching Nobel Prizes:", error);
    throw new Error("Failed to fetch Nobel Prizes");
  }
};

/**
 * Fetches details of a specific laureate by ID.
 * @param {string} id - The laureate ID.
 * @returns {Promise<Object>} The laureate details.
 */
export const getLaureateById = async (id) => {
  try {
    if (!id || isNaN(id)) {
      throw new Error("Invalid laureate ID");
    }

    const response = await fetch(`${API_BASE_URL}/laureate/${id}`);

    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }

    const data = await response.json();
    return data || [];
  } catch (error) {
    console.error(`❌ Error fetching laureate ID ${id}:`, error);
    throw new Error("Failed to fetch laureate details");
  }
};
