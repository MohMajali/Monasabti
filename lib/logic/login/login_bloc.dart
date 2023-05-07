import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:monasabti/data/repo/user_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/user_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepo userRepo;
  LoginBloc(LoginState initalState, this.userRepo) : super(initalState) {
    on<StartEvent>((event, emit) => emit(LoginInitState()));

    on<LoginButtonPressed>((event, emit) async {
      var pref = await SharedPreferences.getInstance();
      try {
        emit(LoginLoading());
        var user = await userRepo.login(event.email!, event.password!);
        if (!user.error!) {
          await pref.setInt("id", user.user!.id!);
          emit(UserLoginSuccess(user));
        } else {
          emit(const LoginErrorState(message: "Email Or Password Incorrect"));
        }
      } catch (ex) {
        emit(const LoginErrorState(message: "Email Or Password Incorrect"));
      }
    });
  }
}
