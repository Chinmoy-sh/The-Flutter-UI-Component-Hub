import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? color;
  final double? size;
  final double? splashRadius;

  const CustomIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.color = Colors.black,
    this.size = 24.0,
    this.splashRadius = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
      color: color,
      iconSize: size,
      splashRadius: splashRadius,
    );
  }
}
