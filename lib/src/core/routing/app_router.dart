import 'package:auto_route/auto_route.dart';
import 'package:flutter_kit/src/features/login/ui/login_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> routes = [
    AutoRoute(page: LoginRoute.page, initial: true),
  ];
}
