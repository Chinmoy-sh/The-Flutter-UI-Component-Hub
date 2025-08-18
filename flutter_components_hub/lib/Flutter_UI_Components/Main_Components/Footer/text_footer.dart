import 'package:flutter/material.dart';

class LegalFooter extends StatelessWidget {
  const LegalFooter({
    super.key,
    this.textColor = Colors.grey,
    this.fontSize = 12.0,
  });

  /// The color of the text.
  final Color textColor;

  /// The font size for the text.
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(color: textColor, fontSize: fontSize),
            children: <TextSpan>[
              const TextSpan(text: 'By using this app, you agree to our '),
              TextSpan(
                text: 'Terms of Use',
                style: TextStyle(
                  color: Colors.blue[700],
                  fontWeight: FontWeight.bold,
                ),
                // You can add a tap recognizer here for navigation
                // For example: TapGestureRecognizer()..onTap = () => print('Terms of Use tapped!'),
              ),
              const TextSpan(text: ' and '),
              TextSpan(
                text: 'Privacy Policy',
                style: TextStyle(
                  color: Colors.blue[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(text: '.'),
            ],
          ),
        ),
      ),
    );
  }
}
