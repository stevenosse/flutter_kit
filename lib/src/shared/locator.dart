import 'package:flutter_kit/src/core/routing/app_router.dart';
import 'package:flutter_kit/src/datasource/http/dio_config.dart';
import 'package:flutter_kit/src/datasource/http/example_api.dart';
import 'package:flutter_kit/src/datasource/repositories/example_repository.dart';
import 'package:flutter_kit/src/shared/services/app_logger.dart';
import 'package:flutter_kit/src/shared/services/storage/local_storage.dart';
import 'package:flutter_kit/src/shared/services/storage/storage.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance
  ..registerLazySingleton(() => DioConfig())
  ..registerLazySingleton(() => AppRouter())
  ..registerLazySingleton<AppLogger>(() => AppLogger())
  ..registerLazySingleton<Storage>(() => LocalStorage())
  ..registerLazySingleton(() => ExampleApi(dio: locator<DioConfig>().dio))
  ..registerLazySingleton(() => ExampleRepository());
