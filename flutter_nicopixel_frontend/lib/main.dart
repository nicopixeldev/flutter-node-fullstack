import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp()); // Starts the Flutter application
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Challenge', // Application title
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // Sets the theme color
        useMaterial3: true,
      ),
      home: const ListScreen(), // The first screen of the app
    );
  }
}

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  _ListScreenState createState() => _ListScreenState(); // Creates state for this screen
}

class _ListScreenState extends State<ListScreen> {
  List<dynamic> prizes = []; // Stores API data
  bool isLoading = true; // Indicates loading state
  bool hasError = false; // Indicates if an error occurred

  @override
  void initState() {
    super.initState();
    fetchNobelPrizes(); // Fetches data when the screen loads
  }

  Future<void> fetchNobelPrizes() async {
    try {
      final response = await http.get(
        Uri.parse("http://localhost:8000/api/nobelPrizes"), // API endpoint
      );

      if (response.statusCode == 200) { // Checks if response is OK
        final jsonData = jsonDecode(response.body);
        setState(() {
          prizes = jsonData['nobelPrizes']; // Stores the API data
          isLoading = false;
        });
      } else {
        setState(() {
          hasError = true;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nobel Prizes")), // App bar with title
      body: isLoading
          ? const Center(child: CircularProgressIndicator()) // Shows loading indicator
          : hasError
          ? const Center(child: Text("Failed to load data")) // Shows error message
          : ListView.builder(
        itemCount: prizes.length, // Number of items
        itemBuilder: (context, index) {
          var prize = prizes[index];
          String year = prize['awardYear']; // Prize year
          String category = prize['category']['en']; // Prize category
          List<dynamic> laureates = prize['laureates'] ?? [];

          // Concatenates laureate names
          String laureatesNames = laureates.isNotEmpty
              ? laureates.map((l) => l['knownName']?['en'] ?? "Unknown").join(", ")
              : "No laureates";

          return ListTile(
            title: Text("$year - $category"), // Shows year and category
            subtitle: Text("Awarded to: $laureatesNames"), // Shows laureates
            onTap: laureates.isNotEmpty
                ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    laureateId: laureates.first['id'], // Passes laureate ID
                  ),
                ),
              );
            }
                : null, // Disables tap if no laureates
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatefulWidget {
  final String laureateId;

  const DetailScreen({super.key, required this.laureateId});

  @override
  _DetailScreenState createState() => _DetailScreenState(); // Creates state for details screen
}

class _DetailScreenState extends State<DetailScreen> {
  Map<String, dynamic>? laureate; // Stores laureate data
  bool isLoading = true; // Indicates loading state
  bool hasError = false; // Indicates error state

  @override
  void initState() {
    super.initState();
    fetchLaureateDetails(); // Fetch laureate details when screen loads
  }

  Future<void> fetchLaureateDetails() async {
    try {
      final url = "http://localhost:8000/api/laureate/${widget.laureateId}";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        // ✅ Ensures jsonData is a list and takes first element
        if (jsonData is List && jsonData.isNotEmpty) {
          setState(() {
            laureate = jsonData[0];
            isLoading = false;
          });
        } else {
          setState(() {
            hasError = true;
            isLoading = false;
          });
        }
      } else {
        setState(() {
          hasError = true;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Laureate Details")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator()) // Shows loading indicator
          : hasError
          ? const Center(child: Text("Failed to load details")) // Shows error message
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              laureate?['fullName']?['en'] ?? "Unknown Laureate",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Text(
              "Awarded in: ${laureate?['nobelPrizes']?[0]?['awardYear'] ?? 'N/A'}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            Text(
              "Category: ${laureate?['nobelPrizes']?[0]?['category']?['en'] ?? 'Unknown'}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}