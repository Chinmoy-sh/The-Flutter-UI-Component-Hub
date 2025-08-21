import 'package:flutter/material.dart';

/// An animated switch with a smooth transition between two icons and styles.
///
/// This widget provides a customizable toggle with different icons, colors,
/// and styles for its 'on' and 'off' states, adding a delightful user experience.
class AnimatedIconSwitch extends StatefulWidget {
  const AnimatedIconSwitch({
    super.key,
    this.initialValue = false,
    required this.onChanged,
    this.duration = const Duration(milliseconds: 300),
    this.size = 35.0,
    this.offIcon = Icons.home,
    this.offIconColor = Colors.white,
    this.offColor = Colors.grey,
    this.onIcon = Icons.volume_up,
    this.onIconColor = Colors.white,
    this.onColor = Colors.blue,
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

  /// The background color of the switch in the 'off' state.
  final Color offColor;

  /// The icon to display in the 'on' state.
  final IconData onIcon;

  /// The color of the icon in the 'on' state.
  final Color onIconColor;

  /// The background color of the switch in the 'on' state.
  final Color onColor;

  @override
  State<AnimatedIconSwitch> createState() => _AnimatedIconSwitchState();
}

class _AnimatedIconSwitchState extends State<AnimatedIconSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _alignmentAnimation;
  late Animation<Color?> _colorAnimation;

  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;

    _controller = AnimationController(vsync: this, duration: widget.duration);

    _alignmentAnimation = AlignmentTween(
      begin: _value ? Alignment.centerRight : Alignment.centerLeft,
      end: _value ? Alignment.centerLeft : Alignment.centerRight,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _colorAnimation = ColorTween(
      begin: _value ? widget.onColor : widget.offColor,
      end: _value ? widget.offColor : widget.onColor,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Initial state setup for the first frame
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
            width: widget.size * 1.8,
            height: widget.size,
            decoration: BoxDecoration(
              color: currentColor,
              borderRadius: BorderRadius.circular(widget.size / 2),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            alignment: _alignmentAnimation.value,
            child: Icon(
              _value ? widget.onIcon : widget.offIcon,
              color: _value ? widget.onIconColor : widget.offIconColor,
              size: widget.size * 0.6,
            ),
          );
        },
      ),
    );
  }
}
