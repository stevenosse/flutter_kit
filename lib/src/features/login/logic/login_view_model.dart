import 'package:flutter_kit/src/datasource/models/api_response/api_response.dart';
import 'package:flutter_kit/src/datasource/repositories/example_repository.dart';
import 'package:flutter_kit/src/shared/architecture/view_model.dart';
import 'package:flutter_kit/src/shared/locator.dart';

part 'login_state.dart';

class LoginViewModel extends ViewModel<LoginState> {
  final ExampleRepository _exampleRepository;

  LoginViewModel({
    ExampleRepository? exampleRepository,
  })  : _exampleRepository = exampleRepository ?? locator<ExampleRepository>(),
        super(const LoginInitial(email: '', password: ''));

  void onEmailChanged(String email) {
    updateState(LoginInitial(email: email, password: state.password));
  }

  void onPasswordChanged(String password) {
    updateState(LoginInitial(password: password, email: state.email));
  }

  Future<void> login() async {
    updateState(LoginLoading(email: state.email, password: state.password));

    final response = await _exampleRepository.getExample();

    response.when(
      success: (data) => updateState(LoginSuccess(email: state.email, password: state.password, response: data)),
      error: (error) => updateState(LoginError(email: state.email, password: state.password, error: error)),
    );
  }

  void reset() => updateState(const LoginInitial(email: '', password: ''));
}
