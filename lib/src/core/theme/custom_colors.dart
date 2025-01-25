import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color success;
  final Color onSuccess;

  const CustomColors({
    required this.success,
    required this.onSuccess,
  });

  @override
  CustomColors copyWith({
    Color? success,
    Color? onSuccess,
  }) {
    return CustomColors(
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
    );
  }

  static const light = CustomColors(
    success: Color(0xFF4CAF50),
    onSuccess: Color(0xFFFFFFFF),
  );

  static const dark = CustomColors(
    success: Color(0xFF81C784),
    onSuccess: Color(0xFF1B5E20),
  );
}