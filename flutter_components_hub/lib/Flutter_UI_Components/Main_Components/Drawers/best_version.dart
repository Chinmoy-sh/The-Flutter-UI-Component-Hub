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



// Usages

// ///return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // The MaterialApp itself cannot be const because its home widget (FullScreenSlidingDrawer)
//       // is a StatefulWidget and thus not const.
//       home: Scaffold(
//         body: Center(
//           child: FullScreenSlidingDrawer(
//             key: drawerKey,
//             mainContent: Scaffold(
//               appBar: AppBar(
//                 title: const Text('Custom Drawer UI'),
//                 leading: IconButton(
//                   icon: const Icon(Icons.menu),
//                   onPressed: () {
//                     // Call the _openDrawer method on the FullScreenSlidingDrawer's state.
//                     drawerKey.currentState?._openDrawer();
//                   },
//                 ),
//               ),
//               body: const Center(
//                 child: Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Text(
//                     'Tap the menu icon in the top left to reveal the custom sliding drawer. Tap outside the drawer to close it.',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 18),
//                   ),
//                 ),
//               ),
//             ),
//             drawerContent: Container(
//               color: Colors.white,
//               child: ListView(
//                 // Do not add default padding from Scaffold for the drawer content
//                 padding: EdgeInsets.zero,
//                 children: <Widget>[
//                   const DrawerHeader(
//                     decoration: BoxDecoration(color: Colors.blue),
//                     child: Align(
//                       alignment: Alignment.bottomLeft,
//                       child: Text(
//                         'Drawer Menu',
//                         style: TextStyle(color: Colors.white, fontSize: 24),
//                       ),
//                     ),
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.home),
//                     title: const Text('Home'),
//                     onTap: () {
//                       // Close the drawer when an item is tapped.
//                       drawerKey.currentState?._closeDrawer();
//                       // Add navigation logic here
//                       // For example: Navigator.push(...);
//                     },
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.dashboard),
//                     title: const Text('Dashboard'),
//                     onTap: () {
//                       drawerKey.currentState?._closeDrawer();
//                       // Add navigation logic here
//                     },
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.settings),
//                     title: const Text('Settings'),
//                     onTap: () {
//                       drawerKey.currentState?._closeDrawer();
//                       // Add navigation logic here
//                     },
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.info),
//                     title: const Text('About'),
//                     onTap: () {
//                       drawerKey.currentState?._closeDrawer();
//                       // Add navigation logic here
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );