import 'dart:math' as math;
import 'package:flutter/material.dart';

/// A unique and smooth activity indicator that creates a kinetic spiral effect.
///
/// This widget uses multiple animated dots that spiral outward from a central
/// point, creating a mesmerizing and dynamic loading animation.
class KineticSpiralAnimation extends StatefulWidget {
  const KineticSpiralAnimation({
    super.key,
    this.size = 50.0,
    this.dotColor = Colors.blue,
    this.dotCount = 20,
    this.animationDuration = const Duration(seconds: 4),
  });

  /// The size of the animation container (the total area).
  final double size;

  /// The color of the spiraling dots.
  final Color dotColor;

  /// The number of dots in the animation. More dots create a denser spiral.
  final int dotCount;

  /// The total duration for one cycle of the animation.
  final Duration animationDuration;

  @override
  State<KineticSpiralAnimation> createState() => _KineticSpiralAnimationState();
}

class _KineticSpiralAnimationState extends State<KineticSpiralAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // The controller drives all animations and repeats indefinitely.
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
      // AnimatedBuilder rebuilds the widget on every animation tick.
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          // Use a Stack to layer the dots on top of each other.
          return Stack(
            alignment: Alignment.center,
            children: List.generate(widget.dotCount, (index) {
              // Calculate the delay for each dot to create the spiral effect.
              final delay = index / widget.dotCount;
              final animationValue = (_controller.value + delay) % 1.0;

              // The radius of the dot's position, increasing as it moves outward.
              final radius = animationValue * (widget.size / 2);

              // The angle of the dot's position, continuously increasing.
              final angle =
                  animationValue *
                  2 *
                  math.pi *
                  3; // 3 full rotations per cycle.

              // Calculate the x and y coordinates using sine and cosine.
              final x = radius * math.cos(angle);
              final y = radius * math.sin(angle);

              // Calculate opacity, fading to 0 as it reaches the edge.
              final opacity = 1.0 - animationValue;

              return Transform.translate(
                offset: Offset(x, y),
                child: Opacity(
                  opacity: opacity,
                  child: Container(
                    width: widget.size * 0.05,
                    height: widget.size * 0.05,
                    decoration: BoxDecoration(
                      color: widget.dotColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
