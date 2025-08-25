// This is a complete, self-contained Flutter application demonstrating
// an animated icon button with a smooth transition.

import 'package:flutter/material.dart';

// A reusable StatefulWidget for an animated icon button.
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

class _AnimatedIconButtonState extends State<AnimatedIconButton> {
  // A boolean to toggle the state of the icon.
  bool _isFirstIcon = true;

  // A helper method to change the state and trigger the animation.
  void _toggleIcon() {
    setState(() {
      _isFirstIcon = !_isFirstIcon;
    });
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
        // The transition effect. We're using a fade transition here.
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        // The key is crucial for AnimatedSwitcher to work correctly.
        // It tells the widget whether the child has changed.
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
        title: const Text('Reusable Animated Icon Button'),
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
