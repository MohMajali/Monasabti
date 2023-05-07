import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/user_model.dart';
import '../../data/repo/user_repo.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  UserRepo userRepo;
  SignupBloc(SignupState initalState, this.userRepo) : super(initalState) {
    on<StartEvent>((event, emit) => emit(SignupInitState()));

    on<SignupButtonPressed>((event, emit) async {
      try {
      emit(SignupLoading());
        var user = await userRepo.signup(
            event.email!, event.password!, event.name!, event.phone!);
        if (!user.error!) {
          emit(UserSignupSuccess(user));
        } else {
          emit(const SignupErrorState(message: "User Already Registered"));
        }
      } catch (ex) {
        emit(const SignupErrorState(message: "User Already Registered"));
      }
    });
  }
}
