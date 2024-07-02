import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

extension ThemeDataX on BuildContext {
  ShadThemeData get theme => ShadTheme.of(this);

  Brightness get brightness => theme.brightness;

  ShadColorScheme get colorScheme => theme.colorScheme;

  ShadTextTheme get textTheme => theme.textTheme;

  SystemUiOverlayStyle get systemUiOverlayStyle => SystemUiOverlayStyle(
        statusBarBrightness: theme.brightness,
        statusBarIconBrightness: theme.brightness == Brightness.dark ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: theme.colorScheme.background,
      );
}

extension MediaQueryX on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);

  Brightness get platformBrightness => MediaQuery.platformBrightnessOf(this);

  EdgeInsets get padding => MediaQuery.paddingOf(this);

  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  TextScaler get textScaler => MediaQuery.textScalerOf(this);
}
