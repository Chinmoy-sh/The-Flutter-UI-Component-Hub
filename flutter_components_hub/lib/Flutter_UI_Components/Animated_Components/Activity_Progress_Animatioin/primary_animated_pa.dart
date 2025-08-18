import 'package:flutter/material.dart';

class SpinningRingLoader extends StatefulWidget {
  final double size;
  final double strokeWidth;
  final Color color;
  final Duration animationDuration;

  const SpinningRingLoader({
    super.key,
    this.size = 25.0,
    this.strokeWidth = 4.0,
    this.color = Colors.blue,
    this.animationDuration = const Duration(seconds: 2),
  });

  @override
  State<SpinningRingLoader> createState() => _SpinningRingLoaderState();
}

class _SpinningRingLoaderState extends State<SpinningRingLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
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
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _controller.value * 2.0 * 3.141592653589793,
          child: SizedBox(
            width: widget.size,
            height: widget.size,
            child: CircularProgressIndicator(
              strokeWidth: widget.strokeWidth,
              valueColor: AlwaysStoppedAnimation<Color>(widget.color),
              backgroundColor: Colors.transparent,
            ),
          ),
        );
      },
    );
  }
}
