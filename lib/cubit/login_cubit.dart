import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_login_ui_cubit/repository/login_object_repo.dart';

import '../models/user/user_object.dart';

part 'login_state.dart';

//This class asks repository to provide data
class LoginCubit extends Cubit<LoginState> {
  final LoginObjectRepository _loginObjectRepository;
  LoginCubit(this._loginObjectRepository) : super(const LoginInitial());

  Future<void> getLoginData(String email, String password) async {
    try {
      emit(const LoginLoading());
      final loginObject =
          await _loginObjectRepository.fetchLoginObject(email, password);
      emit(LoginSuccess(loginObject));
    } on Exception {
      emit(const LoginError("Couldn't authenticate data!"));
    }
  }
}
