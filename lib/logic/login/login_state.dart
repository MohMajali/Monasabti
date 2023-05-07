part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => [];
}

class LoginInitState extends LoginState {}

class LoginClassState extends LoginState {}

class UserLoginSuccess extends LoginState {

  final UserModel userModel;

  const UserLoginSuccess(this.userModel);

    @override
  List<Object> get props => [userModel];
}

class LoginLoading extends LoginState {}

class LoginErrorState extends LoginState {
  final String? message;

  const LoginErrorState({this.message});
}
