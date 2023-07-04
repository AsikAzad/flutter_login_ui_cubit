part of 'login_cubit.dart';

//This class defines all the state for Login
//Equitable class is for compare objects
abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  final UserObject userObject;
  const LoginSuccess(this.userObject);

  @override
  List<Object> get props => [userObject];
}

class LoginError extends LoginState {
  final String message;
  const LoginError(this.message);

  @override
  List<Object> get props => [message];
}
