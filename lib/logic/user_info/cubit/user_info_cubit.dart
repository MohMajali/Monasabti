import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:monasabti/data/models/user_info_model.dart';
import 'package:monasabti/data/repo/user_repo.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserRepo userRepo;
  UserInfoModel info = UserInfoModel(
      user: UserInfo(
          userId: 0,
          userName: "",
          userEmail: "",
          userPhone: "",
          userPassword: ""));
  UserInfoCubit(this.userRepo) : super(UserInfoInitial());

  UserInfoModel getAccount(int clientId) {
    userRepo.getAccount(clientId).then((info) {
      emit(UserInfoSuccess(info: info));
      this.info = info;
    });
    return info;
  }
}
