// This is a complete, self-contained Flutter application demonstrating
// a reusable icon button that animates a rotating transition.

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
//       title: 'Rotating Animated Button Demo',
//       theme: ThemeData(
//         // Set a dark theme for a better contrast with the icons.
//         primarySwatch: Colors.deepPurple,
//         brightness: Brightness.dark,
//         useMaterial3: true,
//       ),
//       home: const HomePage(),
//     );
//   }
// }

// A reusable StatefulWidget for an animated icon button with a rotation effect.
class AnimatedIconButton extends StatefulWidget {
  // The first icon to display.
  final IconData firstIcon;
  // The second icon to transition to.
  final IconData secondIcon;
  // The size of the icon.
  final double iconSize;
  // Optional callback for when the button is pressed.
  final VoidCallback? onPressed;
  // The color of the first icon.
  final Color firstIconColor;
  // The color of the second icon.
  final Color secondIconColor;

  const AnimatedIconButton({
    super.key,
    required this.firstIcon,
    required this.secondIcon,
    this.iconSize = 80.0,
    this.onPressed,
    this.firstIconColor = Colors.red,
    this.secondIconColor = Colors.grey,
  });

  @override
  State<AnimatedIconButton> createState() => _AnimatedIconButtonState();
}

// This is a State class that holds the logic for the AnimatedIconButton.
class _AnimatedIconButtonState extends State<AnimatedIconButton>
    with SingleTickerProviderStateMixin {
  // A boolean to toggle the state of the icon.
  bool _isFirstIcon = true;

  // An AnimationController is used to control the animation.
  late AnimationController _controller;

  // Initialize the AnimationController and other state.
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300), // Duration of the rotation.
    );
  }

  // Dispose of the controller to free up resources.
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // A helper method to change the state and trigger the animation.
  void _toggleIcon() {
    setState(() {
      _isFirstIcon = !_isFirstIcon;
    });

    // Animate the rotation forward or reverse depending on the state.
    if (_isFirstIcon) {
      _controller.reverse();
    } else {
      _controller.forward();
    }

    // Call the user-provided callback if it exists.
    widget.onPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _toggleIcon,
      iconSize: widget.iconSize,
      icon: AnimatedSwitcher(
        // The duration for the transition between icons.
        duration: const Duration(milliseconds: 300),
        // The transition effect. We're using a rotation transition here.
        // We wrap the child in RotationTransition to apply the rotation animation.
        transitionBuilder: (Widget child, Animation<double> animation) {
          return RotationTransition(turns: animation, child: child);
        },
        // The key is crucial for AnimatedSwitcher to work correctly.
        child: _isFirstIcon
            ? Icon(
                widget.firstIcon,
                key: const ValueKey<int>(1),
                color: widget.firstIconColor,
              )
            : Icon(
                widget.secondIcon,
                key: const ValueKey<int>(2),
                color: widget.secondIconColor,
              ),
      ),
    );
  }
}

// The main page that demonstrates how to use the new widget.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotating Animated Icon Button'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('A favorite button', style: TextStyle(fontSize: 18)),
            // First instance of the reusable widget.
            AnimatedIconButton(
              firstIcon: Icons.favorite,
              secondIcon: Icons.favorite_border,
              onPressed: () {
                // This callback runs every time the button is pressed.
              },
            ),
            const SizedBox(height: 40),
            const Text('A play/pause button', style: TextStyle(fontSize: 18)),
            // Second instance of the reusable widget with different icons.
            AnimatedIconButton(
              firstIcon: Icons.pause,
              secondIcon: Icons.play_arrow,
              firstIconColor: Colors.deepPurple,
              secondIconColor: Colors.lightGreen,
            ),
          ],
        ),
      ),
    );
  }
}
