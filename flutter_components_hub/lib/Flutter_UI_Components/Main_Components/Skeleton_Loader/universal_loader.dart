import 'package:flutter/material.dart';

/// A universal, customizable skeleton loader with a clean, smooth shimmer effect.
///
/// This widget provides a full-screen shimmer effect over a set of placeholders,
/// making it a great generic loader for any type of app.
class UniversalSkeletonLoader extends StatefulWidget {
  const UniversalSkeletonLoader({
    super.key,
    required this.child,
    this.baseColor,
    this.highlightColor,
  });

  /// The child widget that contains the skeleton placeholders.
  final Widget child;

  /// The base color of the skeleton.
  final Color? baseColor;

  /// The highlight color of the shimmer effect.
  final Color? highlightColor;

  @override
  State<UniversalSkeletonLoader> createState() =>
      _UniversalSkeletonLoaderState();
}

class _UniversalSkeletonLoaderState extends State<UniversalSkeletonLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _animation = Tween<double>(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final baseColor = widget.baseColor ?? Colors.grey[300]!;
    final highlightColor = widget.highlightColor ?? Colors.grey[100]!;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[baseColor, highlightColor, baseColor],
              stops: <double>[
                _animation.value - 0.5,
                _animation.value,
                _animation.value + 0.5,
              ],
            ).createShader(bounds);
          },
          child: widget.child,
        );
      },
      child: widget.child,
    );
  }
}

/// A simple rectangular placeholder for the skeleton loader.
class SkeletonPlaceholder extends StatelessWidget {
  const SkeletonPlaceholder({
    super.key,
    this.width,
    this.height = 10.0,
    this.borderRadius = 4.0,
  });

  final double? width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white, // This color will be masked by the shader.
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}
