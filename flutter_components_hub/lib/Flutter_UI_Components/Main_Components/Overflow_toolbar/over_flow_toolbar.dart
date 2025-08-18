import 'package:flutter/material.dart';

/// A customizable overflow toolbar with a three-dots icon and smooth menu.
///
/// This widget provides a sleek way to show a dropdown menu of options.
/// It's designed to be placed in an AppBar or any part of your UI.
class CustomOverflowToolbar extends StatelessWidget {
  const CustomOverflowToolbar({
    super.key,
    required this.menuItems,
    this.iconColor = Colors.white,
  });

  /// A list of menu items to display in the overflow menu.
  /// Each item is a Map with 'text' and 'onTap' keys.
  final List<Map<String, dynamic>> menuItems;

  /// The color of the three-dots icon.
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.more_vert, color: iconColor),
      itemBuilder: (BuildContext context) {
        return menuItems.map<PopupMenuItem<String>>((
          Map<String, dynamic> item,
        ) {
          return PopupMenuItem<String>(
            value: item['text'] as String,
            child: Text(item['text'] as String),
          );
        }).toList();
      },
      onSelected: (String value) {
        // Find the corresponding item and execute its onTap function.
        final Map<String, dynamic> selectedItem = menuItems.firstWhere(
          (Map<String, dynamic> item) => item['text'] == value,
        );
        // Ensure onTap is a function before calling it
        if (selectedItem['onTap'] is Function) {
          selectedItem['onTap']();
        }
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 8.0,
    );
  }
}
