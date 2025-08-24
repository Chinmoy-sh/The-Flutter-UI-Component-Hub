// This is a basic, self-contained Flutter application
// that displays a CircularProgressIndicator with an image inside.

// To run this code, you'll need the Flutter SDK and a Dart-enabled editor.
// You can copy and paste this into a new main.dart file.

import 'package:flutter/material.dart';

// The main entry point of the application.
// void main() {
//   runApp(const MyApp());
// }

// // The root widget of the application.
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // MaterialApp provides a lot of useful widgets and properties.
//     return MaterialApp(
//       title: 'Flutter Progress with Logo',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       // The main content of the app is a Scaffold.
//       home: const ProgressWithLogoPage(),
//     );
//   }
// }

// A stateful widget to manage the UI of our main page.
class ProgressWithLogoPage extends StatefulWidget {
  const ProgressWithLogoPage({super.key});

  @override
  State<ProgressWithLogoPage> createState() => _ProgressWithLogoPageState();
}

// The state class for ProgressWithLogoPage.
class _ProgressWithLogoPageState extends State<ProgressWithLogoPage> {
  @override
  Widget build(BuildContext context) {
    // Scaffold provides the basic visual layout structure.
    return Scaffold(
      appBar: AppBar(title: const Text('Progress with Logo')),
      // Use Center to place the entire Stack in the middle of the screen.
      body: Center(
        // The Stack widget allows us to layer widgets on top of each other.
        child: Stack(
          alignment:
              Alignment.center, // Aligns children at the center of the stack.
          children: <Widget>[
            // This is the base layer: the CircularProgressIndicator.
            const SizedBox(
              width: 30, // You can adjust the size of the circle here.
              height: 30,
              child: CircularProgressIndicator(
                strokeWidth: 2.0, // Adjust the thickness of the circle.
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
            // This is the top layer: the logo.
            // We use a different widget depending on the asset.
            // For a local image, uncomment the next line and add the path to pubspec.yaml.
            // Image.asset('assets/bnb.png', width: 50, height: 50),

            // For a simple icon from Flutter's built-in icons:
            const Icon(
              Icons.flutter_dash, // You can choose any icon here.
              size: 20, // Adjust the size of the icon.
              color: Colors.blue,
            ),

            // To use your bnb.png file, you must first add it to your project
            // under a folder (e.g., 'assets/'). Then, update your pubspec.yaml file
            // to include the asset. The Image.asset widget is commented out above
            // to prevent a runtime error if the asset isn't added.
          ],
        ),
      ),
    );
  }
}
