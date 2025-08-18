import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum SocialPlatform { google, facebook, twitter, instagram, linkedin }

class SocialIconButton extends StatelessWidget {
  final SocialPlatform platform;
  final VoidCallback? onPressed;
  final double size;

  const SocialIconButton({
    super.key,
    required this.platform,
    this.onPressed,
    this.size = 45.0,
  });

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    Color? buttonColor;
    Gradient? gradient;
    Color iconColor = Colors.white;

    switch (platform) {
      case SocialPlatform.google:
        iconData = FontAwesomeIcons.google;
        buttonColor = Colors.red.shade400;
        // gradient = const LinearGradient(
        //   colors: [
        //     Color(0xFF4285F4),
        //     Color(0xFFEA4335),
        //     Color(0xFFFBBC05),
        //     Color(0xFF34A853),
        //   ],
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        // );
        break;
      case SocialPlatform.facebook:
        iconData = FontAwesomeIcons.facebookF;
        buttonColor = const Color(0xFF1877F2);
        break;
      case SocialPlatform.twitter:
        iconData = FontAwesomeIcons.twitter;
        buttonColor = const Color(0xFF1DA1F2);
        break;
      case SocialPlatform.instagram:
        iconData = FontAwesomeIcons.instagram;
        buttonColor = Colors.pink;
        // gradient = const LinearGradient(
        //   colors: [
        //     Color(0xFF515BD4),
        //     Color(0xFF8134AF),
        //     Color(0xFFDD2A7B),
        //     Color(0xFFFEDA77),
        //     Color(0xFFF58529),
        //   ],
        //   begin: Alignment.bottomLeft,
        //   end: Alignment.topRight,
        // );
        break;
      case SocialPlatform.linkedin:
        iconData = FontAwesomeIcons.linkedinIn;
        buttonColor = const Color(0xFF0A66C2);
        break;
    }

    return Material(
      color: buttonColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: buttonColor,
            gradient: gradient,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.12),
                blurRadius: 7,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Center(
            child: SizedBox(
              width: size * 0.5,
              height: size * 0.5,
              child: Icon(iconData, color: iconColor, size: size * 0.5),
            ),
          ),
        ),
      ),
    );
  }
}
