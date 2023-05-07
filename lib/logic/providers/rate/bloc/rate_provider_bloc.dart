import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:monasabti/data/models/update_message.dart';
import 'package:monasabti/data/repo/provider_repo.dart';

part 'rate_provider_event.dart';
part 'rate_provider_state.dart';

class RateProviderBloc extends Bloc<RateProviderEvent, RateProviderState> {
  ProviderRepo providerRepo;
  RateProviderBloc(this.providerRepo) : super(RateProviderInitial()) {
    on<StartEvent>((event, emit) => emit(RateProviderInitial()));

    on<RatePressed>((event, emit) async {
      try {
        emit(RateLoading());
        var rateRes = await providerRepo.rateProvider(
            event.clinetId, event.providerId, event.rate);

        if (!rateRes.error!) {
          emit(RateSuccess(updatedMessage: rateRes));
        } else {
          emit(const RateError("Error In Rating"));
        }
      } catch (ex) {
        emit(RateError("Error In Rating $ex"));
      }
    });
  }
}
