import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasabti/logic/signup/signup_bloc.dart';

import '../../../../constants.dart';
import 'signspbody/singup_body.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignupBloc signupBloc = BlocProvider.of<SignupBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Signup Page",
            style: TextStyle(
                color: offWhite, fontSize: 25, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        backgroundColor: darkBlue,
        ),
        body: SignUpBody(signupBloc: signupBloc));
  }
}
