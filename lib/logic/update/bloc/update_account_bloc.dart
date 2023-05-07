import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:monasabti/data/models/update_message.dart';
import 'package:monasabti/data/repo/user_repo.dart';

part 'update_account_event.dart';
part 'update_account_state.dart';

class UpdateAccountBloc extends Bloc<UpdateAccountEvent, UpdateAccountState> {
  UserRepo userRepo;
  UpdateAccountBloc(this.userRepo) : super(UpdateAccountInitial()) {
    on<StartEvent>((event, emit) => emit(UpdateAccountInitial()));

    on<UpdatAccountPressed>((event, emit) async {
      try {
        emit(UpdatAccountLoading());
        var update = await userRepo.updateAccount(
            event.id, event.name, event.email, event.phone, event.password);

        if (!update.error!) {
          emit(UpdatAccountSuccess(message: update));
        } else {
          emit(UpdatedAccountError("${update.message}"));
        }
      } catch (ex) {
        emit(UpdatedAccountError("Error In Updating $ex"));
      }
    });
  }
}
