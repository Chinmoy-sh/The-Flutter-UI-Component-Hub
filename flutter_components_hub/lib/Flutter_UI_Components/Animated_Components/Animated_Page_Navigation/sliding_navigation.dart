import 'package:flutter/material.dart';

// /// The main entry point for the application.
// void main() {
//   runApp(const MyApp());
// }

// /// The root of the application. We'll start on the HomePage.
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

/// A custom page route transition for a slide animation.
/// This function encapsulates the logic to make it reusable.
Route createSlideRoute(Widget page) {
  return PageRouteBuilder(
    // The new page to navigate to.
    pageBuilder: (context, animation, secondaryAnimation) => page,
    // The duration of the transition animation.
    transitionDuration: const Duration(milliseconds: 700),
    // The animation builder function.
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Define the starting and ending positions for the slide animation.
      // (1.0, 0.0) means it starts off-screen to the right.
      const begin = Offset(1.0, 0.0);
      // Offset.zero means it ends at the normal position on the screen.
      const end = Offset.zero;

      // Define the animation curve for a smooth transition.
      // The `easeOut` curve makes the animation start fast and slow down at the end.
      const curve = Curves.easeOut;

      // Create a Tween for the position, which calculates the intermediate values.
      var tween = Tween(begin: begin, end: end).chain(
        // The CurveTween applies the animation curve to the Tween.
        CurveTween(curve: curve),
      );

      // We use a SlideTransition to apply the animation to the child widget.
      return SlideTransition(
        // The `position` property takes the animation from the tween.
        position: animation.drive(tween),
        child: child,
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
                // Use the reusable route creator function to navigate with animation.
                Navigator.of(
                  context,
                ).push(createSlideRoute(const DetailsPage()));
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
                // Use the reusable route creator function to navigate with animation.
                Navigator.of(
                  context,
                ).push(createSlideRoute(const ProfilePage()));
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
                // The animation will play in reverse automatically.
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
