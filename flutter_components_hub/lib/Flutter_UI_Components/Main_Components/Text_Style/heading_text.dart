import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;

  const HeadingText(
    this.text, {
    super.key,
    this.color = Colors.black,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color),
    );
  }
}
