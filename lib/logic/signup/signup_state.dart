part of 'signup_bloc.dart';

abstract class SignupState extends Equatable {
  const SignupState();
  
  @override
  List<Object> get props => [];
}

class SignupInitState extends SignupState {}

class SignupClassState extends SignupState {}

class UserSignupSuccess extends SignupState {

  final UserModel userModel;

  const UserSignupSuccess(this.userModel);

    @override
  List<Object> get props => [userModel];
}

class SignupLoading extends SignupState {}

class SignupErrorState extends SignupState {
  final String? message;

  const SignupErrorState({this.message});
}
