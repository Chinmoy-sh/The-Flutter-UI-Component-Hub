import 'package:flutter/material.dart';

class PulsingLoader extends StatefulWidget {
  final Color color;
  final double size;
  final Duration animationDuration;

  const PulsingLoader({
    super.key,
    this.color = Colors.blue,
    this.size = 50.0,
    this.animationDuration = const Duration(seconds: 1),
  });

  @override
  // ignore: library_private_types_in_public_api
  _PulsingLoaderState createState() => _PulsingLoaderState();
}

class _PulsingLoaderState extends State<PulsingLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: widget.color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: widget.color.withOpacity(0.5),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
      ),
    );
  }
}
