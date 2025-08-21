import 'package:flutter/material.dart';

/// A sleek and animated expanding search bar widget.
///
/// This widget provides a smooth, animated search bar that expands
/// and collapses on tap. It is designed for a seamless user experience
/// and is highly customizable.
class ExpandingSearchBar extends StatefulWidget {
  const ExpandingSearchBar({
    super.key,
    this.animationDuration = const Duration(milliseconds: 300),
    this.collapsedWidth = 50.0,
    this.expandedWidth = 300.0,
    this.borderRadius = 25.0,
    this.fillColor = Colors.white,
    this.iconColor = Colors.black,
    this.hintText = 'Search...',
    required this.onSearch,
    this.onTap,
  });

  /// The duration of the expansion and collapse animation.
  final Duration animationDuration;

  /// The width of the widget when it is collapsed.
  final double collapsedWidth;

  /// The width of the widget when it is fully expanded.
  final double expandedWidth;

  /// The border radius of the search bar container.
  final double borderRadius;

  /// The background color of the search bar.
  final Color fillColor;

  /// The color of the search icon.
  final Color iconColor;

  /// The hint text to display in the search field.
  final String hintText;

  /// The callback function that is triggered when the user
  /// submits a search query.
  final ValueChanged<String> onSearch;

  /// The optional callback that is triggered when the search bar is tapped.
  final VoidCallback? onTap;

  @override
  State<ExpandingSearchBar> createState() => _ExpandingSearchBarState();
}

class _ExpandingSearchBarState extends State<ExpandingSearchBar>
    with SingleTickerProviderStateMixin {
  // A controller to manage the animation.
  late AnimationController _controller;

  // An animation for the width of the search bar.
  late Animation<double> _widthAnimation;

  // A focus node to control the keyboard and focus state of the text field.
  late FocusNode _focusNode;

  // A text editing controller to get the value from the search field.
  final TextEditingController _textController = TextEditingController();

  // A boolean to track the expanded state.
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    // Initialize the animation controller.
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    // Create the width animation from collapsed to expanded width.
    _widthAnimation =
        Tween<double>(
          begin: widget.collapsedWidth,
          end: widget.expandedWidth,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.fastOutSlowIn, // Using a more elegant curve
          ),
        );

    // Listen for focus changes to collapse the bar if it loses focus
    // and is empty.
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && _textController.text.isEmpty) {
        _toggleSearchBar();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _textController.dispose();
    super.dispose();
  }

  /// Toggles the search bar's expanded state and handles the animation.
  void _toggleSearchBar() {
    setState(() {
      _isExpanded = !_isExpanded;
    });

    if (_isExpanded) {
      _controller.forward();
      // Request focus to show the keyboard after a short delay.
      Future.delayed(const Duration(milliseconds: 100), () {
        _focusNode.requestFocus();
      });
    } else {
      _controller.reverse();
      // Unfocus the field to hide the keyboard immediately.
      _focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          // Use the animated width value.
          width: _widthAnimation.value,
          decoration: BoxDecoration(
            color: widget.fillColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            children: [
              // Use a GestureDetector to make the icon tappable.
              GestureDetector(
                onTap: _toggleSearchBar,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                    child: Icon(
                      _isExpanded ? Icons.close : Icons.search,
                      key: ValueKey<bool>(
                        _isExpanded,
                      ), // A key is needed for AnimatedSwitcher
                      color: widget.iconColor,
                    ),
                  ),
                ),
              ),
              // The text field container that expands and collapses.
              Expanded(
                child: AnimatedOpacity(
                  opacity: _isExpanded ? 1.0 : 0.0,
                  duration: widget.animationDuration,
                  child: TextField(
                    controller: _textController,
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      hintText: _isExpanded ? widget.hintText : '',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                    onSubmitted: widget.onSearch,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
