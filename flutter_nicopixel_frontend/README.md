# Flutter Nobel Prize App

This is a simple Flutter application that fetches and displays Nobel Prize winners from a backend API. The app consists of two main screens:

1. **List Screen**: Displays a list of Nobel Prize winners.
2. **Detail Screen**: Shows detailed information about a selected winner.

## Features
- Fetches data from a backend API (`http://localhost:8000/api/nobelPrizes`).
- Displays a scrollable list of prizes.
- Navigates to a detailed screen when a laureate is selected.
- Handles loading and error states.

## Installation & Running the App

### Prerequisites
- Ensure you have Flutter installed: [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)
- Install dependencies:
  ```sh
  flutter pub get
  ```

### Running the Application
1. Start the backend server (`Node.js` backend must be running on `localhost:8000`).
2. Run the Flutter app on an emulator or real device:
   ```sh
   flutter run -d chrome  # For web
   flutter run -d android # For Android
   ```

> **Note:** If running on a mobile device, ensure CORS is handled correctly in the backend.

## Project Structure

Currently, all the Flutter code is in `main.dart`. In a real-world application, the project should be structured into separate files for better maintainability:

```
/lib
  ├── main.dart             # Entry point
  ├── screens/
  │    ├── list_screen.dart # List view
  │    ├── detail_screen.dart # Details view
  ├── models/
  │    ├── prize.dart       # Prize data model
  │    ├── laureate.dart    # Laureate data model
  ├── services/
  │    ├── api_service.dart # Handles API calls
```

## TODO (Improvements for a Production-Ready App)
- [ ] **Refactor code into separate files**: Split screens, models, and services into their own Dart files.
- [ ] **Pagination support**: Implement pagination in the list screen for better performance.
- [ ] **Search & Filters**: Allow users to search for specific prizes or filter by year/category.
- [ ] **Better State Management**: Replace `setState` with a more scalable approach like `Provider` or `Riverpod`.
- [ ] **Implement `.env` configuration**: Store API URLs in an environment file instead of hardcoding them.
- [ ] **Unit & UI Testing**: Add tests using `flutter_test` to verify API integration and UI components.
- [ ] **Offline Support**: Implement caching to show data even without an internet connection.
- [ ] **Error Logging & Monitoring**: Use tools like Sentry to track errors in production.
- [ ] **Improve UI/UX**: Add animations, themes, and better UI components for a polished experience.

## Technologies Used
- **Flutter** (UI framework)
- **Dart** (Programming language)
- **http package** (API calls)
- **Material Design** (UI components)

## License
This project is for educational purposes only.

---

✅ Feel free to improve or contribute to this project!
