import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kit/src/core/i18n/l10n.dart';
import 'package:flutter_kit/src/core/routing/app_router.dart';
import 'package:flutter_kit/src/shared/locator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Application extends StatelessWidget {
  final AppRouter _appRouter;

  Application({
    super.key,
    AppRouter? appRouter,
  }) : _appRouter = appRouter ?? locator<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return ShadApp.router(
      title: 'MyApp',
      routerConfig: _appRouter.config(
        navigatorObservers: () => [
          AutoRouteObserver(),
        ],
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        I18n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: I18n.delegate.supportedLocales,
    );
  }
}
