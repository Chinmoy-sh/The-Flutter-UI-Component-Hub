// This is a complete, self-contained Flutter app that creates
// a nice-looking and eye-catching custom ad card.

import 'package:flutter/material.dart';

// // The main entry point of the application.
// void main() {
//   runApp(const AdCardApp());
// }

// // The root widget for the application.
// class AdCardApp extends StatelessWidget {
//   const AdCardApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Ad Card Demo',
//       theme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
//       // The home page where the ad card will be displayed.
//       home: Scaffold(
//         backgroundColor: Colors.grey[900],
//         body: Center(
//           child: Padding(padding: const EdgeInsets.all(24.0), child: AdCard()),
//         ),
//       ),
//     );
//   }
// }

// A stateful widget to manage the animation of the ad card.
class AdCard extends StatefulWidget {
  const AdCard({super.key});

  @override
  State<AdCard> createState() => _AdCardState();
}

class _AdCardState extends State<AdCard> with SingleTickerProviderStateMixin {
  // An animation controller to manage the fade-in effect.
  late final AnimationController _animationController;
  // A tween that interpolates the opacity from 0.0 to 1.0.
  late final Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _fadeInAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);

    // Starts the fade-in animation when the widget is first built.
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // We wrap the card in a FadeTransition to apply the animation.
    return FadeTransition(
      opacity: _fadeInAnimation,
      child: Container(
        // Set the size of the container to define the card's dimensions.
        width: 350,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // A subtle box shadow to give the card a floating effect.
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 20,
              spreadRadius: 5,
              offset: const Offset(0, 10),
            ),
          ],
          // The linear gradient background for an eye-catching look.
          gradient: const LinearGradient(
            colors: [Color(0xFF6B58FB), Color(0xFF5090F8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.star_rounded, color: Colors.white, size: 28),
                  SizedBox(width: 12),
                  // A prominent headline to grab attention.
                  Expanded(
                    child: Text(
                      'Upgrade to Pro!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Text(
                'Unlock all premium features and create unlimited projects.',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 20),
              // The call-to-action button.
              // We use InkWell for a ripple effect on tap.
              InkWell(
                onTap: () {
                  // Handle the ad click here.
                  debugPrint('Ad card tapped!');
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    'Learn More',
                    style: TextStyle(
                      color: Color(0xFF6B58FB),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
