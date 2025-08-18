import 'package:flutter/material.dart';

class FadingDotLoader extends StatefulWidget {
  final Color dotColor;
  final double dotSize;
  final int dotCount;
  final double spacing;
  final Duration animationDuration;

  const FadingDotLoader({
    super.key,
    this.dotColor = Colors.blue,
    this.dotSize = 10.0,
    this.dotCount = 3,
    this.spacing = 3.0,
    this.animationDuration = const Duration(
      milliseconds: 1800,
    ), // Slower animation
  });

  @override
  State<FadingDotLoader> createState() => _FadingDotLoaderState();
}

class _FadingDotLoaderState extends State<FadingDotLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    )..repeat();

    _animations = List.generate(widget.dotCount, (index) {
      final double begin = (index / widget.dotCount);
      final double end = ((index + 1) / widget.dotCount);
      return Tween(begin: 0.2, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(begin, end, curve: Curves.easeIn),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.dotCount, (index) {
        return FadeTransition(
          opacity: _animations[index],
          child: Container(
            width: widget.dotSize,
            height: widget.dotSize,
            margin: EdgeInsets.symmetric(horizontal: widget.spacing),
            decoration: BoxDecoration(
              color: widget.dotColor,
              shape: BoxShape.circle,
            ),
          ),
        );
      }),
    );
  }
}
