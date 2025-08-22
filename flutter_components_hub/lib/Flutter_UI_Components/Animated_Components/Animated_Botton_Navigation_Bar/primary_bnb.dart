import 'package:flutter/material.dart';

/// A custom bottom navigation bar with an integrated central button
/// and animated pop-out effects for the other items.
class AnimatedNavBar extends StatefulWidget {
  const AnimatedNavBar({
    super.key,
    required this.items,
    required this.onItemSelected,
    this.initialIndex = 0,
    this.backgroundColor = const Color(0xFFF5F5F5), // Light gray background
    this.selectedItemColor = const Color(0xFF192A56), // Dark blue for selected
    this.unselectedItemColor =
        Colors.black54, // Semi-transparent black for unselected
    this.animationDuration = const Duration(milliseconds: 300),
  });

  /// The list of navigation bar items. Must have exactly 5 items.
  final List<BottomNavBarItem> items;

  /// A callback function that is triggered when an item is selected.
  final ValueChanged<int> onItemSelected;

  /// The initial index of the selected item.
  final int initialIndex;

  /// The background color of the navigation bar.
  final Color backgroundColor;

  /// The color of the selected item's icon and label.
  final Color selectedItemColor;

  /// The color of the unselected items' icons and labels.
  final Color unselectedItemColor;

  /// The duration of the animation when an item is selected.
  final Duration animationDuration;

  @override
  State<AnimatedNavBar> createState() => _AnimatedNavBarState();
}

class _AnimatedNavBarState extends State<AnimatedNavBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  /// Handles the selection of a new item and updates the state.
  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
      widget.onItemSelected(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //width:700,
      // The rounded rectangular boundary for the entire bar.
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.266),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 3.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(widget.items.length, (index) {
            final isSelected = _selectedIndex == index;
            final isCenterItem = index == 2;
            return _AnimatedNavItem(
              item: widget.items[index],
              isSelected: isSelected,
              onTap: () => _onItemTapped(index),
              selectedItemColor: widget.selectedItemColor,
              unselectedItemColor: widget.unselectedItemColor,
              animationDuration: widget.animationDuration,
              isCenterItem: isCenterItem,
            );
          }),
        ),
      ),
    );
  }
}

/// A class to hold the properties of a single navigation bar item.
class BottomNavBarItem {
  final IconData icon;
  final IconData selectedIcon;
  final String label;

  const BottomNavBarItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });
}

/// A private helper widget for the animated navigation items.
class _AnimatedNavItem extends StatefulWidget {
  const _AnimatedNavItem({
    required this.item,
    required this.isSelected,
    required this.onTap,
    required this.selectedItemColor,
    required this.unselectedItemColor,
    required this.animationDuration,
    this.isCenterItem = false,
  });

  final BottomNavBarItem item;
  final bool isSelected;
  final VoidCallback onTap;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final Duration animationDuration;
  final bool isCenterItem;

  @override
  State<_AnimatedNavItem> createState() => _AnimatedNavItemState();
}

class _AnimatedNavItemState extends State<_AnimatedNavItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _yOffsetAnimation;
  // ignore: unused_field
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    // Conditionally initialize animations based on item type.
    if (widget.isCenterItem) {
      // For the center FAB, set up the deeper pressing effect animation.
      _scaleAnimation = Tween<double>(
        begin: 1.0,
        end: 0.85,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
      _colorAnimation = ColorTween(
        begin: Colors.white,
        end: Colors.grey[200],
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
      // yOffset is not used for the center item.
      _yOffsetAnimation = const AlwaysStoppedAnimation(0.0);
    } else {
      // For the other items, set up the animated pop-out effect.
      _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
      );
      _yOffsetAnimation = Tween<double>(begin: 0.0, end: -5.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
      );
      // colorAnimation is not used for the other items.
      _colorAnimation = const AlwaysStoppedAnimation(Colors.transparent);

      if (widget.isSelected) {
        _controller.forward();
      }
    }
  }

  @override
  void didUpdateWidget(_AnimatedNavItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.isCenterItem) {
      if (widget.isSelected && !oldWidget.isSelected) {
        _controller.forward();
      } else if (!widget.isSelected && oldWidget.isSelected) {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // If it's the central item, it's a fixed FAB with a pressing effect.
    if (widget.isCenterItem) {
      return GestureDetector(
        onTapDown: (_) {
          _controller.forward();
        },
        onTapUp: (_) {
          _controller.reverse();
        },
        onTapCancel: () {
          _controller.reverse();
        },
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              // Position it in the middle of the buttons
              offset: Offset.zero,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color:
                            Colors.black26, // Lighter shadow for the white FAB
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Icon(
                    widget.item.icon,
                    color: Colors.white, // Dark icon for contrast on white
                    size: 28,
                  ),
                ),
              ),
            );
          },
        ),
      );
    }

    // For the other items, use the animated pop-out effect.
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _yOffsetAnimation.value),
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: AnimatedContainer(
                duration: widget.animationDuration,
                curve: Curves.easeOut,
                width: 50.0,
                height: 50.0,
                decoration: const BoxDecoration(
                  color: Colors.transparent, // No highlight on the white bar
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    widget.item.icon,
                    color: widget.isSelected
                        ? widget.selectedItemColor
                        : widget.unselectedItemColor,
                    size: 24,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// // A complete example of how to use the AnimatedNavBar.
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   int _currentIndex = 0;

//   final List<Widget> _pages = [
//     const Center(
//       child: Text(
//         'Home Page',
//         style: TextStyle(fontSize: 24, color: Colors.black),
//       ),
//     ),
//     const Center(
//       child: Text(
//         'Profile Page',
//         style: TextStyle(fontSize: 24, color: Colors.black),
//       ),
//     ),
//     const Center(
//       child: Text(
//         'Add Page',
//         style: TextStyle(fontSize: 24, color: Colors.black),
//       ),
//     ),
//     const Center(
//       child: Text(
//         'Files Page',
//         style: TextStyle(fontSize: 24, color: Colors.black),
//       ),
//     ),
//     const Center(
//       child: Text(
//         'Send Page',
//         style: TextStyle(fontSize: 24, color: Colors.black),
//       ),
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.white, // A white background for contrast
//         appBar: AppBar(
//           title: const Text('New Nav Bar Style'),
//           backgroundColor: Colors.white,
//           foregroundColor: Colors.black,
//         ),
//         body: _pages[_currentIndex],
//         bottomNavigationBar: AnimatedNavBar(
//           initialIndex: _currentIndex,
//           items: const [
//             BottomNavBarItem(
//               icon: Icons.home_outlined,
//               selectedIcon: Icons.home,
//               label: 'Home',
//             ),
//             BottomNavBarItem(
//               icon: Icons.person_outline,
//               selectedIcon: Icons.person,
//               label: 'Profile',
//             ),
//             BottomNavBarItem(
//               icon: Icons.add, // The plus icon for the FAB
//               selectedIcon: Icons.add,
//               label: 'Add',
//             ),
//             BottomNavBarItem(
//               icon: Icons.folder_open_outlined,
//               selectedIcon: Icons.folder,
//               label: 'Files',
//             ),
//             BottomNavBarItem(
//               icon: Icons.send_outlined,
//               selectedIcon: Icons.send,
//               label: 'Send',
//             ),
//           ],
//           onItemSelected: (index) {
//             setState(() {
//               _currentIndex = index;
//             });
//           },
//         ),
//       ),
//     );
//   }
// }
