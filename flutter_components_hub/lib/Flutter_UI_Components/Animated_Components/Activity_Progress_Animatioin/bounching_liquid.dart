import 'dart:math' as math;

import 'package:flutter/material.dart';

/// A unique and smooth activity indicator that creates a pulsating,
/// liquid-like shape.
///
/// This widget uses a CustomPainter to draw a continuously deforming blob,
/// creating a mesmerizing and organic loading animation.
class BouncingLiquidAnimation extends StatefulWidget {
  const BouncingLiquidAnimation({
    super.key,
    this.size = 40.0,
    this.color = Colors.blue,
    this.animationDuration = const Duration(seconds: 2),
  });

  /// The size of the animation container (the total area).
  final double size;

  /// The color of the liquid shape.
  final Color color;

  /// The total duration for one cycle of the animation.
  final Duration animationDuration;

  @override
  State<BouncingLiquidAnimation> createState() =>
      _BouncingLiquidAnimationState();
}

class _BouncingLiquidAnimationState extends State<BouncingLiquidAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // The controller drives the animation and repeats indefinitely.
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _LiquidPainter(
              animationValue: _controller.value,
              color: widget.color,
            ),
          );
        },
      ),
    );
  }
}

/// A custom painter that draws a deforming, liquid-like shape.
class _LiquidPainter extends CustomPainter {
  final double animationValue;
  final Color color;

  _LiquidPainter({required this.animationValue, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    // The paint object to fill the shape.
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // The path object that defines the shape.
    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = size.width / 2;

    // We'll create a smooth shape by using a series of points around a circle
    // and deforming their positions based on the animation value.
    final pointCount = 60;
    for (int i = 0; i <= pointCount; i++) {
      final angle = (i / pointCount) * 2 * math.pi;

      // We use a sine wave to create the deformation. The number 4 here
      // controls how many "waves" are on the blob.
      final deformation = math.sin((angle + animationValue * 2 * math.pi) * 4);

      // Calculate a dynamic radius based on the sine wave and animation value.
      final radius = maxRadius * (1.0 + 0.1 * deformation);

      final x = center.dx + radius * math.cos(angle);
      final y = center.dy + radius * math.sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _LiquidPainter oldDelegate) {
    // Repaint only when the animation value changes.
    return oldDelegate.animationValue != animationValue;
  }
}
