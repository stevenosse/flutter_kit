import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData _buildTheme({required Brightness brightness, required AppColors colors}) {
    return ThemeData(
      brightness: brightness,
      scaffoldBackgroundColor: colors.background,
      textTheme: _buildTextTheme(colors: colors),
      appBarTheme: AppBarTheme(
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: brightness == Brightness.light ? Brightness.dark : Brightness.light,
        ),
        backgroundColor: Colors.transparent,
      ),
      drawerTheme: DrawerThemeData(backgroundColor: colors.background),
      cardColor: colors.background,
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: colors.background),
      dialogTheme: DialogTheme(backgroundColor: colors.background),
      primaryColor: colors.primary,
      colorScheme: ColorScheme(
        background: colors.background,
        onBackground: colors.onBackground,
        primary: colors.primary,
        onPrimary: colors.onPrimary,
        surface: colors.surface,
        onSurface: colors.onSurface,
        secondary: colors.secondary,
        onSecondary: colors.onSecondary,
        error: colors.error,
        brightness: brightness,
        onError: colors.onError,
      ),
    );
  }

  static TextTheme _buildTextTheme({required AppColors colors}) {
    return const TextTheme();
  }

  static final ThemeData lightTheme = _buildTheme(
    brightness: Brightness.light,
    colors: AppColors.light(),
  );

  static final ThemeData darkTheme = _buildTheme(
    brightness: Brightness.dark,
    colors: AppColors.dark(),
  );
}
