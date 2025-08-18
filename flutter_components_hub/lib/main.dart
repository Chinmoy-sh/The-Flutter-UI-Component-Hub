import 'package:flutter/material.dart';
import 'package:flutter_components_hub/Flutter_UI_Components/Main_Components/Buttons/social_icon_buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Title')),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialIconButton(
                platform: SocialPlatform.google,
                onPressed: () {},
              ),
              SizedBox(width: 16.0),
              SocialIconButton(
                platform: SocialPlatform.facebook,
                onPressed: () {},
              ),
              SizedBox(width: 16.0),

              SocialIconButton(
                platform: SocialPlatform.twitter,
                onPressed: () {},
              ),
              SizedBox(width: 16.0),

              SocialIconButton(
                platform: SocialPlatform.instagram,
                onPressed: () {},
              ),
              SizedBox(width: 16.0),

              SocialIconButton(
                platform: SocialPlatform.linkedin,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
