// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosStyleTextField extends StatelessWidget {
  final String placeholder;
  final TextEditingController? controller;
  final bool obscureText;

  const IosStyleTextField({
    super.key,
    required this.placeholder,
    this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120, // Setting the width here
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: CupertinoColors.extraLightBackgroundGray,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: placeholder,
            hintStyle: const TextStyle(color: CupertinoColors.placeholderText),
          ),
        ),
      ),
    );
  }
}
