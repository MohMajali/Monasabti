part of 'update_account_bloc.dart';

abstract class UpdateAccountEvent extends Equatable {
  const UpdateAccountEvent();

  @override
  List<Object> get props => [];
}

class StartEvent extends UpdateAccountEvent{

}

class UpdatAccountPressed extends UpdateAccountEvent {
  final String name, email, phone, password;
  final int id;

  UpdatAccountPressed(
      {required this.id,
      required this.name,
      required this.phone,
      required this.email,
      required this.password});
}
