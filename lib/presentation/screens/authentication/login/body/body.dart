import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasabti/presentation/screens/authentication/signup/signup_screen.dart';
import 'package:monasabti/presentation/screens/home/home_screen.dart';
import '../../../../../constants.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';

import '../../../../../logic/login/login_bloc.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  final LoginBloc loginBloc;
  Body({Key? key, required this.loginBloc}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();

  // Future test(List<dynamic> search) async {
  //   try {
  //     String searches = search.toString();
  //     searches = searches.replaceAll("[", "");
  //     searches = searches.replaceAll("]", "");
  //     var map = <String, String>{};
  //     map['searchKeys[]'] = searches;

  //     log("searches11111 $searches");

  //     Map data = {"searchKeys": search};
  //     // data['searchKeys'] = searches;
  //     var body = json.encode(data);
  //     var response = await http.post(
  //         Uri.parse("https://www.farawla.me/News/apis/SearchNews.php"),
  //         body: body);

  //     log("encoded ${response.body}");
  //     // var userResponse = json.decode(respStr);
  //     log("decoded ${response.body}");
  //   } catch (ex) {
  //     log("ex ${ex}");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          const Center(
            child: CircularProgressIndicator(color: Colors.blue),
          );
        } else if (state is LoginErrorState) {
          WarningAlertBoxCenter(
              messageText: "Email Or Password is Incorrect",
              // icon: Icons.alarm,
              context: context,
              titleTextColor: Colors.red);
        } else if (state is UserLoginSuccess) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              (route) => false);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                imageLogo(),
                const SizedBox(height: 20),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        emailInput(),
                        passwordInput(),
                        const SizedBox(height: 10),
                        forgotPassword(),
                        const SizedBox(height: 10),
                        button(
                          text: "Login",
                          press: () async {
                            // List<dynamic> search = ['Sports', 'Basket Ball'];
                            // await test(search);
                            if (_formKey.currentState!.validate()) {
                              widget.loginBloc.add(LoginButtonPressed(
                                  email: emailCont.text,
                                  password: passCont.text));
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        divider(),
                        const SizedBox(height: 10),
                        button(
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignupScreen(),
                                  ));
                            },
                            text: "Signup"),
                      ],
                    )),
              ],
            ),
          );
        },
      ),
    );
  }

  Padding forgotPassword() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              log("gello");
            },
            child: const Text(
              "Forgot Password?",
              style: TextStyle(color: lightblue, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }

  Padding emailInput() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: emailCont,
        validator: (email) {
          if (email!.isEmpty) {
            return 'Please fill';
          }
          // return '';
        },
        decoration: decoration(
            labelText: 'Email',
            hintText: 'Enter You Email Address',
            icon: const Icon(
              Icons.email,
              color: lightblue,
            )),
      ),
    );
  }

  Padding passwordInput() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        controller: passCont,
        validator: (pass) {
          if (pass!.isEmpty) {
            return 'Please fill';
          }
          // return '';
        },
        decoration: decoration(
            labelText: 'Password',
            hintText: 'Enter You Password',
            icon: const Icon(
              Icons.lock,
              color: lightblue,
            )),
      ),
    );
  }
}
