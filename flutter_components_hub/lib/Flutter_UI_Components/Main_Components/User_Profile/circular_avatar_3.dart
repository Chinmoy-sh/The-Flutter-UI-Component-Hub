// This is a basic, self-contained Flutter application
// that displays a circular profile avatar.

import 'package:flutter/material.dart';

// // The main entry point of the application.
// void main() {
//   runApp(const MyApp());
// }

// // The root widget of the application.
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Circular Avatar Demo',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const AvatarPage(),
//     );
//   }
// }

// The main page widget to display the avatar.
class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Avatar')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // The main widget for our circular avatar.
            // A CircleAvatar is the easiest way to make a circular avatar
            // with a background color or text, but it's less flexible
            // for images.
            const CircleAvatar(
              radius: 60.0, // Adjust the size of the circle
              backgroundColor: Colors.blueGrey,
              child: Icon(Icons.person, size: 50.0, color: Colors.white),
            ),
            const SizedBox(height: 20),

            // A more common and flexible approach using ClipOval.
            // This is ideal for using a specific image.
            ClipOval(
              child: Image.asset(
                'assets/bnb.png', // Replace with the path to your image asset
                width:
                    120.0, // Set the same width and height to make it a circle
                height: 120.0,
                fit: BoxFit.cover, // Ensure the image covers the entire circle
              ),
            ),
            const SizedBox(height: 20),

            // You can also use a ClipOval with a network image.
            // This example uses a placeholder image URL.
            ClipOval(
              child: Image.network(
                'https://placehold.co/120x120/orange/white?text=User',
                width: 120.0,
                height: 120.0,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback widget in case the image fails to load
                  return Container(
                    width: 120.0,
                    height: 120.0,
                    color: Colors.grey,
                    child: const Icon(Icons.error, color: Colors.white),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
