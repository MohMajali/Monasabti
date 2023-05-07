import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:monasabti/data/models/advertisment_model.dart';
import 'package:monasabti/data/repo/advertisments.dart';

part 'advertisments_state.dart';

class AdvertismentsCubit extends Cubit<AdvertismentsState> {
  AdvertismentRepo advertismentRepo;
  AdvertismentModel advertisments = AdvertismentModel(message: "", advertisments: []);

  AdvertismentsCubit(this.advertismentRepo) : super(AdvertismentsInitial());

  AdvertismentModel getAdvertisments(){
    advertismentRepo.getAdvertisments().then((advertisments) {
      emit(AdvertisementsLoaded(advertisments));
      this.advertisments = advertisments;
    });
    return advertisments;
  }
}
