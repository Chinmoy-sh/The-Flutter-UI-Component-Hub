import 'package:flutter/material.dart';

/// A customizable, full-screen sliding drawer that animates open and closed.
///
/// This widget provides a smooth, cool effect by scaling the main content
/// as the drawer slides open. It also correctly handles tapping outside
/// to close the drawer.
class FullScreenSlidingDrawer extends StatefulWidget {
  const FullScreenSlidingDrawer({
    super.key,
    required this.mainContent,
    required this.drawerContent,
    this.drawerWidth = 198.0,
    this.animationDuration = const Duration(milliseconds: 400),
  });

  /// The main content of the page, typically a Scaffold.
  final Widget mainContent;

  /// The content to display inside the sliding drawer.
  final Widget drawerContent;

  /// The width of the drawer when fully open.
  final double drawerWidth;

  /// The duration of the slide animation.
  final Duration animationDuration;

  @override
  State<FullScreenSlidingDrawer> createState() =>
      _FullScreenSlidingDrawerState();
}

class _FullScreenSlidingDrawerState extends State<FullScreenSlidingDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _drawerSlideAnimation;
  late Animation<double> _mainContentScaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    // Animates the drawer's horizontal position.
    _drawerSlideAnimation = Tween<double>(
      begin: -1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    // Animates the scale of the main content for a cool "3D" effect.
    _mainContentScaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.8,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // ignore: unused_element
  void _openDrawer() {
    _controller.forward();
  }

  void _closeDrawer() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // The background color for the drawer animation.
          Container(color: Colors.grey[200]),

          // The main content, which gets scaled down.
          AnimatedBuilder(
            animation: _mainContentScaleAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _mainContentScaleAnimation.value,
                child: AbsorbPointer(
                  absorbing: _controller.status == AnimationStatus.forward,
                  child: widget.mainContent,
                ),
              );
            },
          ),

          // A GestureDetector overlay to capture taps on the outer layer.
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Opacity(
                opacity: _controller.value,
                child: GestureDetector(
                  onTap: _closeDrawer,
                  child: Container(
                    color: Colors.transparent,
                    width: _controller.value > 0 ? double.infinity : 0,
                    height: _controller.value > 0 ? double.infinity : 0,
                  ),
                ),
              );
            },
          ),

          // The sliding drawer itself.
          AnimatedBuilder(
            animation: _drawerSlideAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(
                  _drawerSlideAnimation.value * widget.drawerWidth,
                  0,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(20.0),
                  ),
                  child: Material(
                    elevation: 16.0,
                    child: SizedBox(
                      width: widget.drawerWidth,
                      child: widget.drawerContent,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
