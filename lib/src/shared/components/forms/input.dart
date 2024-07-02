import 'package:flutter/material.dart';
import 'package:flutter_kit/src/core/theme/dimens.dart';
import 'package:flutter_kit/src/shared/components/gap.dart';
import 'package:flutter_kit/src/shared/extensions/context_extensions.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Input extends StatelessWidget {
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final bool readOnly;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? cursorColor;

  final bool isPassword;
  final int? minLines;
  final bool isBorderless;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool enabled;
  final int? maxLines;
  final TextInputAction? textInputAction;
  final List<String>? autofillHints;
  final String? labelText;
  final TextCapitalization? textCapitalization;
  final bool expands;

  const Input({
    super.key,
    this.focusNode,
    required this.controller,
    this.hintText,
    this.hintStyle,
    this.style,
    this.prefixIcon,
    this.suffixIcon,
    this.cursorColor,
    this.isPassword = false,
    this.minLines,
    this.isBorderless = false,
    this.keyboardType,
    this.fillColor,
    this.validator,
    this.onChanged,
    this.readOnly = false,
    this.enabled = true,
    this.maxLines,
    this.textInputAction,
    this.autofillHints,
    this.onSubmitted,
    this.labelText,
    this.textCapitalization,
    this.expands = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color borderColor = context.colorScheme.border;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Text(
            labelText!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),
          ),
          const Gap.vertical(height: Dimens.minSpacing),
        ],
        ClipRRect(
          borderRadius: BorderRadius.circular(Dimens.radius),
          child: ShadInput(
            expands: expands,
            autofillHints: autofillHints,
            controller: controller,
            obscureText: isPassword,
            cursorColor: cursorColor,
            readOnly: readOnly,
            focusNode: focusNode,
            style: style ?? Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
            minLines: isPassword ? 1 : minLines,
            maxLines: isPassword ? 1 : maxLines,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            suffix: suffixIcon,
            prefix: prefixIcon,
            onSubmitted: onSubmitted,
            textCapitalization: textCapitalization ?? TextCapitalization.sentences,
            placeholder: Text(
              hintText ?? '',
              style: hintStyle ?? context.textTheme.p.copyWith(fontWeight: FontWeight.w500),
            ),
            inputPadding: const EdgeInsets.symmetric(horizontal: Dimens.minSpacing, vertical: Dimens.halfSpacing),
            decoration: ShadDecoration(
              errorBorder: _getInputBorder(color: context.colorScheme.destructive),
              border: _getInputBorder(color: borderColor),
              focusedBorder: _getInputBorder(color: context.colorScheme.primary),
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  ShadBorder _getInputBorder({required Color color}) => isBorderless
      ? ShadBorder.none
      : ShadBorder(
          radius: BorderRadius.circular(Dimens.radius),
          width: 1.5,
          color: color,
        );
}
