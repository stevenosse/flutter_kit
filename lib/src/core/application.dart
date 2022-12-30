import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/core/i18n/l10n.dart';
import 'package:flutter_boilerplate/src/core/routing/app_router.dart';
import 'package:flutter_boilerplate/src/core/theme/app_theme.dart';
import 'package:flutter_boilerplate/src/shared/locator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = locator<AppRouter>();

    return MaterialApp.router(
      title: 'MyApp',
      routerDelegate: appRouter.delegate(),
      routeInformationProvider: appRouter.routeInfoProvider(),
      routeInformationParser: appRouter.defaultRouteParser(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        I18n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
      ],
    );
  }
}
