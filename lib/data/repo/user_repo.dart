import 'dart:developer';

import 'package:monasabti/data/models/update_message.dart';
import 'package:monasabti/data/models/user_info_model.dart';
import 'package:monasabti/data/models/user_model.dart';
import '../services/authintication.dart';

class UserRepo {
  final UserService userService;
  UserRepo(this.userService);

  Future<UserModel> login(String email, String password) async {
    try {
      final user = await userService.login(email, password);

      if (!user['error']) {
        return UserModel.fromJson(user);
      }

      return UserModel(
          error: true,
          message: "Email Or Password Incorrect",
          user: User(
              id: 0, email: "", image: "", name: "", password: "", phone: ""));
    } catch (ex) {
      return UserModel(
          error: true,
          message: "Email Or Password Incorrect",
          user: User(
              id: 0, email: "", image: "", name: "", password: "", phone: ""));
    }
  }

  Future<UserModel> signup(
      String email, String password, String name, String phone) async {
    try {
      final user = await userService.signup(email, password, name, phone);

      if (!user['error']) {
        return UserModel.fromJson(user);
      }

      return UserModel(
          error: true,
          message: "User Already Register",
          user: User(
              id: 0, email: "", image: "", name: "", password: "", phone: ""));
    } catch (ex) {
      return UserModel(
          error: true,
          message: "User Already Register",
          user: User(
              id: 0, email: "", image: "", name: "", password: "", phone: ""));
    }
  }

  Future<UserInfoModel> getAccount(int clientId) async {
    try {
      final userInfo = await userService.getAccount(clientId);

      return UserInfoModel.fromJson(userInfo);
    } catch (ex) {
      return UserInfoModel(
          user: UserInfo(
              userId: 0,
              userEmail: "",
              userName: "",
              userPassword: "",
              userPhone: ""));
    }
  }

  Future<UpdatedMessage> updateAccount(int cliendId, String name, String email,
      String phone, String password) async {
    try {
      final updateInfo = await userService.updateAccount(
          cliendId, name, email, phone, password);

      if (!updateInfo['error']) {
        return UpdatedMessage.fromJson(updateInfo);
      }
      return UpdatedMessage(error: true, message: "Error In Updating");
    } catch (ex) {
      return UpdatedMessage(error: true, message: "Error In Updating $ex");
    }
  }
}
