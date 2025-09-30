# Contributing to Flutter UI Component Hub

Thank you for your interest in contributing! This document provides guidelines for contributing to the Flutter UI Component Hub.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [How to Contribute](#how-to-contribute)
- [Component Guidelines](#component-guidelines)
- [Style Guidelines](#style-guidelines)
- [Testing](#testing)

## Code of Conduct

By participating in this project, you agree to abide by our [Code of Conduct](CODE_OF_CONDUCT.md).

## Getting Started

1. Fork the repository
2. Clone your fork:

   ```bash
   git clone https://github.com/YOUR_USERNAME/The-Flutter-UI-Component-Hub.git
   ```

3. Create a new branch for your feature:

   ```bash
   git checkout -b feature/component-name
   ```

4. Set up the development environment:

   ```bash
   cd The-Flutter-UI-Component-Hub/flutter_components_hub
   flutter pub get
   flutter run
   ```

## How to Contribute

### Adding New Components

1. **Choose the right category:**
   - `Main_Components/` - Static UI components (buttons, cards, text fields, etc.)
   - `Animated_Components/` - Components with animations and transitions

2. **Create component structure:**

   ```text
   Component_Name/
   ├── component_name.dart          # Main component file
   ├── README.md                    # Component documentation
   └── examples/                    # Usage examples (optional)
       └── example_usage.dart
   ```

3. **Follow naming conventions:**
   - Use PascalCase for class names: `CustomButton`
   - Use snake_case for file and folder names: `custom_button/`
   - Use descriptive, clear names

### Improving Existing Components

1. Check existing issues for improvement suggestions
2. Ensure backward compatibility
3. Update documentation if needed
4. Add tests for new functionality

## Component Guidelines

### Code Structure

```dart
import 'package:flutter/material.dart';

/// Brief description of what this component does
/// 
/// Example usage:
/// ```dart
/// CustomButton(
///   text: 'Click Me',
///   onPressed: () => print('Button pressed'),
/// )
/// ```
class CustomButton extends StatelessWidget {
  /// The text to display on the button
  final String text;
  
  /// Callback when button is pressed
  final VoidCallback? onPressed;
  
  /// Optional button color
  final Color? backgroundColor;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
      ),
      child: Text(text),
    );
  }
}
```

### Component Requirements

✅ **Must Have:**

- Clear documentation with examples
- Customizable properties
- Null safety compliance
- Responsive design considerations
- Accessibility support (semantics)

✅ **Should Have:**

- Theme integration
- Animation considerations
- Error handling
- Performance optimizations

✅ **Nice to Have:**

- Multiple style variants
- Interactive examples
- Unit tests

### Documentation Template

Each component should include a `README.md` with:

```markdown
# Component Name

Brief description of the component and its purpose.

## Features

- Feature 1
- Feature 2
- Feature 3

## Usage

```dart
import 'package:flutter_components_hub/components/component_name.dart';

ComponentName(
  property1: value1,
  property2: value2,
)
```

## Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| property1 | String | required | Description |
| property2 | Color? | null | Description |

## Examples

### Basic Usage

[Code example]

### Advanced Usage

[Code example with customization]

## Screenshots

[Include screenshots or GIFs showing the component in action]

```text

## Pull Request Process

1. **Before submitting:**
   - Test your changes thoroughly
   - Run `flutter analyze` to check for issues
   - Format code with `dart format .`
   - Update documentation

2. **PR Requirements:**
   - Clear, descriptive title
   - Detailed description of changes
   - Screenshots/GIFs for UI changes
   - Link to related issues

3. **PR Template:**
   ```markdown
   ## Description
   Brief description of changes

   ## Type of Change
   - [ ] New component
   - [ ] Bug fix
   - [ ] Enhancement
   - [ ] Documentation update

   ## Testing
   - [ ] Tested on Android
   - [ ] Tested on iOS
   - [ ] Tested on Web
   - [ ] No breaking changes

   ## Screenshots
   [Add screenshots here]
   ```

## Style Guidelines

### Dart/Flutter Code Style

- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use `dart format` for consistent formatting
- Maximum line length: 80 characters
- Use meaningful variable and function names
- Add comments for complex logic

### File Organization

```text
lib/
├── Flutter_UI_Components/
│   ├── Main_Components/
│   │   ├── buttons/
│   │   │   ├── elevated_button_variants.dart
│   │   │   ├── icon_button_variants.dart
│   │   │   └── README.md
│   │   └── cards/
│   └── Animated_Components/
│       └── animated_buttons/
├── utils/                          # Helper utilities
├── constants/                      # App constants
└── main.dart
```

## Testing

### Running Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run specific test file
flutter test test/widgets/button_test.dart
```

### Writing Tests

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_components_hub/components/custom_button.dart';

void main() {
  group('CustomButton Tests', () {
    testWidgets('displays text correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomButton(
              text: 'Test Button',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Test Button'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (WidgetTester tester) async {
      bool wasPressed = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomButton(
              text: 'Test Button',
              onPressed: () => wasPressed = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(CustomButton));
      expect(wasPressed, isTrue);
    });
  });
}
```

## Recognition

Contributors will be recognized in:

- README.md contributors section
- Release notes for significant contributions
- Special mentions for outstanding contributions

## Questions?

- Open an issue for questions about contributing
- Join our discussions in the Issues tab
- Check existing documentation and examples

Thank you for contributing! 🎉
