// This is a complete, self-contained Flutter application
// that demonstrates a reusable and robust circular profile avatar widget.

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
//       title: 'Improved Avatar Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         // Using a dark theme to make the shadows more visible.
//         brightness: Brightness.dark,
//         scaffoldBackgroundColor: const Color(0xFF1E1E1E),
//       ),
//       home: const HomePage(),
//     );
//   }
// }

// A reusable widget for a circular profile avatar.
// It can handle both network images and a fallback icon.
class ProfileAvatar extends StatelessWidget {
  // A nullable string for the image URL.
  final String? imageUrl;
  final double radius;
  final double borderWidth;
  final Color borderColor;

  const ProfileAvatar({
    super.key,
    this.imageUrl,
    this.radius = 60.0,
    this.borderWidth = 3.0,
    this.borderColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    // The Container widget is used to apply a border and a shadow.
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // The BoxShadow property creates a soft drop shadow.
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      // A ClipOval is used to ensure the child is perfectly circular.
      child: ClipOval(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: borderWidth),
            shape: BoxShape.circle,
          ),
          // We use a ternary operator to decide which widget to display.
          // If imageUrl is not null and not empty, we display the image.
          // Otherwise, we show a fallback CircleAvatar with an icon.
          child: (imageUrl != null && imageUrl!.isNotEmpty)
              ? Image.network(
                  imageUrl!,
                  fit: BoxFit.cover,
                  // The errorBuilder handles cases where the image fails to load.
                  // It returns a fallback widget (our CircleAvatar).
                  errorBuilder: (context, error, stackTrace) {
                    return _buildFallbackAvatar();
                  },
                  // The loadingBuilder can show a spinner while the image loads.
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                )
              : _buildFallbackAvatar(),
        ),
      ),
    );
  }

  // A helper method to build the default fallback avatar.
  Widget _buildFallbackAvatar() {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.blueGrey.shade700,
      child: Icon(Icons.person, size: radius * 0.8, color: Colors.white70),
    );
  }
}

// A simple home page to demonstrate the ProfileAvatar widget.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Example network image URL.
  final String exampleImageUrl =
      'https://placehold.co/200x200/4CAF50/white?text=User';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Profiles'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('User 1 (with image)'),
            const SizedBox(height: 10),
            // Example of a working avatar.
            ProfileAvatar(imageUrl: exampleImageUrl),
            const SizedBox(height: 40),
            const Text('User 2 (with placeholder)'),
            const SizedBox(height: 10),
            // Example showing the fallback (placeholder) avatar.
            const ProfileAvatar(
              imageUrl: null, // No image provided.
            ),
            const SizedBox(height: 40),
            const Text('User 3 (with broken link)'),
            const SizedBox(height: 10),
            // Example showing the error builder in action.
            const ProfileAvatar(
              imageUrl: 'https://this-is-a-broken-link.com/image.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
