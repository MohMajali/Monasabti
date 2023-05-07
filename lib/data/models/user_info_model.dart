// To parse this JSON data, do
//
//     final userInfoModel = userInfoModelFromJson(jsonString);

import 'dart:convert';

UserInfoModel userInfoModelFromJson(String str) => UserInfoModel.fromJson(json.decode(str));


class UserInfoModel {
    UserInfoModel({
        required this.user,
    });

    final UserInfo user;

    factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        user: UserInfo.fromJson(json["userinfo"]),
    );
}

class UserInfo {
    UserInfo({
        required this.userId,
        required this.userName,
        required this.userEmail,
        required this.userPhone,
        required this.userPassword,
    });

    final int userId;
    final String userName;
    final String userEmail;
    final String userPhone;
    final String userPassword;

    factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        userId: json["userId"],
        userName: json["userName"],
        userEmail: json["userEmail"],
        userPhone: json["userPhone"],
        userPassword: json["userPassword"],
    );
}
