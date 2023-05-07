part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class StartEvent extends LoginEvent{

}

class LoginButtonPressed extends LoginEvent {

  final String? email;
  final String? password;

  const LoginButtonPressed({
    this.email,
    this.password
  });

  
}
