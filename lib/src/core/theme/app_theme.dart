import 'package:flutter/material.dart';
import 'package:flutter_kit/src/core/theme/color_schemes.dart';
import 'package:flutter_kit/src/core/theme/custom_colors.dart';

class AppTheme {
  static const _fontFamily = 'GeneralSans';

  static ThemeData _buildTheme({required Brightness brightness}) {
    final ColorScheme colors = brightness == Brightness.light ? lightColorScheme : darkColorScheme;

    return ThemeData(
      useMaterial3: true,
      textTheme: _buildTextTheme(colors: colors),
      appBarTheme: AppBarTheme(
        surfaceTintColor: Colors.transparent,
        backgroundColor: colors.surface,
      ),
      cardTheme: CardTheme(
        color: colors.surface,
        shadowColor: colors.shadow.withValues(alpha: .5),
      ),
      colorScheme: colors,
      extensions: [brightness == Brightness.light ? CustomColors.light : CustomColors.dark],
    );
  }

  static TextTheme _buildTextTheme({required ColorScheme colors}) {
    return TextTheme(
      displayLarge: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 32,
        color: colors.onSurface,
      ),
      headlineLarge: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 28,
        color: colors.onSurface,
      ),
      titleLarge: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: colors.onSurface,
      ),
      titleMedium: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: colors.onSurface,
      ),
      titleSmall: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: colors.onSurface,
      ),
      bodyLarge: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: colors.onSurface,
      ),
      bodyMedium: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: colors.onSurface,
      ),
      bodySmall: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: colors.onSurface,
      ),
      labelLarge: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: colors.onSurface,
      ),
      labelMedium: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: colors.onSurface,
      ),
      labelSmall: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 10,
        color: colors.onSurface,
      ),
    );
  }

  static final ThemeData lightTheme = _buildTheme(brightness: Brightness.light);

  static final ThemeData darkTheme = _buildTheme(brightness: Brightness.dark);
}
