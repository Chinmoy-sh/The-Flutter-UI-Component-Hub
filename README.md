# 📱 The Flutter UI Component Hub

High-quality, reusable, and animated Flutter UI components to build beautiful apps faster.

[![License: MIT](https://img.shields.io/badge/License-MIT-0ea5e9.svg)](LICENSE)
[![Flutter](https://img.shields.io/badge/Flutter-3%2B-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-Enabled-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Platforms](https://img.shields.io/badge/Platforms-Android%20|%20iOS%20|%20Web%20|%20Windows%20|%20macOS%20|%20Linux-7c3aed)](#platforms)
[![Stars](https://img.shields.io/github/stars/Chinmoy-sh/The-Flutter-UI-Component-Hub?style=social)](https://github.com/Chinmoy-sh/The-Flutter-UI-Component-Hub/stargazers)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-10b981.svg)](https://github.com/Chinmoy-sh/The-Flutter-UI-Component-Hub/pulls)

---

<!-- markdownlint-disable MD033 -->
<p align="center">
  <img src="flutter_components_hub/assets/images/Instagram_Glyph_Gradient.png" alt="Instagram Logo" height="64" />
<<<<<<< Updated upstream

  
  <img src="flutter_components_hub/assets/images/Search_GSA.original.png" alt="Google Logo" height="64" />
=======
  <img src="flutter_components_hub/assets/images/icons8-google-55.png" alt="Google Logo" height="64" />
  <img src="flutter_components_hub/assets/images/Search_GSA.original.png" alt="Search Icon" height="64" />
>>>>>>> Stashed changes
</p>
<!-- markdownlint-enable MD033 -->

> ✨ **Live Demo**: [View Components in Action](https://chinmoy-sh.github.io/The-Flutter-UI-Component-Hub/)

🎯 **Professional Repository**: Complete with CI/CD, documentation, and contribution guidelines

## Overview

The Flutter UI Component Hub is a curated collection of reusable widgets and animations you can drop into any Flutter project. From crisp buttons and cards to smooth progress indicators and toggles, this library helps you ship faster with a consistent, polished design language.

## Highlights

- Reusable building blocks: buttons, cards, drawers, footers, and more
- Delightful animations: progress, toggles, animated buttons, and transitions
- Clean structure: clearly grouped `Main_Components` and `Animated_Components`
- Consistent design: cohesive visual style across all widgets
- Ready to customize: simple APIs and readable code

## Table of Contents

- [Overview](#overview)
- [Highlights](#highlights)
- [Quick Start](#quick-start)
- [Browse Components](#browse-components)
- [Use In Your App](#use-in-your-app)
- [Project Structure](#project-structure)
- [Platforms](#platforms)
- [Contributing](#contributing)
- [License](#license)

## Quick Start

Requirements:

- Flutter 3.x (stable)

Run the sample app:

```powershell
git clone https://github.com/Chinmoy-sh/The-Flutter-UI-Component-Hub.git
cd The-Flutter-UI-Component-Hub/flutter_components_hub
flutter pub get
flutter run
```

## Browse Components

All reusable widgets live under:

- `flutter_components_hub/lib/Flutter_UI_Components/Main_Components` – non-animated widgets (e.g., buttons, cards, drawers, footers)
- `flutter_components_hub/lib/Flutter_UI_Components/Animated_Components` – animated widgets (e.g., progress, toggles, buttons)

Explore the folders, pick a style, and use the relevant Dart file as-is or as a starting point for your own customization.

## Use In Your App

Choose one of the following:

- Copy the specific widget file(s) you need into your project and import them normally.
- Or, add this repo as a local package and import via `package:`:

```yaml
# In your app's pubspec.yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_components_hub:
    path: ../The-Flutter-UI-Component-Hub/flutter_components_hub
```

Then import widgets from `lib/Flutter_UI_Components/...` as needed.

## Project Structure

```text
The-Flutter-UI-Component-Hub/
├─ flutter_components_hub/
│  ├─ lib/
│  │  └─ Flutter_UI_Components/
│  │     ├─ Main_Components/
│  │     └─ Animated_Components/
│  ├─ assets/images/
│  └─ pubspec.yaml
└─ README.md
```

## Platforms

Built with Flutter — runs on:

🤖 Android • 🍎 iOS • 🌐 Web • 🪟 Windows • 🖥️ macOS • 🐧 Linux

## Contributing

We welcome contributions from the community! This project follows professional development practices:

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

If this project saves you time, consider giving it a ⭐️. It helps a lot! <br>
Thank you.
