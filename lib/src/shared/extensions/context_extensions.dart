import 'package:flutter/material.dart';

extension ThemeDataX on BuildContext {
  Brightness get brightness => Theme.of(this).brightness;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  ThemeData get theme => Theme.of(this);

  IconThemeData get iconTheme => Theme.of(this).iconTheme;

  AppBarTheme get appBarTheme => Theme.of(this).appBarTheme;

  BottomAppBarTheme get bottomAppBarTheme => Theme.of(this).bottomAppBarTheme;

  BottomNavigationBarThemeData get bottomNavigationBarTheme => Theme.of(this).bottomNavigationBarTheme;
}

extension MediaQueryX on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);

  Brightness get platformBrightness => MediaQuery.platformBrightnessOf(this);

  EdgeInsets get padding => MediaQuery.paddingOf(this);

  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  TextScaler get textScaler => MediaQuery.textScalerOf(this);
}
