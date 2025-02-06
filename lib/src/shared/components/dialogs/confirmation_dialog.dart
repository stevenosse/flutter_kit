import 'package:flutter_kit/src/core/i18n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kit/src/core/theme/dimens.dart';
import 'package:flutter_kit/src/shared/extensions/context_extensions.dart';

class ConfirmationDialog {
  static Future<bool> show({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmText,
    String? cancelText,
    Color? confirmButtonColor,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: true,
      useRootNavigator: false,
      builder: (context) {
        return AlertDialog.adaptive(
          surfaceTintColor: Colors.transparent,
          backgroundColor: context.colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.radius),
          ),
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(cancelText ?? I18n.of(context).dialog_cancel),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(
                confirmText ?? I18n.of(context).dialog_confirm,
                style: TextStyle(color: confirmButtonColor),
              ),
            ),
          ],
        );
      },
    );
    return result ?? false;
  }
}
