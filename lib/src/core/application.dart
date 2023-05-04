import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/core/i18n/l10n.dart';
import 'package:flutter_boilerplate/src/core/routing/app_router.dart';
import 'package:flutter_boilerplate/src/core/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Application extends StatelessWidget {
  Application({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MyApp',
      routerConfig: _appRouter.config(),
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
