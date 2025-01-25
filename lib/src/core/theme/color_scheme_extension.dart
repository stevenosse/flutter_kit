import 'package:flutter/material.dart';
import 'custom_colors.dart';

extension ColorSchemeExtension on ColorScheme {
  CustomColors get custom => brightness == Brightness.light ? CustomColors.light : CustomColors.dark;

  // For ease of use, creating extensions for custom colors
  Color get success => custom.success;
  Color get onSuccess => custom.onSuccess;
}
