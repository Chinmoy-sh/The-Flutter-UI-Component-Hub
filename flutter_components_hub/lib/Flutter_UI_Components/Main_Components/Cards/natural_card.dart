// This is a complete, self-contained Flutter app that replicates
// the design of the ad card provided.

import 'package:flutter/material.dart';

// The main entry point of the application.
// void main() {
//   runApp(const AdCardApp());
// }

// // The root widget for the application.
// class AdCardApp extends StatelessWidget {
//   const AdCardApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Define the primary color palette for the app to match the ad card.
//     const Color cardBackgroundColor = Color(0xFFC7F95A);
//     const Color darkColor = Color(0xFF0F2624);

//     return MaterialApp(
//       title: 'Ad Card Replication',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: darkColor,
//           brightness: Brightness.light,
//           primary: darkColor,
//         ),
//         useMaterial3: true,
//       ),
//       // The home page where the ad card will be displayed.
//       home: Scaffold(
//         backgroundColor: cardBackgroundColor,
//         body: Center(
//           child: Padding(padding: const EdgeInsets.all(20.0), child: AdCard()),
//         ),
//       ),
//     );
//   }
// }

// A widget that builds the ad card UI based on the provided image.
class AdCard extends StatelessWidget {
  const AdCard({super.key});

  @override
  Widget build(BuildContext context) {
    const Color darkColor = Color(0xFF0F2624);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: const Color(0xFFD4FF96),
        borderRadius: BorderRadius.circular(20),
        // A subtle box shadow to give the card a sense of depth.
        boxShadow: [
          BoxShadow(
            color: darkColor.withValues(alpha: 0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Company logo/name at the top left.
          const Text(
            'Acme',
            style: TextStyle(
              color: darkColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 48),

          // The main headline.
          const Text(
            'Make the emissions\nmeasurable.',
            style: TextStyle(
              color: darkColor,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 16),

          // The body text.
          const Text(
            'Acme helps global orgs hit their climate targets. Built for scale, built for action.',
            style: TextStyle(color: darkColor, fontSize: 16, height: 1.4),
          ),
          const SizedBox(height: 32),

          // The call-to-action button and arrow.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // The button container.
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: darkColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  children: [
                    // Bullet point icon.
                    Icon(Icons.circle, color: Colors.white, size: 8),
                    SizedBox(width: 8),
                    Text(
                      'Explore the Operating Model',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // The arrow icon to the right of the button.
              const Icon(Icons.arrow_forward, color: darkColor, size: 24),
            ],
          ),
        ],
      ),
    );
  }
}
