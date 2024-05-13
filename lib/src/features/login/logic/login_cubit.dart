import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial(email: '', password: ''));

  void onEmailChanged(String email) {
    emit(LoginState.initial(email: email, password: state.password));
  }

  void onPasswordChanged(String password) {
    emit(LoginState.initial(password: password, email: state.email));
  }

  void login() async {
    emit(LoginState.loading(email: state.email, password: state.password));

    await Future.delayed(const Duration(seconds: 2));

    emit(LoginState.success(email: state.email, password: state.password, response: 'response'));
  }
}
