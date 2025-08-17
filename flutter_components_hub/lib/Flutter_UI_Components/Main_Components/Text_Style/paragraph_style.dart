import 'package:flutter/material.dart';

class BodyText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  const BodyText(
    this.text, {
    super.key,
    this.color = Colors.black87,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(fontSize: 16, color: color, fontWeight: fontWeight),
    );
  }
}
