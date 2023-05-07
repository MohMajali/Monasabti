import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasabti/logic/signup/signup_bloc.dart';
import '../../../../../constants.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';

class SignUpBody extends StatefulWidget {
  final SignupBloc signupBloc;
  SignUpBody({Key? key, required this.signupBloc}) : super(key: key);

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameCont = TextEditingController();
  TextEditingController phoneCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();
  TextEditingController passConfirmCont = TextEditingController();

  bool visiblePass = true;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is SignupLoading) {
          const Center(
            child: CircularProgressIndicator(color: Colors.blue),
          );
        } else if (state is SignupErrorState) {
          WarningAlertBoxCenter(
              messageText: "User Already Registered",
              // icon: Icons.alarm,
              context: context,
              titleTextColor: Colors.red);
        } else if (state is UserSignupSuccess) {
          SuccessAlertBox(
              context: context,
              title: "Signup Success",
              messageText: "Success",
              buttonColor: darkBlue,
              icon: Icons.check_circle,
              titleTextColor: darkBlue);
        }
      },
      child: BlocBuilder<SignupBloc, SignupState>(
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
                        nameInput(),
                        const SizedBox(height: 10),
                        emailInput(),
                        const SizedBox(height: 10),
                        phoneInput(),
                        const SizedBox(height: 10),
                        passwordInput(),
                        const SizedBox(height: 10),
                        passwordConInput(),
                        const SizedBox(height: 10),
                        button(
                            press: () {
                              if (_formKey.currentState!.validate()) {
                                if (passCont.text != passConfirmCont.text) {
                                  WarningAlertBoxCenter(
                                      messageText: "Passwords Doesn't Match",
                                      // icon: Icons.alarm,
                                      context: context,
                                      titleTextColor: Colors.red);
                                } else {
                                  widget.signupBloc.add(SignupButtonPressed(
                                      name: nameCont.text,
                                      email: emailCont.text,
                                      phone: phoneCont.text,
                                      password: passCont.text));
                                }
                              }
                            },
                            text: "Signup"),
                        const SizedBox(height: 10),
                      ],
                    ))
              ],
            ),
          );
        },
      ),
    );
  }

  Padding nameInput() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: nameCont,
        validator: (name) {
          if (name!.isEmpty) {
            return 'Please fill';
          }
          // return '';
        },
        decoration: decoration(
            labelText: 'User Name',
            hintText: 'Enter Your Name',
            icon: const Icon(
              Icons.person,
              color: lightblue,
            )),
      ),
    );
  }

  Padding phoneInput() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
        ],
        controller: phoneCont,
        validator: (phone) {
          if (phone!.isEmpty) {
            return 'Please fill';
          } else if (phone.length != 10) {
            return 'Phone Number Must Be 10 Digits';
          }
          // return '';
        },
        decoration: decoration(
            labelText: 'Phone Number',
            hintText: 'Enter Your Phone Number',
            icon: const Icon(
              Icons.phone,
              color: lightblue,
            )),
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
          } else if (!email.contains("@")) {
            return 'Please Put Valid Email Address';
          }
          // return '';
        },
        decoration: decoration(
            labelText: 'Email',
            hintText: 'Enter Your Email Address',
            icon: const Icon(
              Icons.email,
              color: lightblue,
            )),
      ),
    );
  }

  Padding passwordInput() {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        // keyboardType: TextInputType.pass,
        obscureText: visiblePass,
        controller: passCont,
        validator: (pass) {
          if (pass!.isEmpty) {
            return 'Please fill';
          } else if (!regex.hasMatch(pass)) {
            return 'Password Must Be Minimum 1 Uppercase, Minimum Lowercase, Minimum 1 Numeric Number, Minimum 1 Special Character';
          }
          // return '';
        },
        decoration: decoration(
            labelText: 'Password',
            hintText: 'Enter Your Password',
            icon: const Icon(
              Icons.lock,
              color: lightblue,
            )),
      ),
    );
  }

  Padding passwordConInput() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        // keyboardType: TextInputType.visiblePassword,
        obscureText: visiblePass,
        controller: passConfirmCont,
        validator: (conPass) {
          if (conPass!.isEmpty) {
            return 'Please fill';
          }
          // return '';
        },
        decoration: decoration(
            labelText: 'Confirm Password',
            hintText: 'Confirm Password',
            icon: const Icon(
              Icons.lock,
              color: lightblue,
            )),
      ),
    );
  }
}
