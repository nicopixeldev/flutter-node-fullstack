# 🏆 Nobel Prize API - Custom Backend

This is a **custom backend** built with **Node.js & Express** to fetch and serve Nobel Prize data. The architecture follows a **layered design**, ensuring modularity and scalability.

---

## 🚀 Features
✅ **Layered Architecture** for clean separation of concerns  
✅ **External API Integration** with [Nobel Prize API](https://api.nobelprize.org)  
✅ **CORS Handling** for frontend compatibility  
✅ **Error Handling** with structured responses  
✅ **Modular Routes & Logic** for maintainability  
✅ **Future-Ready** (Can be extended with DB, caching, session management)  

---

## 🏛️ Architecture Overview

This project follows a **basic layered architecture**, separating concerns into **route-handlers** and **logic processing**. While simple, this structure allows for **scalability**.

### **🟢 Current Layers:**
| Layer | Description |
|-------|------------|
| **1️⃣ Route Handlers (`route-handlers.js`)** | Manages API endpoints, receives requests, and delegates to logic |
| **2️⃣ Logic Layer (`logic.js`)** | Handles business logic, data validation, and API calls |

---

## 🏗️ **Future Layer Enhancements**
To make the backend **more efficient and scalable**, we propose **adding new layers**:

### **📦 Data Transformation Layer**
✅ **Filters unnecessary data** before sending responses  
✅ **Removes redundant or sensitive fields**  
✅ **Optimizes payload size** for better frontend performance  

**Example:**
Instead of returning **all API fields**, we can **only send relevant data** like:
```json
{
  "awardYear": "2022",
  "category": "Physics",
  "laureates": ["John Doe", "Jane Smith"]
}
```
🔹 This **reduces network load**, improving frontend performance.

---

### **🗄️ Caching & Database Layer**
Since Nobel Prize data **doesn’t change often**, we can **cache responses** instead of hitting the external API on every request.

#### **How It Works:**
1. **First request** → Calls external API and saves data in **Redis (cache)** or **MongoDB/PostgreSQL (database)**.  
2. **Subsequent requests** → Fetch data from cache/database instead of external API.  
3. **Scheduled updates** → Refreshes data **every X hours** to ensure accuracy.  

**Benefits:**
✅ **Reduces API rate limits** from Nobel API  
✅ **Speeds up responses** by avoiding unnecessary API calls  
✅ **Minimizes latency** for users  

---

## 🔑 Session Management (Future Enhancement)
Currently, the API **does not require authentication**, but in real-world applications, we may need **session management**.

### **🛠️ How It Would Work**
1. **User logs in** → Backend issues a **JWT Token**  
2. **Frontend sends the token** in every request  
3. **Middleware (`auth-middleware.js`)** validates the token  
4. **Protected routes** require authentication  

**Example Middleware for JWT Auth:**
```js
import jwt from "jsonwebtoken";

export const authenticate = (req, res, next) => {
  const token = req.headers.authorization?.split(" ")[1];
  if (!token) return res.status(401).json({ error: "Unauthorized" });

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.user = decoded;
    next();
  } catch (err) {
    res.status(403).json({ error: "Invalid token" });
  }
};
```

🔹 **Even if not needed for this API**, this feature is **useful for private endpoints**.

---

## ⚠️ Error Handling & Data Validation

Currently, **error handling is minimal**, with basic `try/catch` blocks. For production, we should **enhance validation** and **logging**.

### **✅ Recommended Enhancements:**
1. **Use `Zod` for input validation**
2. **Centralize error handling**
3. **Integrate logging tools** (e.g., `Winston`)

### **🔍 Example - Zod Validation**
```js
import { z } from "zod";

const idSchema = z.string().regex(/^\d+$/, "Invalid ID format");

export const validateId = (req, res, next) => {
  const result = idSchema.safeParse(req.params.id);
  if (!result.success) return res.status(400).json({ error: "Invalid ID" });
  next();
};
```

---

## 🌍 Environment Variables

Currently, the project does **not** use `.env` files, but for production, we **must** store API URLs, secrets, and database connections **securely**.

### **Example `.env` File**
```
PORT=8000
API_BASE_URL=http://api.nobelprize.org/2.1
JWT_SECRET=my_secret_key
CACHE_TTL=3600
```

🔹 **Using `dotenv`** to load environment variables:
```js
import dotenv from "dotenv";
dotenv.config();
```

---

## 📜 Pagination Support

The Nobel Prize API **supports pagination**, but it's not yet implemented.

### **🛠️ Why Implement Pagination?**
✅ **Reduces load time** (Fetching 1000+ results at once is slow)  
✅ **Improves API efficiency** by reducing data transfer  
✅ **Enhances frontend performance**  

### **📌 Example Paginated Request**
```
GET http://api.nobelprize.org/2.1/nobelPrizes?limit=10&offset=20
```

For real-world usage, we should allow the frontend to request paginated data dynamically.

---

## 🧪 Testing (Future Enhancement)

Currently, there are **no tests**. To ensure stability, we should integrate **unit tests** and **API tests** using `Mocha` & `Chai`.

### **🛠️ Testing Plan**
| Test Type | Purpose |
|-----------|---------|
| **Unit Tests** | Test functions (e.g., logic.js methods) |
| **Integration Tests** | Ensure API routes work correctly |
| **Error Handling Tests** | Check invalid inputs & edge cases |

### **✅ Example Mocha/Chai Test**
```js
import { expect } from "chai";
import { getNobelPrizes } from "../src/logic.js";

describe("Nobel Prize API Tests", () => {
  it("should return an array of prizes", async () => {
    const prizes = await getNobelPrizes();
    expect(prizes).to.be.an("array");
  });
});
```

---

## 📥 Installation & Usage

### **1️⃣ Clone the Repository**
```sh
git clone https://github.com/yourusername/nobel-backend.git
cd nobel-backend
```

### **2️⃣ Install Dependencies**
```sh
npm install
```

### **3️⃣ Start the Server**
```sh
node index.js
```
Server should start at **http://localhost:8000**

### **4️⃣ Test API Endpoints**
- **Get Nobel Prizes:** `GET http://localhost:8000/api/nobelPrizes`
- **Get Laureate Details:** `GET http://localhost:8000/api/laureate/569`

---

## ✅ TODO - Future Improvements
- [ ] **Add a Data Transformation Layer** (Filter unnecessary fields)
- [ ] **Implement Redis/MongoDB caching** (Avoid redundant API calls)
- [ ] **Integrate JWT-based session management** (For future authentication needs)
- [ ] **Improve error handling with `Zod` & structured logging**
- [ ] **Use environment variables (`.env`) for sensitive data**
- [ ] **Implement API Pagination support**
- [ ] **Write Mocha/Chai tests for API endpoints**
- [ ] **Optimize API performance for scalability**

---

## 🎯 Conclusion
This project serves as a **base for a robust API backend**. While it's simple, it is **designed to be scalable** with **modular layers, caching, validation, and future session management**.