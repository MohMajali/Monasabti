import 'package:flutter/material.dart';
import 'package:monasabti/data/models/types.dart';
import '../../../../../data/models/advertisment_model.dart';
import '../../../../../data/models/provider_model.dart';
import '../../../../../data/models/user_info_model.dart';
import 'container_borders.dart';
import 'intro.dart';

class HomeBody extends StatelessWidget {
  double width, height;
  // UserModel user;
  AdvertismentModel advertisments;
  TypeModel types;
  UserInfoModel info;
  HomeBody(
      {Key? key,
      required this.width,
      required this.height,
      required this.advertisments,
      required this.types,
      required this.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          ContainerBorders(width: width, height: height),
          Introduction(types: types, advertisments: advertisments, info: info),
        ],
      ),
    );
  }
}
