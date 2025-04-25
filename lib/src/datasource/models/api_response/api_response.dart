import 'package:equatable/equatable.dart';

sealed class ApiResponse<R, E> {
  const ApiResponse();

  factory ApiResponse.success(R response) = ApiResponseSuccess;
  factory ApiResponse.error(E response) = ApiResponseError;

  void when({
    required void Function(R data) success,
    required void Function(E error) error,
  }) {
    switch (this) {
      case ApiResponseSuccess<R, E> success_:
        success(success_.response);
      case ApiResponseError<R, E> error_:
        error(error_.response);
    }
  }
}

final class ApiResponseSuccess<R, E> extends ApiResponse<R, E> {
  final R response;

  const ApiResponseSuccess(this.response);
}

final class ApiResponseError<R, E> extends ApiResponse<R, E> {
  final E response;

  const ApiResponseError(this.response);
}

enum ApiErrorType {
  /// Something went wrong on the server side
  server,

  /// Something's wrong with the network request
  network,

  /// User did something wrong
  user,

  /// The error is unidentified
  unknown,
}

class ApiError<T> extends Equatable {
  final ApiErrorType type;
  final int statusCode;
  final T error;

  const ApiError({
    required this.type,
    required this.error,
    required this.statusCode,
  });

  @override
  List<Object?> get props => [type, error];
}
