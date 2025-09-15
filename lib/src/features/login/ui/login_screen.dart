import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kit/src/shared/components/feedback/dialogs/loading_dialog.dart';
import 'package:flutter_kit/src/shared/components/ui/atoms/dividers/labeled_divider.dart';
import 'package:flutter_kit/src/shared/components/ui/inputs/buttons/button.dart';
import 'package:flutter_kit/src/shared/components/ui/inputs/forms/input.dart';
import 'package:flutter_kit/src/shared/components/utils/state/listenable_consumer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_kit/gen/assets.gen.dart';
import 'package:flutter_kit/src/core/i18n/l10n.dart';
import 'package:flutter_kit/src/core/theme/dimens.dart';
import 'package:flutter_kit/src/features/login/logic/login_controller.dart';
import 'package:flutter_kit/src/shared/extensions/context_extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

@RoutePage()
class LoginScreen extends StatefulWidget implements AutoRouteWrapper {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginController(),
      child: this,
    );
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context, listen: false);
    return ListenableConsumer<LoginController>(
      listenable: controller,
      listener: (context, notifier) {
        switch (notifier.value) {
          case LoginLoading():
            LoadingDialog.show(context: context);
          case LoginSuccess():
            LoadingDialog.hide(context: context);
          case LoginError():
            LoadingDialog.hide(context: context);
          default:
            break;
        }
      },
      builder: (context, notifier) {
        return Scaffold(
          appBar: AppBar(toolbarHeight: 0),
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(Dimens.spacing),
              children: [
                const SizedBox(height: Dimens.tripleSpacing),
                Text(
                  I18n.of(context).login_title,
                  style: context.textTheme.titleLarge,
                ),
                const SizedBox(height: Dimens.minSpacing),
                Text(I18n.of(context).login_subtitle, style: context.textTheme.bodyMedium),
                const SizedBox(height: Dimens.doubleSpacing),
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
                          onChanged: context.read<LoginController>().onEmailChanged,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: Dimens.spacing),
                        Input(
                          autofillHints: const [AutofillHints.password],
                          controller: _passwordController,
                          isPassword: !_isPasswordVisible,
                          labelText: I18n.of(context).login_passwordLabel,
                          hintText: I18n.of(context).login_passwordHint,
                          onChanged: context.read<LoginController>().onPasswordChanged,
                          textInputAction: TextInputAction.done,
                          suffixIcon: IconButton(
                            onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                            icon: Icon(
                              _isPasswordVisible ? IconsaxPlusBroken.eye : IconsaxPlusBroken.eye_slash,
                              color: context.colorScheme.onSurface,
                            ),
                          ),
                          onSubmitted: (_) => _onLogin(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: Dimens.spacing),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(I18n.of(context).login_forgotPasswordLabel),
                  ),
                ),
                const SizedBox(height: Dimens.spacing),
                Button.primary(
                  title: I18n.of(context).login_submitBtnLabel,
                  onPressed: _onLogin,
                ),
                const SizedBox(height: Dimens.doubleSpacing),
                LabeledDivider(label: I18n.of(context).or),
                const SizedBox(height: Dimens.doubleSpacing),
                Button.outline(
                  icon: SvgPicture.asset(
                    Assets.images.googleLogo,
                    width: Dimens.iconSize,
                    height: Dimens.iconSize,
                  ),
                  title: I18n.of(context).login_googleBtnLabel,
                  onPressed: () {},
                ),
                const SizedBox(height: Dimens.spacing),
                Button.outline(
                  icon: SvgPicture.asset(
                    Assets.images.appleLogo,
                    colorFilter: ColorFilter.mode(context.colorScheme.onSurface, BlendMode.srcIn),
                    width: Dimens.iconSize,
                    height: Dimens.iconSize,
                  ),
                  title: I18n.of(context).login_appleBtnLabel,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onLogin() => context.read<LoginController>().login();
}
