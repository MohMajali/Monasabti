part of 'update_account_bloc.dart';

abstract class UpdateAccountState extends Equatable {
  const UpdateAccountState();
  
  @override
  List<Object> get props => [];
}

class UpdateAccountInitial extends UpdateAccountState {}

class UpdatAccountLoading extends UpdateAccountState {}

class UpdatAccountSuccess extends UpdateAccountState {
  UpdatedMessage message;
  UpdatAccountSuccess({
    required this.message,
  });
}

class UpdatedAccountError extends UpdateAccountState {
  final String message;

  const UpdatedAccountError(this.message);
}
