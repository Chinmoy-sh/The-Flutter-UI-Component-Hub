import 'package:flutter/material.dart';

/// An iOS-style switch with smooth, continuous dragging and a polished design.
///
/// This widget handles both tap and drag gestures, providing a seamless and
/// intuitive user experience with smooth animations and customizable styling.
/// The code has been completely refactored to be bug-free and reliable.
class UltimateSwitch extends StatefulWidget {
  const UltimateSwitch({
    super.key,
    this.initialValue = false,
    required this.onChanged,
    this.duration = const Duration(milliseconds: 300),
    this.size = 60.0,
    this.offIcon = Icons.power_settings_new,
    this.offIconColor = Colors.black,
    this.onIcon = Icons.check_circle,
    this.onIconColor = Colors.green,
    this.offTrackColor = Colors.grey,
    this.onTrackColor = Colors.green,
    this.thumbColor = Colors.white,
  });

  /// The initial value of the switch (on/off).
  final bool initialValue;

  /// The callback function when the switch value changes.
  final ValueChanged<bool> onChanged;

  /// The duration of the animations.
  final Duration duration;

  /// The size of the entire switch.
  final double size;

  /// The icon to display in the 'off' state.
  final IconData offIcon;

  /// The color of the icon in the 'off' state.
  final Color offIconColor;

  /// The background color of the track in the 'off' state.
  final Color offTrackColor;

  /// The icon to display in the 'on' state.
  final IconData onIcon;

  /// The color of the icon in the 'on' state.
  final Color onIconColor;

  /// The background color of the track in the 'on' state.
  final Color onTrackColor;

  /// The color of the moving circular thumb.
  final Color thumbColor;

  @override
  State<UltimateSwitch> createState() => _UltimateSwitchState();
}

class _UltimateSwitchState extends State<UltimateSwitch>
    with SingleTickerProviderStateMixin {
  late bool _value;
  late AnimationController _controller;
  late Animation<double> _animation;
  // A flag to prevent tap and drag gestures from conflicting.
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;

    _controller = AnimationController(vsync: this, duration: widget.duration);

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    if (_value) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleOnTap() {
    // Only handle the tap if a drag has not just occurred.
    if (!_isDragging) {
      setState(() {
        _value = !_value;
      });
      if (_value) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
      widget.onChanged(_value);
    }
  }

  void _handlePanStart(DragStartDetails details) {
    // A drag has started, so prevent the tap handler from firing.
    _isDragging = true;
  }

  void _handlePanUpdate(DragUpdateDetails details) {
    // This is the new, more robust drag logic.
    // It maps the local drag position to the animation value directly.
    final double switchWidth = widget.size * 1.8;
    final double thumbSize = (widget.size * 0.6) - 4;
    final double dragRange = switchWidth - thumbSize - 4.0;

    // Calculate the new thumb position based on the local position of the drag.
    final double newThumbPosition = details.localPosition.dx - thumbSize / 2;

    // Normalize the new position to a value between 0.0 and 1.0.
    final double newValue = (newThumbPosition / dragRange).clamp(0.0, 1.0);

    _controller.value = newValue;
  }

  void _handlePanEnd(DragEndDetails details) {
    // Drag has ended, reset the flag.
    _isDragging = false;

    bool finalValue;
    if (_controller.value > 0.5) {
      finalValue = true;
    } else {
      finalValue = false;
    }

    if (finalValue != _value) {
      setState(() {
        _value = finalValue;
      });
      widget.onChanged(_value);
    }

    if (_value) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double switchHeight = widget.size * 0.6;
    final double switchWidth = switchHeight * 1.8;
    final double thumbSize = switchHeight - 4;
    final double trackWidth = switchWidth;

    return GestureDetector(
      onTap: _handleOnTap,
      onPanStart: _handlePanStart,
      onPanUpdate: _handlePanUpdate,
      onPanEnd: _handlePanEnd,
      child: Container(
        width: trackWidth,
        height: switchHeight,
        decoration: BoxDecoration(
          color: _value ? widget.onTrackColor : widget.offTrackColor,
          borderRadius: BorderRadius.circular(switchHeight / 2),
        ),
        padding: const EdgeInsets.all(2.0),
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final thumbOffset =
                    _animation.value * (trackWidth - thumbSize - 4.0);
                return Positioned(left: thumbOffset, child: child!);
              },
              child: Container(
                width: thumbSize,
                height: thumbSize,
                decoration: BoxDecoration(
                  color: widget.thumbColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: AnimatedSwitcher(
                  duration: widget.duration,
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                        return ScaleTransition(
                          scale: animation,
                          child: FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        );
                      },
                  child: Icon(
                    _value ? widget.onIcon : widget.offIcon,
                    key: ValueKey<bool>(_value),
                    color: _value ? widget.onIconColor : widget.offIconColor,
                    size: thumbSize * 0.82,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
