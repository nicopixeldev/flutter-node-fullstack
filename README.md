# 📌 Nobel Prizes App

This repository contains a **full-stack** application that displays Nobel Prize winners using a **Flutter frontend** and a **Node.js backend**. The backend acts as a proxy to fetch data from the Nobel Prize API, improving performance and handling CORS restrictions.

## 📁 Project Structure

```
root/
│-- flutter_nicopixel_frontend/  # Flutter application
│-- node_nicopixel_server/       # Node.js backend
│-- .gitignore
│-- README.md                    # This file
```

- **[Frontend (Flutter)](./flutter_nicopixel_frontend/README.md)**: A mobile app built with Flutter that fetches and displays Nobel Prize winners.
- **[Backend (Node.js)](./node_nicopixel_server/README.md)**: A lightweight Express.js API that retrieves and serves Nobel Prize data.

## 🚀 Getting Started

### 1️⃣ Clone the Repository
```sh
git clone https://github.com/your-repo/nobel-prizes-app.git
cd nobel-prizes-app
```

### 2️⃣ Start the Backend
```sh
cd node_nicopixel_server
npm install  # Install dependencies
npm start    # Run the server on http://localhost:8000
```

### 3️⃣ Start the Frontend
```sh
cd ../flutter_nicopixel_frontend
flutter pub get   # Install dependencies
flutter run       # Launch the app
```

## 🔥 Features
✅ Mobile-first UI built with Flutter  
✅ Uses a layered architecture in the backend  
✅ Handles API requests efficiently  
✅ CORS-friendly backend proxy  
✅ Easily extendable for future improvements  

## 📌 Next Steps
Future enhancements could include:
- **State management**: Implement a robust state management solution like Riverpod or Bloc in Flutter.
- **Database caching**: Store frequently accessed API data in a database (Redis/PostgreSQL) to reduce external API calls.
- **Authentication**: Add a user login system if required for additional functionalities.
- **Testing**: Add unit and integration tests for both frontend and backend.
- **Pagination**: Implement API pagination to handle large datasets efficiently.

## 🤝 Contributing
Feel free to fork this repository and submit pull requests! All contributions are welcome. 🎉

---

Happy coding! 🚀