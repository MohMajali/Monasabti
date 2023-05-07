import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:monasabti/data/end_points.dart';

class UserService {
  Future login(String email, String password) async {
    try {
      var response = await http.post(
          Uri.parse("${EndPoints.url}${EndPoints.login}"),
          body: {"email": email, "password": password});

      var userResponse = json.decode(response.body);
      // log("user $userResponse");

      return userResponse;
    } catch (ex) {
      log("ex $ex");
      return ex;
    }
  }

  Future signup(
      String email, String password, String name, String phone) async {
    try {
      var response = await http
          .post(Uri.parse("${EndPoints.url}${EndPoints.signup}"), body: {
        "email": email,
        "password": password,
        "name": name,
        "phone": phone,
      });

      var userResponse = json.decode(response.body);
      // log("user $userResponse");

      return userResponse;
    } catch (ex) {
      log("ex $ex");
      return ex;
    }
  }

  Future getAccount(int clientId) async {
    try {
      var response = await http
          .get(Uri.parse("${EndPoints.url}${EndPoints.getAccount}$clientId"));
      var userResponse = json.decode(response.body);
      // log("user $userResponse");

      return userResponse;
    } catch (ex) {
      return ex;
    }
  }

  Future updateAccount(int cliendId, String name, String email, String phone,
      String password) async {
    try {
      var response = await http
          .post(Uri.parse("${EndPoints.url}${EndPoints.updateAccount}"), body: {
        "email": email,
        "password": password,
        "name": name,
        "phone": phone,
        "client_id": "$cliendId"
      });

      var updateResponse = json.decode(response.body);

      return updateResponse;
    } catch (ex) {
      return ex;
    }
  }
}
