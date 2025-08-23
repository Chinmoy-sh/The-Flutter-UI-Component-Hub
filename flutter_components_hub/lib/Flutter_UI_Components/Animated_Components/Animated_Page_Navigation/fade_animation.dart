import 'package:flutter/material.dart';

/// The main entry point for the application.
// void main() {
//   runApp(const MyApp());
// }

// /// The root of the application.
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }

/// Creates a smooth, but faster page transition.
///
/// This transition is simpler than the previous version, removing the
/// subtle scale effect on the page that is being exited. It focuses on
/// the incoming page, making the navigation feel more immediate and direct.
Route createSmoothRoute(Widget page) {
  return PageRouteBuilder(
    // The new page to navigate to.
    pageBuilder: (context, animation, secondaryAnimation) => page,
    // The duration is now 350 milliseconds, making the animation slightly faster.
    transitionDuration: const Duration(milliseconds: 350),
    // This is where the custom animation logic is defined.
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // The core of the animation is this `tween`.
      // It creates a subtle scale effect, zooming in from 96% of the size to 100%.
      // The `easeOutCubic` curve makes the animation start fast and decelerate smoothly.
      final tween = Tween(
        begin: 0.96,
        end: 1.0,
      ).chain(CurveTween(curve: Curves.easeOutCubic));

      // The new page is wrapped in a FadeTransition so it appears gradually.
      return FadeTransition(
        opacity: animation,
        // It's also wrapped in a ScaleTransition, which applies the subtle zoom effect.
        child: ScaleTransition(
          // The scale is driven by the animation using the `tween` we defined.
          scale: animation.drive(tween),
          child: child,
        ),
      );
    },
  );
}

/// The first page of the app. It has a button to navigate to the DetailsPage.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Home Page!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
              onPressed: () {
                // Use the smooth route creator function to navigate with animation.
                Navigator.of(
                  context,
                ).push(createSmoothRoute(const DetailsPage()));
              },
              child: const Text('Go to Details Page'),
            ),
          ],
        ),
      ),
    );
  }
}

/// The second page of the app. It has a button to navigate to the ProfilePage.
class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'This is the Details Page!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
              onPressed: () {
                // Use the smooth route creator function to navigate with animation.
                Navigator.of(
                  context,
                ).push(createSmoothRoute(const ProfilePage()));
              },
              child: const Text('Go to Profile Page'),
            ),
          ],
        ),
      ),
    );
  }
}

/// The third and final page. It has a button to navigate back to the Home page.
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You are on the Profile Page!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
              onPressed: () {
                // Use Navigator.pop() to go back to the previous screen.
                Navigator.of(context).pop();
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
