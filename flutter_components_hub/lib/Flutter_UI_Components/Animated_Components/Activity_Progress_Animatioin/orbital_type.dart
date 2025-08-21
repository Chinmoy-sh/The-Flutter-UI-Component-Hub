import 'dart:math';
import 'package:flutter/material.dart';

/// A unique and smooth activity indicator with a circular orbit effect.
///
/// This widget uses multiple animated dots that orbit a central point,
/// creating a visually engaging loading or progress state.
class CircularOrbitAnimation extends StatefulWidget {
  const CircularOrbitAnimation({
    super.key,
    this.size = 100.0,
    this.centerDotColor = Colors.blue,
    this.orbiterColor = Colors.blue,
    this.orbiterCount = 3,
    this.animationDuration = const Duration(seconds: 4),
  });

  /// The size of the animation container (the total area).
  final double size;

  /// The color of the central dot.
  final Color centerDotColor;

  /// The color of the orbiting dots.
  final Color orbiterColor;

  /// The number of orbiting dots to display.
  final int orbiterCount;

  /// The total duration for one cycle of the animation.
  final Duration animationDuration;

  @override
  State<CircularOrbitAnimation> createState() => _CircularOrbitAnimationState();
}

class _CircularOrbitAnimationState extends State<CircularOrbitAnimation>
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
          return Stack(
            alignment: Alignment.center,
            children: [
              // The central dot in the middle of the animation.
              Container(
                width: widget.size * 0.1,
                height: widget.size * 0.1,
                decoration: BoxDecoration(
                  color: widget.centerDotColor,
                  shape: BoxShape.circle,
                ),
              ),

              // The orbiting dots. We use a List.generate to create them.
              ...List.generate(widget.orbiterCount, (index) {
                // Calculate the individual animation delay for each orbiter.
                final offset = index * (1.0 / widget.orbiterCount);
                // The angle is based on the animation value and the offset.
                final angle = (2 * pi * (_controller.value + offset));

                // We use sine and cosine to create a circular path.
                final x =
                    (widget.size / 2 - 10) *
                    0.6 *
                    (index + 1) *
                    0.25 *
                    cos(angle);
                final y =
                    (widget.size / 2 - 10) *
                    0.6 *
                    (index + 1) *
                    0.25 *
                    sin(angle);

                return Transform.translate(
                  offset: Offset(x, y),
                  child: Container(
                    width: widget.size * 0.08,
                    height: widget.size * 0.08,
                    decoration: BoxDecoration(
                      color: widget.orbiterColor.withValues(
                        alpha: 1.0 - index * 0.15,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
