// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

class IosStyleSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color trackColor;

  const IosStyleSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor = CupertinoColors.systemGreen,
    this.trackColor = CupertinoColors.systemGrey4,
  });

  @override
  // ignore: library_private_types_in_public_api
  _IosStyleSwitchState createState() => _IosStyleSwitchState();
}

class _IosStyleSwitchState extends State<IosStyleSwitch> {
  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: widget.value,
      onChanged: widget.onChanged,
      activeTrackColor: widget.activeColor,
      inactiveTrackColor: widget.trackColor,
    );
  }
}

// Usage of the IosStyleSwitch
// class SettingsPage extends StatefulWidget {
//   const SettingsPage({Key? key}) : super(key: key);

//   @override
//   _SettingsPageState createState() => _SettingsPageState();
// }

// class _SettingsPageState extends State<SettingsPage> {
//   bool _isSwitched = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: IosStyleSwitch(
//           value: _isSwitched,
//           onChanged: (newValue) {
//             setState(() {
//               _isSwitched = newValue;
//             });
//           },
//         ),
//       ),
//     );
//   }
// }
