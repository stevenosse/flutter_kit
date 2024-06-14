part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState.initial({
    required String email,
    required String password,
  }) = _Initial;

  factory LoginState.loading({
    required String email,
    required String password,
  }) = _Loading;

  factory LoginState.error({
    required String email,
    required String password,
    required ApiError error,
  }) = _Error;

  factory LoginState.success({
    required String email,
    required String password,
    required Object response,
  }) = _Success;
}
