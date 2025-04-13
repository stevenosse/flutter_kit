import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_kit/src/datasource/models/api_response/api_response.dart';
import 'package:flutter_kit/src/datasource/repositories/example_repository.dart';
import 'package:flutter_kit/src/shared/locator.dart';

part 'login_state.dart';

class LoginController extends ValueNotifier<LoginState> {
  final ExampleRepository _exampleRepository;

  LoginController({
    ExampleRepository? exampleRepository,
  })  : _exampleRepository = exampleRepository ?? locator<ExampleRepository>(),
        super(LoginInitial(email: '', password: ''));

  void onEmailChanged(String email) {
    value = LoginInitial(email: email, password: value.password);
  }

  void onPasswordChanged(String password) {
    value = LoginInitial(password: password, email: value.email);
  }

  Future<void> login() async {
    value = LoginLoading(email: value.email, password: value.password);

    final response = await _exampleRepository.getExample();

    response.when(
      success: (data) => value = LoginSuccess(email: value.email, password: value.password, response: data),
      error: (error) => value = LoginError(email: value.email, password: value.password, error: error),
    );
  }

  void reset() => value = LoginInitial(email: '', password: '');
}
