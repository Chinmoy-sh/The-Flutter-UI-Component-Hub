import 'package:flutter/material.dart';

/// A sleek and unique activity indicator that creates a pulsating wave effect.
///
/// This widget uses multiple animated circles that expand and fade,
/// creating a continuous, smooth wave animation.
class PulsatingWaveAnimation extends StatefulWidget {
  const PulsatingWaveAnimation({
    super.key,
    this.size = 50.0,
    this.color = Colors.blue,
    this.waveCount = 3,
    this.animationDuration = const Duration(seconds: 2),
  });

  /// The size of the animation container (the total area).
  final double size;

  /// The color of the pulsating waves.
  final Color color;

  /// The number of waves to display. More waves means a longer, more
  /// complex animation trail.
  final int waveCount;

  /// The total duration for one cycle of the animation.
  final Duration animationDuration;

  @override
  State<PulsatingWaveAnimation> createState() => _PulsatingWaveAnimationState();
}

class _PulsatingWaveAnimationState extends State<PulsatingWaveAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<Animation<double>> _scaleAnimations;
  late final List<Animation<double>> _opacityAnimations;

  @override
  void initState() {
    super.initState();
    // The controller drives all animations. We'll set it to repeat forever.
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    )..repeat();

    // Initialize the lists of animations.
    _scaleAnimations = [];
    _opacityAnimations = [];

    // The core of the wave effect is to stagger the animations for each wave.
    for (int i = 0; i < widget.waveCount; i++) {
      final interval = 1.0 / widget.waveCount;
      final begin = i * interval;
      final end = begin + (1.0 - begin); // The animation should go to the end.

      // Scale animation for each wave. It grows from 0.0 to 1.0.
      _scaleAnimations.add(
        Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(begin, end, curve: Curves.easeOut),
          ),
        ),
      );

      // Opacity animation for each wave. It fades in and then out.
      // We want the wave to be fully visible at the start and fade as it expands.
      _opacityAnimations.add(
        Tween<double>(begin: 1.0, end: 0.0).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(begin, end, curve: Curves.easeIn),
          ),
        ),
      );
    }
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
          // Use a Stack to layer the waves on top of each other.
          return Stack(
            alignment: Alignment.center,
            children: List.generate(widget.waveCount, (index) {
              // Get the animated values for the current wave.
              final scaleValue = _scaleAnimations[index].value;
              final opacityValue = _opacityAnimations[index].value;

              // Use Transform.scale to apply the animation.
              // We check if the scale is greater than 0 to avoid drawing
              // containers that are not visible and causing performance issues.
              if (scaleValue > 0) {
                return Opacity(
                  opacity: opacityValue,
                  child: Transform.scale(
                    scale: scaleValue,
                    child: Container(
                      width: widget.size,
                      height: widget.size,
                      decoration: BoxDecoration(
                        color: widget.color,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink(); // A placeholder when the wave isn't visible.
            }),
          );
        },
      ),
    );
  }
}
