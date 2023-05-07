import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasabti/data/models/user_info_model.dart';
import 'package:monasabti/logic/update/bloc/update_account_bloc.dart';
import 'package:monasabti/logic/user_info/cubit/user_info_cubit.dart';
import 'package:monasabti/main.dart';

import '../../../../constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserInfoModel user =
        BlocProvider.of<UserInfoCubit>(context).state.props[0] as UserInfoModel;
    final formKey = GlobalKey<FormState>();
    TextEditingController emailCont = TextEditingController();
    TextEditingController passCont = TextEditingController();
    TextEditingController nameCont = TextEditingController();
    TextEditingController phoneCont = TextEditingController();

    emailCont.text = user.user.userEmail;
    passCont.text = user.user.userPassword;
    nameCont.text = user.user.userName;
    phoneCont.text = user.user.userPhone;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Account"),
        centerTitle: true,
        backgroundColor: darkBlue,
      ),
      body: BlocListener<UpdateAccountBloc, UpdateAccountState>(
        listener: (context, state) {
          if (state is UpdatAccountLoading) {
            const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UpdatAccountSuccess) {
            SuccessAlertBox(
                title: "Update Account",
                context: context,
                messageText: "Account Updated Succesfully",
                buttonColor: darkBlue,
                icon: Icons.check_circle,
                titleTextColor: darkBlue);

            BlocProvider.of<UserInfoCubit>(context)
                .getAccount(pref!.getInt("id")!);
          } else if (state is UpdatedAccountError) {
            WarningAlertBoxCenter(messageText: state.message, context: context);
          }
        },
        child: SingleChildScrollView(
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  imageLogo(),
                  const SizedBox(height: 20),
                  nameInput(nameCont, user.user.userName),
                  phoneInput(phoneCont, user.user.userPhone),
                  emailInput(emailCont, user.user.userEmail),
                  passwordInput(passCont, user.user.userPassword),
                  const SizedBox(height: 10),
                  button(
                    text: "Update",
                    press: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<UpdateAccountBloc>(context).add(
                            UpdatAccountPressed(
                                email: emailCont.text,
                                name: nameCont.text,
                                password: passCont.text,
                                phone: phoneCont.text,
                                id: pref!.getInt("id")!));
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              )),
        ),
      ),
    );
  }

  Padding emailInput(TextEditingController emailCont, String email) {
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
            hintText: email,
            icon: const Icon(
              Icons.email,
              color: lightblue,
            )),
      ),
    );
  }

  Padding passwordInput(TextEditingController passCont, String password) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        controller: passCont,
        // obscureText: true,

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
            hintText: password,
            icon: const Icon(
              Icons.lock,
              color: lightblue,
            )),
      ),
    );
  }

  Padding nameInput(TextEditingController nameCont, String username) {
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
            hintText: username,
            icon: const Icon(
              Icons.person,
              color: lightblue,
            )),
      ),
    );
  }

  Padding phoneInput(TextEditingController phoneCont, String phone) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
        ],
        keyboardType: TextInputType.phone,
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
          hintText: phone,
          icon: const Icon(
            Icons.phone,
            color: lightblue,
          ),
        ),
      ),
    );
  }
}
