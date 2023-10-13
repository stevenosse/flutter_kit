import 'package:auto_route/auto_route.dart';
import 'package:flutter_boilerplate/src/features/home_screen/ui/home_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> routes = [
    AutoRoute(page: HomeRoute.page, initial: true),
  ];

}