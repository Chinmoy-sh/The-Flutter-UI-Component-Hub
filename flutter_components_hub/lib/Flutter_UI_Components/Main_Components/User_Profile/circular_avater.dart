import 'package:flutter/material.dart';

class CircularAvatar extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final ImageProvider? placeholder;

  const CircularAvatar({
    super.key,
    required this.imageUrl,
    this.radius = 24.0,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage(imageUrl),
      onBackgroundImageError: (Object exception, StackTrace? stackTrace) {
        debugPrint('Error loading image: $exception');
      },
      backgroundColor: Colors.grey[200],
      child: placeholder != null
          ? Image(image: placeholder!, fit: BoxFit.cover)
          : null,
    );
  }
}
