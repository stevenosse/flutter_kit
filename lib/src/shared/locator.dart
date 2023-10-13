import 'package:flutter_boilerplate/src/core/routing/app_router.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance..registerLazySingleton(() => AppRouter());