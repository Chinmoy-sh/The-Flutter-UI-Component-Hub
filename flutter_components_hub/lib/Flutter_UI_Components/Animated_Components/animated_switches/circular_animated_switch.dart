import 'package:flutter/material.dart';

class CircularToggleSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color inactiveColor;

  const CircularToggleSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor = const Color(0xFF4CAF50),
    this.inactiveColor = const Color(0xFFBDBDBD),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: value ? activeColor : inactiveColor,
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: value ? 1.0 : 0.0,
          child: const Icon(Icons.check, color: Colors.white, size: 20),
        ),
      ),
    );
  }
}

// usage
// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({Key? key}) : super(key: key);

//   @override
//   _SettingsScreenState createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//   bool _isTurnedOn = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: CircularToggleSwitch(
//           value: _isTurnedOn,
//           onChanged: (newValue) {
//             setState(() {
//               _isTurnedOn = newValue;
//             });
//           },
//         ),
//       ),
//     );
//   }
// }
