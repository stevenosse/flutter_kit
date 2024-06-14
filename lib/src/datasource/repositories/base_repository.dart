import 'package:dio/dio.dart';
import 'package:flutter_kit/src/datasource/http/http_util.dart';
import 'package:flutter_kit/src/datasource/models/api_response/api_response.dart';

typedef ApiCall<T> = Future<T> Function();

abstract class BaseRepository {
  Future<ApiResponse<T, ApiError>> runApiCall<T>({required ApiCall<ApiResponse<T, ApiError>> call}) async {
    try {
      final response = await call();
      return response;
    } on DioException catch (e) {
      return ApiResponse.error(createApiErrorFromDioError(e));
    } catch (e) {
      return ApiResponse.error(unknownError(e));
    }
  }
}
