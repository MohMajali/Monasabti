part of 'user_info_cubit.dart';

abstract class UserInfoState extends Equatable {
  const UserInfoState();

  @override
  List<Object> get props => [];
}

class UserInfoInitial extends UserInfoState {}

class UserInfoSuccess extends UserInfoState {
  UserInfoModel info;
  UserInfoSuccess({
    required this.info,
  });

  @override
  List<Object> get props => [info];
}

class UserInfoError extends UserInfoState {
  final String message;

  const UserInfoError(this.message);
}
