// This is a complete, self-contained Flutter application demonstrating
// a highly polished, reusable search field with a floating label animation.

import 'package:flutter/material.dart';

// A reusable StatefulWidget for the animated search field.
class FloatingLabelSearchField extends StatefulWidget {
  // The placeholder text that will float.
  final String labelText;
  // Optional callback for when the search value changes.
  final ValueChanged<String>? onChanged;

  const FloatingLabelSearchField({
    super.key,
    required this.labelText,
    this.onChanged,
  });

  @override
  State<FloatingLabelSearchField> createState() =>
      _FloatingLabelSearchFieldState();
}

class _FloatingLabelSearchFieldState extends State<FloatingLabelSearchField>
    with SingleTickerProviderStateMixin {
  // A controller for the text field.
  late final TextEditingController _controller;
  // A node to track the focus state of the text field.
  late final FocusNode _focusNode;
  // An animation controller to drive the floating label animation.
  late final AnimationController _animationController;
  // An animation for the position of the label.
  late final Animation<double> _animation;

  // Constants for the animation and styling.
  static const double _labelFontSize = 16.0;
  static const double _floatingLabelFontSize = 12.0;
  static const double _labelHorizontalPadding = 16.0;
  static const double _containerPadding = 12.0;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    // The animation that controls the position and size.
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    // Add a listener to the focus node to trigger the animation.
    _focusNode.addListener(_handleFocusChange);
  }

  // Dispose of controllers and nodes to prevent memory leaks.
  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _animationController.dispose();
    super.dispose();
  }

  // Handles the animation logic based on focus and text content.
  void _handleFocusChange() {
    if (_focusNode.hasFocus || _controller.text.isNotEmpty) {
      // Animate the label to its floating position.
      _animationController.forward();
    } else {
      // Animate the label back to its original position.
      _animationController.reverse();
    }
    // Rebuild the widget to update the border color.
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Determine the border color based on focus state.
    final borderColor = _focusNode.hasFocus ? Colors.blue : Colors.blueGrey;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        // Calculate the current position and font size based on the animation value.
        final topOffset =
            _animation.value * (-_labelFontSize - _containerPadding);
        final leftOffset = _animation.value * _labelHorizontalPadding;
        final fontSize =
            _labelFontSize -
            (_animation.value * (_labelFontSize - _floatingLabelFontSize));
        final labelColor = _focusNode.hasFocus ? Colors.blue : Colors.grey;

        return Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(23),
            border: Border.all(color: borderColor, width: 2.0),
          ),
          child: Stack(
            children: [
              // The main search input field.
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: _labelHorizontalPadding,
                  vertical: _containerPadding,
                ),
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  decoration: const InputDecoration(
                    // Hide the default label and counter.
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                  // Style the input text.
                  style: const TextStyle(fontSize: _labelFontSize),
                  onChanged: widget.onChanged,
                ),
              ),
              // The animated label that floats.
              Positioned(
                top: _containerPadding + topOffset,
                left: _labelHorizontalPadding + leftOffset,
                child: Text(
                  widget.labelText,
                  style: TextStyle(fontSize: fontSize, color: labelColor),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// // A simple home page to demonstrate the search field widget.
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Search Field with Floating Label'),
//         centerTitle: true,
//       ),
//       body: const Padding(
//         padding: EdgeInsets.all(24.0),
//         child: Column(
//           children: [
//             // Use the reusable search field widget.
//             FloatingLabelSearchField(labelText: 'Search'),
//           ],
//         ),
//       ),
//     );
//   }
// }
