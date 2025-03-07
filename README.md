<h1 align="center"><b>Flutter Kit</b></h1>

<p align="center">Opinionated flutter starter project using feature-first folder structure.</p>

<p align="center">
    <img alt="GitHub stars" src="https://img.shields.io/github/stars/stevenosse/flutter_kit">
    &nbsp;&nbsp;&nbsp;&nbsp;
    <img alt="GitHub forks" src="https://img.shields.io/github/forks/stevenosse/flutter_kit">

</p>

<div align="center">
    <img src="flutter-kit-logo.png" width="100">
</div>

## Motivation

Flutter is geat, really. But after few years of development, it's not as easy as it seems; starting a new project can be quite a challenge. The fact that Flutter is as less opinionated has some benefits but also comes with some drawbacks among those the pain of starting a new project. You can easily waste a lot how hours to get productive, while you only wanted to POC a new idea.

This kit provides a set of preconfigured features and utilities to help you get started with your project. It is inspired by my own experience and knowledge of Flutter. I hope you find it useful.

If you are not confortable with some choices i made in the structure, we can either discuss it (yeah i may find it helpful) or fork this repo to create your own.

## What's in this kit?
This kit includes:

- An example login feature
- I18n
- Navigation
- State management
- Extensions
- Basic config for API calls
- Theming (Material 3)

## Get started

### 1. Clone the repository
```bash
git clone git@github.com:stevenosse/flutter_kit.git
```

### 2. Configure your project

Add your configuration to the `pubspec.yaml` file under the `flutter_kit` key:

```yaml
flutter_kit:
  app_name: Your App Name
  ios_bundle_id: com.yourcompany.yourapp
  android_package_name: com.yourcompany.yourapp
```

### 3. Run the setup script

#### On macOS/Linux:
```bash
chmod +x setup.sh
./setup.sh
```

#### On Windows:
```bash
setup.bat
```

The setup script will:
- Update your app name for both iOS and Android
- Change the iOS bundle identifier
- Change the Android package name
- Move the Android files to the correct package structure

### 4. Run flutter pub get
```bash
flutter pub get
```

## Features
This kit comes with a set of preconfigured features and utilities:

- I18n
- Navigation (using auto_route)
- State management (using plain change notifier)
- Extensions (on context, iterable)
- Utility widgets
- Default Theming using Material 3

## 🗺️ I18n
This kit uses [intl_utils](https://pub.dev/packages/intl_utils) for internationalization. To add a new language, add a new file to the `src/core/i18n/l10n` folder. The file name should be the language code prefixed with intl_ (e.g. `intl_fr.arb`).

To generate the code for the new language, run the following command:

```bash
flutter pub run intl_utils:generate
```

Alternatively, you can install the [flutter_intl](https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl) package in VSCode to automatically generate the code when you save the file.

## 🛣️ Navigation
This kit uses [auto_route](https://pub.dev/packages/auto_route) for navigation. To add a new route, add a new file to the `src/core/routing/app_router.dart` file. 

See the [auto_route documentation](https://pub.dev/packages/auto_route) for more information.

## 🧱 State Management
This kit uses plain change notifiers for state management. 

An example of a change notifier can be found in the `src/features/login/logic` folder.

## 🗼 Extensions
This kit comes with a few extensions on the `BuildContext` and `Iterable` classes. See the `src/shared/extensions` folder for more information.

## 📌 Utils
### Widgets
This kit comes with a few utility widgets. See the `src/shared/components` folder for more information.

### Assets
Assets paths are automatically generated when using build_runnner thanks to the [flutter_gen](https://pub.dev/packages/https://pub.dev/packages/flutter_gen) package.

Each time you add an asset, run the following command:

```bash
$ fluttergen
```

### CLI
This kit comes with a few CLI commands to make your life easier.
It uses make:

- Windows: `choco install make`
- Linux: `sudo apt install make`
- Mac: `brew install make`

See the `Makefile` for more information.

## 🖌️ Theming
This kit uses the new Material 3 theming system. See the `src/core/theme` folder for more information.

The default color scheme is generated using https://m3.material.io/theme-builder#/custom. You can use this tool to generate your own color scheme.

## Showcase
- [LineAI](https://github.com/stevenosse/lineai)

## 💼 Need a new feature?
If you need a new feature, please open an issue on the [GitHub repository](https://github.com/stevenosse/flutter_boilerplate/issues/new)

## 📇 Get in touch
If you have any questions, feel free to contact me on [Twitter](https://twitter.com/nossesteve) 

## TODO
- [ ] Setup a CI pipeline
- [ ] Add setup for unit tests 
