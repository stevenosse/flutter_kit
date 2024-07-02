import 'package:flutter_kit/src/core/i18n/l10n.dart';
import 'package:flutter_kit/src/core/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kit/src/shared/extensions/context_extensions.dart';

class LoadingDialog {
  static bool _isVisible = false;

  static Future<void> show({required BuildContext context, List<Widget> actions = const []}) {
    if (_isVisible == false) {
      _isVisible = true;

      return showDialog(
        context: context,
        barrierDismissible: false,
        useRootNavigator: false,
        builder: (context) {
          return PopScope(
            canPop: false,
            child: AlertDialog.adaptive(
              surfaceTintColor: Colors.transparent,
              backgroundColor: context.colorScheme.accent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.radius)),
              content: Padding(
                padding: const EdgeInsets.all(Dimens.halfSpacing),
                child: Row(
                  children: [
                    const SizedBox(
                      width: Dimens.loaderSize,
                      height: Dimens.loaderSize,
                      child: CircularProgressIndicator.adaptive(),
                    ),
                    const SizedBox(width: Dimens.spacing),
                    Expanded(child: Text(I18n.of(context).loadingDialog_content)),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
    return Future.value();
  }

  static void hide({required BuildContext context}) {
    if (_isVisible) {
      _isVisible = false;
      Navigator.of(context).pop();
    }
  }
}
