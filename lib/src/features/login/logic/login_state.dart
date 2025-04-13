part of 'login_controller.dart';

sealed class LoginState extends Equatable {
  final String email;
  final String password;

  const LoginState({
    required this.email,
    required this.password,
  });
}

final class LoginInitial extends LoginState {
  const LoginInitial({required super.email, required super.password});

  @override
  List<Object?> get props => [email, password];
}

final class LoginLoading extends LoginState {
  const LoginLoading({required super.email, required super.password});

  @override
  List<Object?> get props => [email, password];
}

final class LoginError extends LoginState {
  final ApiError error;

  const LoginError({
    required super.email,
    required super.password,
    required this.error,
  });

  @override
  List<Object?> get props => [email, password, error];
}

final class LoginSuccess extends LoginState {
  final Object response;

  const LoginSuccess({
    required super.email,
    required super.password,
    required this.response,
  });

  @override
  List<Object?> get props => [email, password, response];
}
