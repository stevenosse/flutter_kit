part of 'login_controller.dart';

sealed class LoginState extends Equatable {
  final String email;
  final String password;

  const LoginState({
    required this.email,
    required this.password,
  });

  const factory LoginState.initial({
    required String email,
    required String password,
  }) = _LoginInitial;

  const factory LoginState.loading({
    required String email,
    required String password,
  }) = _LoginLoading;

  const factory LoginState.error({
    required String email,
    required String password,
    required ApiError error,
  }) = _LoginError;

  const factory LoginState.success({
    required String email,
    required String password,
    required Object response,
  }) = _LoginSuccess;

  void when({
    required void Function(String email, String password) initial,
    required void Function(String email, String password) loading,
    required void Function(String email, String password, ApiError error) error,
    required void Function(String email, String password, Object response) success,
  }) {
    if (this is _LoginInitial) {
      initial(email, password);
    } else if (this is _LoginLoading) {
      loading(email, password);
    } else if (this is _LoginError) {
      error(email, password, (this as _LoginError).error);
    } else if (this is _LoginSuccess) {
      success(email, password, (this as _LoginSuccess).response);
    }
  }

  void whenOrNull({
    void Function(String email, String password)? initial,
    void Function(String email, String password)? loading,
    void Function(String email, String password, ApiError error)? error,
    void Function(String email, String password, Object response)? success,
  }) {
    if (this is _LoginInitial) {
      initial?.call(email, password);
    } else if (this is _LoginLoading) {
      loading?.call(email, password);
    } else if (this is _LoginError) {
      error?.call(email, password, (this as _LoginError).error);
    } else if (this is _LoginSuccess) {
      success?.call(email, password, (this as _LoginSuccess).response);
    }
  }
}

final class _LoginInitial extends LoginState {
  const _LoginInitial({required super.email, required super.password});

  @override
  List<Object?> get props => [email, password];
}

final class _LoginLoading extends LoginState {
  const _LoginLoading({required super.email, required super.password});

  @override
  List<Object?> get props => [email, password];
}

final class _LoginError extends LoginState {
  final ApiError error;

  const _LoginError({
    required super.email,
    required super.password,
    required this.error,
  });

  @override
  List<Object?> get props => [email, password, error];
}

final class _LoginSuccess extends LoginState {
  final Object response;

  const _LoginSuccess({
    required super.email,
    required super.password,
    required this.response,
  });

  @override
  List<Object?> get props => [email, password, response];
}
