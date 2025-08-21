import 'package:flutter/material.dart';

/// An animated switch with a smooth transition between two icons and styles.
///
/// This widget provides a customizable toggle with different icons, colors,
/// and styles for its 'on' and 'off' states, adding a delightful user experience.
class CircularIconSwitch extends StatefulWidget {
  const CircularIconSwitch({
    super.key,
    this.initialValue = false,
    required this.onChanged,
    this.duration = const Duration(milliseconds: 300),
    this.size = 30.0,
    this.offIcon = Icons.power_settings_new,
    this.offIconColor = Colors.white,
    this.offThumbColor = Colors.grey,
    this.onIcon = Icons.check_circle,
    this.onIconColor = Colors.white,
    this.onThumbColor = Colors.blue,
  });

  /// The initial value of the switch (on/off).
  final bool initialValue;

  /// The callback function when the switch value changes.
  final ValueChanged<bool> onChanged;

  /// The duration of the animation.
  final Duration duration;

  /// The size of the switch.
  final double size;

  /// The icon to display in the 'off' state.
  final IconData offIcon;

  /// The color of the icon in the 'off' state.
  final Color offIconColor;

  /// The color of the moving circular thumb in the 'off' state.
  final Color offThumbColor;

  /// The icon to display in the 'on' state.
  final IconData onIcon;

  /// The color of the icon in the 'on' state.
  final Color onIconColor;

  /// The color of the moving circular thumb in the 'on' state.
  final Color onThumbColor;

  @override
  State<CircularIconSwitch> createState() => _CircularIconSwitchState();
}

class _CircularIconSwitchState extends State<CircularIconSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // ignore: unused_field
  late Animation<double> _alignmentAnimation;
  late Animation<Color?> _colorAnimation;

  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;

    _controller = AnimationController(vsync: this, duration: widget.duration);

    _alignmentAnimation = Tween<double>(
      begin: _value ? 1.0 : -1.0,
      end: _value ? -1.0 : 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _colorAnimation = ColorTween(
      begin: _value ? widget.onThumbColor : widget.offThumbColor,
      end: _value ? widget.offThumbColor : widget.onThumbColor,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Set initial position
    if (_value) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleOnTap() {
    setState(() {
      _value = !_value;
      if (_value) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
    widget.onChanged(_value);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleOnTap,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final currentColor = _colorAnimation.value;
          return Container(
            width: widget.size * 2.2,
            height: widget.size,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(widget.size / 2),
              border: Border.all(color: currentColor!, width: 2.0),
            ),
            padding: const EdgeInsets.all(4.0),
            alignment: _value ? Alignment.centerRight : Alignment.centerLeft,
            child: FractionallySizedBox(
              heightFactor: 1.0,
              child: AnimatedContainer(
                duration: widget.duration,
                curve: Curves.easeOut,
                width: widget.size - 8,
                decoration: BoxDecoration(
                  color: currentColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _value ? widget.onIcon : widget.offIcon,
                  color: _value ? widget.onIconColor : widget.offIconColor,
                  size: widget.size * 0.5,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
