import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasabti/data/repo/advertisments.dart';
import 'package:monasabti/data/repo/provider_repo.dart';
import 'package:monasabti/data/repo/reservation.dart';
import 'package:monasabti/data/repo/user_repo.dart';
import 'package:monasabti/data/services/advertisments.dart';
import 'package:monasabti/data/services/authintication.dart';
import 'package:monasabti/data/services/providers.dart';
import 'package:monasabti/data/services/reservation.dart';
import 'package:monasabti/logic/advertisments/cubit/advertisments_cubit.dart';
import 'package:monasabti/logic/providers/cubit/providers_cubit.dart';
import 'package:monasabti/logic/providers/rate/bloc/rate_provider_bloc.dart';
import 'package:monasabti/logic/reservation/bloc/reservation_bloc.dart';
import 'package:monasabti/logic/user_info/cubit/user_info_cubit.dart';
import 'package:monasabti/presentation/screens/authentication/login/login_screen.dart';
import 'package:monasabti/presentation/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'logic/login/login_bloc.dart';
import 'logic/signup/signup_bloc.dart';
import 'logic/types/cubit/types_cubit.dart';
import 'logic/update/bloc/update_account_bloc.dart';

SharedPreferences? pref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  pref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  LoginBloc(LoginInitState(), UserRepo(UserService()))),
          BlocProvider(
              create: (context) =>
                  SignupBloc(SignupInitState(), UserRepo(UserService()))),
          BlocProvider(
            create: (context) =>
                ProvidersCubit(ProviderRepo(ProviderService())),
          ),
          BlocProvider(
            create: (context) => TypesCubit(ProviderRepo(ProviderService())),
          ),
          BlocProvider(
            create: (context) =>
                AdvertismentsCubit(AdvertismentRepo(AdvertismentsService())),
          ),
          BlocProvider(
            create: (context) => ReservationBloc(
                ReservationInitial(), ReservationRepo(ReservationService())),
          ),
          BlocProvider(
            create: (context) => UserInfoCubit(UserRepo(UserService())),
          ),
          BlocProvider(
            create: (context) => UpdateAccountBloc(UserRepo(UserService())),
          ),
          BlocProvider(
            create: (context) =>
                RateProviderBloc(ProviderRepo(ProviderService())),
          ),
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: pref!.getInt("id") != null
                ? const HomeScreen()
                : const LoginScreen()));
  }
}
