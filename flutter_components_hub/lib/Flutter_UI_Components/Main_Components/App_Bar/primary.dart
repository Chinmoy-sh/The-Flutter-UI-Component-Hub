// A reusable custom app bar widget.
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // A title for the app bar.
  final String title;
  // An optional leading widget, like a back button.
  final Widget? leading;
  // Optional actions, like a search or a menu button.
  // Optional actions, like a search or a menu button.
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0, // No shadow for a clean look
      leading: leading,
      actions: actions,
    );
  }
}
