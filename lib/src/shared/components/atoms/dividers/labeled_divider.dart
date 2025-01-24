// Drawing a divider with some text in the center
import 'package:flutter/material.dart';
import 'package:flutter_kit/src/core/theme/dimens.dart';
import 'package:flutter_kit/src/shared/extensions/context_extensions.dart';

class LabeledDivider extends StatelessWidget {
  final String label;
  final EdgeInsetsGeometry labelPadding;
  final Color? labelBackgroundColor;

  const LabeledDivider({
    required this.label,
    this.labelPadding = const EdgeInsets.symmetric(horizontal: Dimens.spacing),
    super.key,
    this.labelBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Divider(),
        Padding(
          padding: labelPadding,
          child: Text(
            label,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.onSurface.withValues(alpha: .8),
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
