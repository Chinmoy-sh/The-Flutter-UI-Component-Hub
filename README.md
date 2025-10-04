# 🎨 Flutter UI Component Hub

> A professional, production-ready collection of reusable Flutter UI components and animations

[![Build Status](https://img.shields.io/github/actions/workflow/status/Chinmoy-sh/The-Flutter-UI-Component-Hub/flutter-ci.yml?branch=main&logo=github&logoColor=white&label=Build)](https://github.com/Chinmoy-sh/The-Flutter-UI-Component-Hub/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-0ea5e9.svg?logo=opensourceinitiative&logoColor=white)](LICENSE)
[![Flutter](https://img.shields.io/badge/Flutter-3.24%2B-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.8%2B-0175C2?logo=dart&logoColor=white)](https://dart.dev)

[![GitHub Stars](https://img.shields.io/github/stars/Chinmoy-sh/The-Flutter-UI-Component-Hub?style=social)](https://github.com/Chinmoy-sh/The-Flutter-UI-Component-Hub/stargazers)
[![GitHub Forks](https://img.shields.io/github/forks/Chinmoy-sh/The-Flutter-UI-Component-Hub?style=social)](https://github.com/Chinmoy-sh/The-Flutter-UI-Component-Hub/network/members)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-10b981.svg?logo=github&logoColor=white)](CONTRIBUTING.md)

<!-- markdownlint-disable MD033 -->
<p>
  <img src="flutter_components_hub/assets/images/Instagram_Glyph_Gradient.png" alt="Component Preview" height="48" />
  <img src="flutter_components_hub/assets/images/icons8-google-55.png" alt="UI Elements" height="48" />
  <img src="flutter_components_hub/assets/images/Search_GSA.original.png" alt="Animation Demo" height="48" />
</p>
<!-- markdownlint-enable MD033 -->

**🚀 [Live Demo](https://chinmoy-sh.github.io/The-Flutter-UI-Component-Hub/) • 📖 [Documentation](docs/) • 🤝 [Contributing](CONTRIBUTING.md)**

</div>

---

## 🌟 Why Choose Flutter UI Component Hub?

### 🎯 **Production Ready**

A comprehensive, **professional-grade** component library built with industry best practices, automated testing, and continuous integration.

### 📦 **50+ Premium Components**

**Main Components (Static UI):**

- 🔘 **Buttons** - Elevated, text, icon, and custom variants
- 🃏 **Cards** - Information, product, profile, and media cards  
- 📝 **Text Fields** - Input fields with validation and styling
- 📱 **App Bars** - Custom headers and navigation bars
- 🎛️ **Switches** - Toggle switches with custom styling
- 🚨 **Alerts & Dialogs** - Modal dialogs and notifications
- ⭐ **Rating Components** - Star ratings and feedback widgets
- 👤 **User Profiles** - Complete profile display widgets
- 🔍 **Search Fields** - Advanced search input components
- 💀 **Skeleton Loaders** - Loading state indicators
- 🦶 **Footers** - Page footer components
- 🧰 **Toolbars** - Responsive overflow toolbars

**Animated Components (Dynamic UI):**

- 🎬 **Animated Buttons** - Interactive button animations
- 📊 **Progress Animations** - Loading and activity indicators
- 🧭 **Animated Navigation** - Smooth navigation transitions
- 🔍 **Expanding Search** - Search bar with expand/collapse
- 🔄 **Animated Switches** - Fluid toggle animations
- 📄 **Page Transitions** - Smooth page navigation effects

### ✨ **Key Features**

- 🚀 **Cross-Platform** - Android, iOS, Web, Windows, macOS, Linux
- 🎨 **Themeable** - Full Material Design 3 integration
- ♿ **Accessible** - Built-in accessibility support
- 📱 **Responsive** - Mobile-first, adaptive design
- 🧪 **Tested** - Comprehensive test coverage
- 📚 **Documented** - Complete API documentation
- 🔧 **Customizable** - Easy to modify and extend

## 📋 Table of Contents

- [Why Choose Flutter UI Component Hub?](#-why-choose-flutter-ui-component-hub)
- [Quick Start](#-quick-start)
- [Component Gallery](#-component-gallery)
- [How to Use Components](#-how-to-use-components)
- [Project Architecture](#️-project-architecture)
- [Cross-Platform Support](#-cross-platform-support)
- [Contributing](#-contributing)
- [Community & Support](#community--support)
- [Development Workflow](#development-workflow)
- [License](#license)

## 🚀 Quick Start

### Prerequisites

- **Flutter SDK** 3.24+ ([Install Flutter](https://docs.flutter.dev/get-started/install))
- **Dart** 3.8+
- **IDE** - VS Code, Android Studio, or IntelliJ IDEA

### Run the Demo App

Experience all components in action with our professional demo application:

```bash
# Clone the repository
git clone https://github.com/Chinmoy-sh/The-Flutter-UI-Component-Hub.git

# Navigate to the Flutter project
cd The-Flutter-UI-Component-Hub/flutter_components_hub

# Install dependencies
flutter pub get

# Run on your preferred platform
flutter run                    # Mobile (Android/iOS)
flutter run -d chrome          # Web browser
flutter run -d windows         # Windows desktop
flutter run -d macos           # macOS desktop
```

### 🎯 Try It Online

**[🌐 Live Web Demo](https://chinmoy-sh.github.io/The-Flutter-UI-Component-Hub/)**

Experience the component library directly in your browser without any setup!

## 🎨 Component Gallery

### 🏗️ Main Components (Static UI)

Professional, production-ready components for solid user interfaces:

| Category | Components | Description |
|----------|------------|-------------|
| **🔘 Buttons** | Elevated, Text, Icon, Custom | Various button styles with consistent theming |
| **🃏 Cards** | Info, Product, Profile, Media | Content display cards with flexible layouts |
| **📝 Input Fields** | Text, Search, Validation | Form inputs with built-in validation |
| **📱 Navigation** | App Bars, Drawers, Tabs | Complete navigation solutions |
| **🎛️ Controls** | Switches, Sliders, Toggles | Interactive control components |
| **📊 Display** | Rating, Profile, Alerts | Information and feedback components |
| **🔧 Layout** | Toolbars, Footers, Grids | Structural and organizational widgets |

### ⚡ Animated Components (Dynamic UI)

Smooth, performant animations that enhance user experience:

| Category | Components | Description |
|----------|------------|-------------|
| **🎬 Interactive** | Animated Buttons, Switches | Touch-responsive animations |
| **📊 Progress** | Loading, Activity, Skeleton | Loading state indicators |
| **🧭 Navigation** | Page Transitions, Tabs | Smooth navigation animations |
| **🔍 Search** | Expanding Search Bar | Advanced search interactions |
| **🔄 State** | Morphing Icons, Transforms | State change animations |

### 📂 Component Organization

```text
Flutter_UI_Components/
├── Main_Components/
│   ├── Buttons/                # Button variants and styles
│   ├── Cards/                  # Card layouts and designs  
│   ├── Text_Fields/           # Input field components
│   ├── App_Bar/               # Navigation headers
│   ├── Drawers/               # Side navigation
│   ├── Alert_Dialogues/       # Modal dialogs
│   ├── Rating_card/           # Rating and review widgets
│   ├── User_Profile/          # Profile display components
│   ├── Search_Field/          # Search input variants
│   ├── Skeleton_Loader/       # Loading placeholders
│   ├── Footer/                # Page footers
│   ├── Overflow_toolbar/      # Responsive toolbars
│   ├── Switches/              # Toggle controls
│   └── Text_Style/            # Typography utilities
└── Animated_Components/
    ├── Animated_Buttons/      # Interactive button animations
    ├── Activity_Progress_Animation/ # Loading animations
    ├── Animated_Botton_Navigation_Bar/ # Tab animations
    ├── Animated_Page_Navigation/ # Page transitions
    ├── Animated_Search_Bar/   # Search interactions
    └── animated_switches/     # Toggle animations
```

## 💡 How to Use Components

### Method 1: Direct File Usage

#### 1️⃣ Browse & Select

Navigate through our organized component folders and find the widget that matches your needs:

```text
flutter_components_hub/lib/Flutter_UI_Components/
├── Main_Components/Buttons/elevated_button.dart
├── Animated_Components/Animated_Buttons/animated_button.dart
└── ...
```

#### 2️⃣ Copy & Import

Each component is self-contained. Copy the widget file to your project:

```dart
// Example: Using an elevated button component
import 'package:flutter/material.dart';
import 'path/to/elevated_button.dart';

class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomElevatedButton(
          text: 'Click Me',
          onPressed: () => print('Button pressed!'),
        ),
      ),
    );
  }
}
```

#### 3️⃣ Customize

Modify properties to match your design system:

```dart
CustomElevatedButton(
  text: 'Custom Button',
  backgroundColor: Colors.blue,
  textColor: Colors.white,
  borderRadius: 12.0,
  elevation: 4.0,
  onPressed: () => _handleButtonPress(),
)
```

### Method 2: Clone & Integrate

For teams wanting the complete experience:

```bash
# 1. Clone the repository
git clone https://github.com/Chinmoy-sh/The-Flutter-UI-Component-Hub.git

# 2. Copy component folders to your project
cp -r flutter_components_hub/lib/Flutter_UI_Components/ your_project/lib/

# 3. Update pubspec.yaml with required dependencies
flutter pub get

# 4. Import and use components
import 'package:your_project/Flutter_UI_Components/Main_Components/Buttons/elevated_button.dart';
```

### Method 3: Package Integration

*(Coming Soon)* Install as a Flutter package:

```yaml
dependencies:
  flutter_ui_component_hub: ^1.0.0
```

### 🎨 Customization Examples

#### Theme Integration

```dart
// Integrate with your app's theme
ThemeData appTheme = ThemeData(
  primarySwatch: Colors.blue,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
);
```

#### Component Extension

```dart
// Extend components for specific needs
class BrandedButton extends CustomElevatedButton {
  BrandedButton({
    required String text,
    required VoidCallback onPressed,
  }) : super(
    text: text,
    onPressed: onPressed,
    backgroundColor: AppColors.primary,
    textColor: AppColors.onPrimary,
    borderRadius: AppSizes.borderRadius,
  );
}
```

## 🏗️ Project Architecture

### Repository Structure

```text
The-Flutter-UI-Component-Hub/
├── .github/                          # GitHub automation
│   ├── workflows/                    # CI/CD pipelines
│   ├── ISSUE_TEMPLATE/              # Issue templates
│   └── pull_request_template.md     # PR template
├── docs/                            # Documentation
│   └── README.md                    # Component docs
├── flutter_components_hub/          # Main Flutter project
│   ├── lib/
│   │   ├── main.dart               # Demo application
│   │   └── Flutter_UI_Components/  # Component library
│   │       ├── Main_Components/    # Static UI components
│   │       └── Animated_Components/ # Dynamic components
│   ├── assets/images/              # Demo assets
│   ├── test/                       # Unit tests
│   └── pubspec.yaml               # Dependencies
├── CONTRIBUTING.md                 # Contribution guide
├── CODE_OF_CONDUCT.md             # Community guidelines
├── SECURITY.md                    # Security policy
└── README.md                      # Main documentation
```

### Component Architecture

Each component follows these principles:

- **Self-contained**: No external dependencies beyond Flutter SDK
- **Customizable**: Extensive theming and styling options  
- **Accessible**: Screen reader support and semantic labels
- **Performant**: Optimized for smooth 60fps animations
- **Documented**: Comprehensive code comments and examples

## 🌍 Cross-Platform Support

Built with Flutter's universal framework:

| Platform | Status | Notes |
|----------|--------|-------|
| 🤖 **Android** | ✅ Full Support | API 16+ (4.1+) |
| 🍎 **iOS** | ✅ Full Support | iOS 12.0+ |
| 🌐 **Web** | ✅ Full Support | Modern browsers, PWA ready |
| 🪟 **Windows** | ✅ Full Support | Windows 10+ |
| 🖥️ **macOS** | ✅ Full Support | macOS 10.14+ |
| 🐧 **Linux** | ✅ Full Support | Ubuntu 18.04+ |

## 🤝 Contributing

We welcome contributions from developers worldwide! This project follows professional open-source practices:

- 📋 **Issues**: Use our issue templates for bugs and feature requests
- 🔄 **Pull Requests**: Follow our PR template and guidelines
- 📖 **Documentation**: Comprehensive contribution guide available
- 🧪 **Testing**: Automated CI/CD pipeline for quality assurance
- 📝 **Code Style**: Consistent formatting and linting rules

See our [Contributing Guide](CONTRIBUTING.md) for detailed instructions.

## Community & Support

- 📚 **Documentation**: [Complete component docs](docs/)
- 🐛 **Bug Reports**: [Issue tracker](https://github.com/Chinmoy-sh/The-Flutter-UI-Component-Hub/issues)
- 💡 **Feature Requests**: [Enhancement proposals](https://github.com/Chinmoy-sh/The-Flutter-UI-Component-Hub/issues/new?template=feature_request.yml)
- 🔒 **Security**: [Security policy](SECURITY.md)
- 📜 **Code of Conduct**: [Community guidelines](CODE_OF_CONDUCT.md)

## Development Workflow

This repository uses professional development practices:

```bash
# Setup development environment
git clone https://github.com/Chinmoy-sh/The-Flutter-UI-Component-Hub.git
cd The-Flutter-UI-Component-Hub/flutter_components_hub
flutter pub get

# Run tests
flutter test

# Format code
dart format .

# Analyze code
flutter analyze

# Build for different platforms
flutter build apk        # Android
flutter build web        # Web
flutter build windows    # Windows
```

## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

If this project saves you time, consider giving it a ⭐️. It helps a lot!

Thank you for using The Flutter UI Component Hub! 🚀
