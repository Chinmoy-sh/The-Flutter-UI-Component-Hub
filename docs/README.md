# Flutter UI Component Hub Documentation

Welcome to the Flutter UI Component Hub documentation! This comprehensive guide will help you understand and use all available components in your Flutter applications.

## Table of Contents

- [Getting Started](#getting-started)
- [Component Categories](#component-categories)
- [Installation](#installation)
- [Basic Usage](#basic-usage)
- [Customization](#customization)
- [Contributing](#contributing)

## Getting Started

The Flutter UI Component Hub is a curated collection of high-quality, reusable Flutter widgets designed to accelerate your app development process.

### Prerequisites

- Flutter SDK 3.0 or later
- Dart 2.17 or later

### Quick Start

1. Clone the repository:

```bash
git clone https://github.com/Chinmoy-sh/The-Flutter-UI-Component-Hub.git
```

2.Navigate to the project:

```bash
cd The-Flutter-UI-Component-Hub/flutter_components_hub
```

3.Install dependencies:

```bash
flutter pub get
```

4.Run the demo app:

```bash
flutter run
```

## Component Categories

### 🎯 Main Components (Static UI)

These are non-animated UI components perfect for building solid user interfaces:

#### Buttons

- **Custom Buttons** - Various button styles and configurations
- **Icon Buttons** - Buttons with integrated icons
- **Floating Action Buttons** - Material Design FABs

#### Cards

- **Information Cards** - Display structured content
- **Product Cards** - E-commerce style cards
- **Profile Cards** - User information display

#### Input Components

- **Text Fields** - Custom input fields with validation
- **Search Fields** - Optimized search input components
- **Switches** - Toggle switches with custom styling

#### Navigation

- **App Bars** - Custom application bars
- **Drawers** - Side navigation drawers
- **Bottom Navigation** - Tab-based navigation

#### Display Components

- **Alert Dialogs** - Modal dialogs for user interaction
- **Rating Cards** - Star rating components
- **Skeleton Loaders** - Loading state indicators
- **User Profiles** - Complete user profile widgets

#### Layout & Structure

- **Footer Components** - Page footer elements
- **Overflow Toolbars** - Responsive toolbar components
- **Text Styles** - Pre-configured text styling

### ⚡ Animated Components

Dynamic components with smooth animations and transitions:

#### Interactive Elements

- **Animated Buttons** - Buttons with hover and press animations
- **Animated Switches** - Toggle switches with fluid animations
- **Activity Progress Animation** - Loading and progress indicators

#### Navigation Animations

- **Animated Bottom Navigation Bar** - Tab bars with transition effects
- **Animated Page Navigation** - Page transition animations
- **Expanding Search Bar** - Search input with expand/collapse animation

## Installation

### Option 1: Copy Components (Recommended)

1. Browse the component categories in `lib/Flutter_UI_Components/`
2. Copy the specific component files you need to your project
3. Import and use them directly in your widgets

### Option 2: Local Package Dependency

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_components_hub:
    path: ../path/to/The-Flutter-UI-Component-Hub/flutter_components_hub
```

## Basic Usage

### Example: Using a Custom Button

```dart
import 'package:flutter/material.dart';
// Import the component (adjust path as needed)
import 'path/to/custom_button.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomButton(
          text: 'Click Me!',
          onPressed: () {
            print('Button pressed!');
          },
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}
```

### Example: Using an Animated Component

```dart
import 'package:flutter/material.dart';
import 'path/to/animated_button.dart';

class AnimatedExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      text: 'Tap for Animation',
      onTap: () {
        // Handle tap
      },
      animationDuration: Duration(milliseconds: 300),
    );
  }
}
```

## Customization

### Theme Integration

Most components integrate with Flutter's theme system:

```dart
MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
      // Your text styles
    ),
  ),
  home: MyHomePage(),
)
```

### Custom Styling

Components accept various styling parameters:

```dart
CustomCard(
  borderRadius: BorderRadius.circular(12),
  shadowColor: Colors.grey.withOpacity(0.3),
  elevation: 4,
  padding: EdgeInsets.all(16),
  child: YourContent(),
)
```

### Responsive Design

Components are built with responsive design in mind:

```dart
ResponsiveButton(
  mobileWidth: double.infinity,
  tabletWidth: 300,
  desktopWidth: 250,
  text: 'Responsive Button',
)
```

## Component Documentation

Each component comes with detailed documentation:

- **Properties**: All available customization options
- **Examples**: Common usage patterns
- **Best Practices**: Recommended implementation approaches
- **Accessibility**: Screen reader and keyboard navigation support

## Performance Tips

1. **Use const constructors** when possible
2. **Implement proper key management** for animated components
3. **Optimize images** used in components
4. **Consider lazy loading** for large lists of components

## Troubleshooting

### Common Issues

**Import Errors**: Make sure component files are in the correct path
**Theme Issues**: Ensure your app has a proper Material or Cupertino theme
**Animation Problems**: Check that you're using StatefulWidget when needed

### Debug Mode

Run your app in debug mode to see helpful error messages:

```bash
flutter run --debug
```

## Examples Gallery

Visit our examples gallery to see all components in action:

- [Live Demo](https://chinmoy-sh.github.io/The-Flutter-UI-Component-Hub/)
- [Source Code Examples](../flutter_components_hub/lib/examples/)

## Contributing

We welcome contributions! See our [Contributing Guide](../CONTRIBUTING.md) for details on:

- Adding new components
- Improving existing components
- Documentation improvements
- Bug fixes

## Support

- 📚 [Documentation](README.md)
- 🐛 [Report Issues](https://github.com/Chinmoy-sh/The-Flutter-UI-Component-Hub/issues)
- 💡 [Feature Requests](https://github.com/Chinmoy-sh/The-Flutter-UI-Component-Hub/issues/new?template=feature_request.yml)
- 📖 [Discussions](https://github.com/Chinmoy-sh/The-Flutter-UI-Component-Hub/discussions)

## License

This project is licensed under the MIT License - see the [LICENSE](../LICENSE) file for details.

---

Made with ❤️ by the Flutter UI Component Hub team
