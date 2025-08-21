import 'package:flutter/material.dart';

/// A clean and fluid activity indicator that creates a pulsating circle effect.
///
/// This widget uses a CustomPainter to draw a series of expanding rings that
/// fade out, creating a visual "pulse" from the center.
class PulsatingCircleAnimation extends StatefulWidget {
  const PulsatingCircleAnimation({
    super.key,
    this.size = 50.0,
    this.ringColor = Colors.blue,
    this.ringCount = 3,
    this.animationDuration = const Duration(seconds: 2),
  });

  /// The size of the animation container (the total area).
  final double size;

  /// The color of the pulsating rings.
  final Color ringColor;

  /// The number of rings to display at any given time.
  final int ringCount;

  /// The total duration for one cycle of the animation.
  final Duration animationDuration;

  @override
  State<PulsatingCircleAnimation> createState() =>
      _PulsatingCircleAnimationState();
}

class _PulsatingCircleAnimationState extends State<PulsatingCircleAnimation>
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
            painter: _PulsatingCirclePainter(
              animationValue: _controller.value,
              size: widget.size,
              ringColor: widget.ringColor,
              ringCount: widget.ringCount,
            ),
          );
        },
      ),
    );
  }
}

/// A custom painter that draws a series of pulsating rings.
class _PulsatingCirclePainter extends CustomPainter {
  final double animationValue;
  final double size;
  final Color ringColor;
  final int ringCount;

  _PulsatingCirclePainter({
    required this.animationValue,
    required this.size,
    required this.ringColor,
    required this.ringCount,
  });

  @override
  void paint(Canvas canvas, Size canvasSize) {
    // The paint object for drawing the rings.
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    // We'll draw each ring based on its position in the animation cycle.
    for (int i = 0; i < ringCount; i++) {
      // Calculate the progress for each ring. The delay creates the wave effect.
      final ringProgress = (animationValue + i / ringCount) % 1.0;

      // Calculate the radius of the ring. It expands from 0 to max size.
      final radius = (size / 2) * ringProgress;

      // Calculate the opacity, fading from 1.0 to 0.0 as it expands.
      final opacity = 1.0 - ringProgress;

      // Set the color with the calculated opacity.
      paint.color = ringColor.withValues(alpha: opacity);

      // Draw the circle on the canvas.
      canvas.drawCircle(Offset(size / 2, size / 2), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _PulsatingCirclePainter oldDelegate) {
    // Repaint on every frame to update the animation.
    return oldDelegate.animationValue != animationValue;
  }
}
