import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kit/gen/assets.gen.dart';
import 'package:flutter_kit/src/core/i18n/l10n.dart';
import 'package:flutter_kit/src/core/theme/dimens.dart';
import 'package:flutter_kit/src/features/login/logic/login_cubit.dart';
import 'package:flutter_kit/src/shared/components/atoms/dividers/labeled_divider.dart';
import 'package:flutter_kit/src/shared/components/dialogs/dialog_builder.dart';
import 'package:flutter_kit/src/shared/components/forms/input.dart';
import 'package:flutter_kit/src/shared/components/gap.dart';
import 'package:flutter_kit/src/shared/extensions/context_extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class LoginScreen extends StatefulWidget implements AutoRouteWrapper {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: this,
    );
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isPasswordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: context.systemUiOverlayStyle,
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          state.whenOrNull(
              loading: (email, password) => LoadingDialog.show(context: context),
              success: (email, password, response) => LoadingDialog.hide(context: context),
              error: (email, password, error) => LoadingDialog.hide(context: context));
        },
        child: Scaffold(
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(Dimens.spacing),
              children: [
                const Gap.vertical(height: Dimens.tripleSpacing),
                Text(
                  I18n.of(context).login_title,
                  style: context.textTheme.h2.copyWith(fontWeight: FontWeight.bold),
                ),
                const Gap.vertical(height: Dimens.minSpacing),
                Text(I18n.of(context).login_subtitle,
                    style: context.textTheme.lead.copyWith(fontWeight: FontWeight.w500)),
                const Gap.vertical(height: Dimens.doubleSpacing),
                AutofillGroup(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Input(
                          autofillHints: const [AutofillHints.email],
                          controller: _emailController,
                          labelText: I18n.of(context).login_emailLabel,
                          hintText: I18n.of(context).login_emailHint,
                          onChanged: context.read<LoginCubit>().onEmailChanged,
                          textInputAction: TextInputAction.next,
                        ),
                        const Gap.vertical(height: Dimens.spacing),
                        Input(
                          autofillHints: const [AutofillHints.password],
                          controller: _passwordController,
                          isPassword: !_isPasswordVisible,
                          labelText: I18n.of(context).login_passwordLabel,
                          hintText: I18n.of(context).login_passwordHint,
                          onChanged: context.read<LoginCubit>().onPasswordChanged,
                          textInputAction: TextInputAction.done,
                          suffixIcon: IconButton(
                            onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                            icon: Icon(
                              _isPasswordVisible ? IconsaxPlusBroken.eye : IconsaxPlusBroken.eye_slash,
                              color: context.colorScheme.foreground,
                            ),
                          ),
                          onSubmitted: (_) => _onLogin(),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap.vertical(height: Dimens.spacing),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(I18n.of(context).login_forgotPasswordLabel),
                  ),
                ),
                const Gap.vertical(height: Dimens.spacing),
                ShadButton(
                  text: Text(
                    I18n.of(context).login_submitBtnLabel,
                    textAlign: TextAlign.center,
                  ),
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  onPressed: _onLogin,
                  size: ShadButtonSize.lg,
                ),
                const Gap.vertical(height: Dimens.doubleSpacing),
                LabeledDivider(label: I18n.of(context).or),
                const Gap.vertical(height: Dimens.doubleSpacing),
                ShadButton.secondary(
                  icon: SvgPicture.asset(
                    Assets.images.googleLogo,
                    width: Dimens.iconSize,
                    height: Dimens.iconSize,
                  ),
                  text: Text(I18n.of(context).login_googleBtnLabel),
                  onPressed: () {},
                  size: ShadButtonSize.lg,
                ),
                const Gap.vertical(height: Dimens.spacing),
                ShadButton.outline(
                  icon: SvgPicture.asset(
                    Assets.images.appleLogo,
                    colorFilter: ColorFilter.mode(context.colorScheme.foreground, BlendMode.srcIn),
                    width: Dimens.iconSize,
                    height: Dimens.iconSize,
                  ),
                  text: Text(I18n.of(context).login_appleBtnLabel),
                  onPressed: () {},
                  size: ShadButtonSize.lg,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onLogin() => context.read<LoginCubit>().login();
}
