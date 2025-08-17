import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color inactiveColor;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor = Colors.blueAccent,
    this.inactiveColor = Colors.grey,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: widget.value,
      onChanged: widget.onChanged,
      activeColor: widget.activeColor,
      // ignore: deprecated_member_use
      inactiveTrackColor: widget.inactiveColor.withOpacity(0.5),
      inactiveThumbColor: widget.inactiveColor,
    );
  }
}

// Use of the CustomSwitch
// class SettingsPage extends StatefulWidget {
//   const SettingsPage({Key? key}) : super(key: key);

//   @override
//   _SettingsPageState createState() => _SettingsPageState();
// }

// class _SettingsPageState extends State<SettingsPage> {
//   bool _notificationsEnabled = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Settings')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text('Enable Notifications'),
//             CustomSwitch(
//               value: _notificationsEnabled,
//               onChanged: (bool newValue) {
//                 setState(() {
//                   _notificationsEnabled = newValue;
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
