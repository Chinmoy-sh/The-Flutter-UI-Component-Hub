// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

/// The main application widget, a StatefulWidget to manage the drawer's state.
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   // A ValueNotifier to control the open/closed state of the FullScreenSlidingDrawer.
//   // Initialized to true to show the drawer open by default.
//   late final ValueNotifier<bool> _isDrawerOpen;

//   @override
//   void initState() {
//     super.initState();
//     _isDrawerOpen = ValueNotifier<bool>(true);
//   }

//   @override
//   void dispose() {
//     _isDrawerOpen.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // The main content of the screen, including the AppBar and the toggle button.
//     final Scaffold mainContentScaffold = Scaffold(
//       appBar: AppBar(
//         title: const Text('Custom UI Drawer'),
//         leading: IconButton(
//           icon: const Icon(Icons.menu),
//           onPressed: () {
//             // Toggle the drawer state when the menu icon is pressed.
//             _isDrawerOpen.value = !_isDrawerOpen.value;
//           },
//         ),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             // Toggle the drawer state when the button is pressed.
//             _isDrawerOpen.value = !_isDrawerOpen.value;
//           },
//           child: const Text('Toggle Drawer'),
//         ),
//       ),
//     );

//     // The content to be displayed inside the drawer.
//     final Widget drawerContentWidget = Container(
//       color: Colors.lightBlue[100], // Background color for drawer content
//       padding: const EdgeInsets.all(16.0),
//       child: const Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Drawer Content',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             Icon(Icons.star, size: 40, color: Colors.blueAccent),
//             SizedBox(height: 10),
//             Text(
//               'This is the custom content inside the sliding drawer.',
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Custom UI Drawer',
//       home: FullScreenSlidingDrawer(
//         mainContent: mainContentScaffold,
//         drawerContent: drawerContentWidget,
//         isOpenNotifier: _isDrawerOpen,
//         drawerWidth: 200.0, // Matching the original drawerWidth
//       ),
//     );
//   }
// }

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
    required this.isOpenNotifier,
    this.drawerWidth = 280.0,
    this.animationDuration = const Duration(milliseconds: 400),
  });

  /// The main content of the page, typically a Scaffold.
  final Widget mainContent;

  /// The content to display inside the sliding drawer.
  final Widget drawerContent;

  /// A [ValueNotifier] that controls the open/closed state of the drawer.
  final ValueNotifier<bool> isOpenNotifier;

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

    // Add listener to control the drawer based on external notifier
    widget.isOpenNotifier.addListener(_handleDrawerStateChange);
    // Initialize drawer state based on the initial value of the notifier
    if (widget.isOpenNotifier.value) {
      _controller.value =
          1.0; // Set to open without animation if initially open
    } else {
      _controller.value =
          0.0; // Set to closed without animation if initially closed
    }
  }

  @override
  void didUpdateWidget(covariant FullScreenSlidingDrawer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isOpenNotifier != oldWidget.isOpenNotifier) {
      oldWidget.isOpenNotifier.removeListener(_handleDrawerStateChange);
      widget.isOpenNotifier.addListener(_handleDrawerStateChange);
      // Re-evaluate state if notifier itself changed
      _handleDrawerStateChange();
    }
  }

  @override
  void dispose() {
    widget.isOpenNotifier.removeListener(
      _handleDrawerStateChange,
    ); // Remove listener
    _controller.dispose();
    super.dispose();
  }

  void _handleDrawerStateChange() {
    if (widget.isOpenNotifier.value) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // The background color for the drawer animation, revealed as main content scales.
          Container(color: Colors.grey[200]),

          // The main content, which gets scaled down and can be tapped to close the drawer.
          // Wrapped in AnimatedBuilder for scale animation.
          AnimatedBuilder(
            animation: _mainContentScaleAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _mainContentScaleAnimation.value,
                child: GestureDetector(
                  // Tap to close drawer if it's currently open.
                  onTap: () {
                    if (widget.isOpenNotifier.value) {
                      widget.isOpenNotifier.value = false;
                    }
                  },
                  // AbsorbPointer prevents interaction with the main content's widgets
                  // when the drawer is open or animating.
                  child: AbsorbPointer(
                    absorbing: _controller.status != AnimationStatus.dismissed,
                    child: widget.mainContent,
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
