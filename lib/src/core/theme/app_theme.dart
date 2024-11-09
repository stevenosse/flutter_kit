import 'package:flutter/material.dart';
import 'package:flutter_kit/src/core/theme/color_schemes.dart';

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
      ),
      colorScheme: colors,
    );
  }

  static TextTheme _buildTextTheme({required ColorScheme colors}) {
    return const TextTheme(
      displayLarge: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 32,
      ),
      headlineLarge: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 28,
      ),
      titleLarge: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      titleMedium: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
      titleSmall: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 18,
      ),
      bodyLarge: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      bodySmall: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      labelSmall: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 10,
      ),
    );
  }

  static final ThemeData lightTheme = _buildTheme(brightness: Brightness.light);

  static final ThemeData darkTheme = _buildTheme(brightness: Brightness.dark);
}
