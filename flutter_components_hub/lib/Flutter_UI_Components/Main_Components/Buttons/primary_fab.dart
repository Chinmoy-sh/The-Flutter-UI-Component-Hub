import 'package:flutter/material.dart';

/// A customizable floating action button widget with a smooth tap animation.
class CustomFloatingActionButton extends StatefulWidget {
  const CustomFloatingActionButton({
    super.key,
    required this.onPressed,
    this.icon = Icons.add,
    this.backgroundColor = Colors.blue,
    this.iconColor = Colors.white,
  });

  /// The callback that is called when the button is pressed.
  final VoidCallback onPressed;

  /// The icon to display on the button.
  final IconData icon;

  /// The background color of the button.
  final Color backgroundColor;

  /// The color of the icon.
  final Color iconColor;

  @override
  State<CustomFloatingActionButton> createState() =>
      _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState extends State<CustomFloatingActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      lowerBound: 0.0,
      upperBound: 0.1,
    );

    _scaleAnimation = Tween(
      begin: 1.0,
      end: 0.9,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: widget.backgroundColor,
          shape: const CircleBorder(),
          elevation: 8.0,
          child: Icon(widget.icon, color: widget.iconColor),
        ),
      ),
    );
  }
}
