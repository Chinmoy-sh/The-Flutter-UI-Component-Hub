import 'package:flutter/material.dart';
import 'dart:math' as math;

/// A customizable, animated menu icon that rotates smoothly on tap.
///
/// This widget is perfect for use in an AppBar to indicate a drawer or
/// a menu is being opened or closed.
class AnimatedMenuIcon extends StatefulWidget {
  const AnimatedMenuIcon({
    super.key,
    this.icon = Icons.menu,
    this.animationDuration = const Duration(milliseconds: 300),
    this.iconColor = Colors.white,
    this.onPressed,
  });

  /// The icon to display. Defaults to Icons.menu.
  final IconData icon;

  /// The duration of the rotation animation.
  final Duration animationDuration;

  /// The color of the icon.
  final Color iconColor;

  /// An optional callback function to execute when the icon is pressed.
  final VoidCallback? onPressed;

  @override
  State<AnimatedMenuIcon> createState() => _AnimatedMenuIconState();
}

class _AnimatedMenuIconState extends State<AnimatedMenuIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    // Creates a rotation animation from 0 to 180 degrees (pi radians).
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: math.pi,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Toggles the animation between its forward and reverse states.
  void _toggleAnimation() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // First, toggle the internal animation.
        _toggleAnimation();
        // Then, call the user's provided callback.
        widget.onPressed?.call();
      },
      icon: AnimatedBuilder(
        animation: _rotationAnimation,
        builder: (context, child) {
          // Applies the rotation to the icon.
          return Transform.rotate(
            angle: _rotationAnimation.value,
            child: Icon(widget.icon, color: widget.iconColor),
          );
        },
      ),
    );
  }
}
