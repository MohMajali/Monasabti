import 'package:flutter/material.dart';
import 'package:monasabti/main.dart';

import '../../../../../constants.dart';
import '../../../../../data/models/user_model.dart';

class WelcomeUser extends StatelessWidget {
  String userName;
  WelcomeUser({Key? key, required this.userName}) : super(key: key);

  // final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Text(
      "Hello $userName",
      style: const TextStyle(
          color: offWhite, fontSize: 20, fontWeight: FontWeight.w500),
    );
  }
}
