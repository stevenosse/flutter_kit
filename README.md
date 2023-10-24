# Flutter Kit
This kit is a boilerplate for Flutter projects. It comes with a set of preconfigured features and utilities to help you get started with your project.

## Get started

### 1. Clone the repository
```bash
git clone git@github.com:stevenosse/flutter_kit.git
```

### 2. Customize the project
  <!-- warning icon -->
<img src="https://img.icons8.com/color/48/000000/warning-shield.png" width="20" height="20" /> **Warning**: This command has not been tested on Windows. If you are using Windows, please open an issue if you encounter any problems.

````bash
dart run bin/install.dart --package-name=your_package_name --name=app_name
````

This command will:
- Rename the project in the `pubspec.yaml` file and all files using the package:flutter_kit import
- Change the package name and bundle identifier for both android and ios projects
- Rename the android native app code directory

## Features
This kit comes with a set of preconfigured features and utilities:

- I18n
- Navigation (using auto_route)
- State management (using BLoC & freezed)
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
This kit uses [BLoC](https://pub.dev/packages/flutter_bloc) for state management. 
See the [BLoC documentation](https://bloclibrary.dev/#/gettingstarted) for more information.

An example of a BLoC can be found in the `src/features/home_screen/logic` folder.

## 🗼 Extensions
This kit comes with a few extensions on the `BuildContext` and `Iterable` classes. See the `src/shared/extensions` folder for more information.

## 📌 Utils
### Widgets
This kit comes with a few utility widgets. See the `src/shared/components` folder for more information.

### Assets
Assets paths are automaticalle generated when using build_runnner thanks to the [flutter_gen](https://pub.dev/packages/https://pub.dev/packages/flutter_gen) package.


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

## 💼 Need a new feature?
If you need a new feature, please open an issue on the [GitHub repository](https://github.com/stevenosse/flutter_boilerplate/issues/new)

## 📇 Get in touch
If you have any questions, feel free to contact me on [Twitter](https://twitter.com/nossesteve) 