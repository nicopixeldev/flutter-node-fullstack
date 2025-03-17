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

## ❗️ Missing: TypeScript Integration
🚨 **Currently, the backend is written in JavaScript (ES6), but it should be migrated to TypeScript for better maintainability, type safety, and scalability.**  

### Why integrate TypeScript?
- **Stronger Type Safety** 🛡️: Reduces runtime errors by catching type issues early.
- **Improved Developer Experience** 💡: Better code autocompletion and debugging support.
- **Scalability** 🚀: Makes it easier to extend and refactor the project as it grows.

### Steps to migrate:
1. Install TypeScript dependencies:
   ```sh
   npm install --save-dev typescript @types/node ts-node
   ```
2. Create a `tsconfig.json` file for TypeScript configuration.
3. Convert `.js` files to `.ts` and replace `require` with `import`.
4. Define proper types/interfaces for API responses and function parameters.
5. Run the backend using `ts-node` instead of `node`.

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

🔹 This **reduces network load**, improving frontend performance.

---

### **🗄️ Caching & Database Layer**
Since Nobel Prize data **doesn’t change often**, we can **cache responses** instead of hitting the external API on every request.

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

---

## ⚠️ Error Handling & Data Validation

Currently, **error handling is minimal**, with basic `try/catch` blocks. For production, we should **enhance validation** and **logging**.

### **✅ Recommended Enhancements:**
1. **Use `Zod` for input validation**
2. **Centralize error handling**
3. **Integrate logging tools** (e.g., `Winston`)

---

## 🌍 Environment Variables

Currently, the project does **not** use `.env` files, but for production, we **must** store API URLs, secrets, and database connections **securely**.

---

## 📜 Pagination Support

The Nobel Prize API **supports pagination**, but it's not yet implemented.

For real-world usage, we should allow the frontend to request paginated data dynamically.

---

## 🧪 Testing (Future Enhancement)

Currently, there are **no tests**. To ensure stability, we should integrate **unit tests** and **API tests** using `Mocha` & `Chai`.

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

---

## ✅ TODO - Future Improvements
- [ ] **Migrate to TypeScript** for type safety and maintainability
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