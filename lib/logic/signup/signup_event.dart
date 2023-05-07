part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class StartEvent extends SignupEvent {}

class SignupButtonPressed extends SignupEvent {
  final String? email;
  final String? password;
  final String? name;
  final String? phone;

  const SignupButtonPressed({this.email, this.password, this.name, this.phone});
}
