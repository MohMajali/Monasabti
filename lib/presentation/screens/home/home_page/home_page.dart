import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasabti/constants.dart';
import 'package:monasabti/data/models/advertisment_model.dart';
import 'package:monasabti/data/models/types.dart';
import 'package:monasabti/data/models/user_info_model.dart';
import 'package:monasabti/logic/advertisments/cubit/advertisments_cubit.dart';
import 'package:monasabti/logic/types/cubit/types_cubit.dart';
import 'package:monasabti/logic/user_info/cubit/user_info_cubit.dart';
import 'package:monasabti/main.dart';
import 'package:monasabti/presentation/screens/authentication/login/login_screen.dart';
import 'package:monasabti/presentation/screens/home/home_page/home_body/home_body.dart';

import '../../../../data/models/provider_model.dart';
import '../../../../logic/providers/cubit/providers_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    // UserModel user =
    //     BlocProvider.of<LoginBloc>(context).state.props[0] as UserModel;

    ProviderModel providers =
        BlocProvider.of<ProvidersCubit>(context).getAllProviders();

    AdvertismentModel advertisments =
        BlocProvider.of<AdvertismentsCubit>(context).getAdvertisments();

    TypeModel types = BlocProvider.of<TypesCubit>(context).getTypes();

    UserInfoModel info =
        BlocProvider.of<UserInfoCubit>(context).getAccount(pref!.getInt("id")!);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
          centerTitle: true,
          backgroundColor: darkBlue,
          actions: [
            IconButton(
                onPressed: () {
                  pref!.clear();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                      (route) => false);
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: HomeBody(
          width: width,
          height: height,
          advertisments: advertisments,
          types: types,
          info: info,
        ));
  }
}
