import 'package:flutter/material.dart';
import 'package:flutter_kit/src/core/theme/color_scheme_extension.dart';
import 'package:flutter_kit/src/shared/extensions/context_extensions.dart';

enum AppSnackbarType {
  info,
  success,
  danger,
}

final class AppSnackbar {
  static void show({
    required BuildContext context,
    required String title,
    AppSnackbarType type = AppSnackbarType.info,
  }) {
    final messenger = ScaffoldMessenger.maybeOf(context);
    if (messenger == null) {
      return;
    }

    messenger.showSnackBar(SnackBar(
      content: Text(
        title,
        style: context.textTheme.bodyMedium?.copyWith(
          color: switch (type) {
            AppSnackbarType.danger => context.colorScheme.onError,
            AppSnackbarType.success => context.colorScheme.onSuccess,
            AppSnackbarType.info => context.colorScheme.onPrimary,
          },
        ),
      ),
      backgroundColor: switch (type) {
        AppSnackbarType.danger => context.colorScheme.error,
        AppSnackbarType.success => context.colorScheme.success,
        AppSnackbarType.info => context.colorScheme.primary,
      },
    ));
  }
}
