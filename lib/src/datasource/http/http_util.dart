import 'package:dio/dio.dart';
import 'package:flutter_kit/src/datasource/models/api_response/api_response.dart';

ApiError createApiErrorFromDioError(DioException error) {
  return ApiError(
    type: _getTypeFromDioError(error),
    statusCode: error.response?.statusCode ?? 0,
    error: error,
  );
}

ApiError unknownError(Object? e) {
  return ApiError(
    error: e,
    statusCode: 0,
    type: ApiErrorType.unknown,
  );
}

ApiErrorType _getTypeFromDioError(DioException error) {
  if (error.response?.statusCode.toString().startsWith('5') ?? false) {
    return ApiErrorType.server;
  } else if (error.response?.statusCode.toString().startsWith('4') ?? false) {
    return ApiErrorType.user;
  } else if (error.response == null) {
    return ApiErrorType.network;
  }
  return ApiErrorType.unknown;
}
