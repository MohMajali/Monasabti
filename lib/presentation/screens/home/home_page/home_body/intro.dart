import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasabti/data/models/advertisment_model.dart';
import 'package:monasabti/data/models/provider_model.dart';
import 'package:monasabti/data/models/types.dart';
import 'package:monasabti/data/models/user_info_model.dart';
import 'package:monasabti/logic/user_info/cubit/user_info_cubit.dart';
import 'package:monasabti/presentation/screens/home/home_page/home_body/provider_list.dart';
import 'package:monasabti/presentation/screens/home/home_page/home_body/type_list.dart';
import 'package:monasabti/presentation/screens/home/home_page/home_body/user_image.dart';
import 'package:monasabti/presentation/screens/home/home_page/home_body/welcome_user.dart';
import '../../../../../constants.dart';
import 'advertisments_list.dart';

class Introduction extends StatelessWidget {
  Introduction(
      {Key? key,
      required this.types,
      required this.advertisments,
      required this.info})
      : super(key: key);

  // final UserModel user;
  TypeModel types;
  AdvertismentModel advertisments;
  UserInfoModel info;
  // ProviderModel providers;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoCubit, UserInfoState>(
      builder: (context, state) {
        if (state is UserInfoSuccess) {
          // log("${state.info.user.userName}");
          return Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const UserImage(),
                      const SizedBox(height: 15),
                      WelcomeUser(userName: state.info.user.userName),
                      const SizedBox(height: 10),
                      const Text(
                        "Your Rest is Our\nFirst Priority",
                        style: TextStyle(
                            color: offWhite,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),

                // Types
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Types",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: darkBlue.withOpacity(0.7),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const TypeList(),
                const SizedBox(height: 50),

                // Providers
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Providers",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: darkBlue.withOpacity(0.7),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                ProivderList(),
                const SizedBox(height: 50),

                // Advertisements
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Advertisements",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: darkBlue.withOpacity(0.7),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const AdvertismentsList(),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
