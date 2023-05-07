import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:monasabti/data/models/provider_details_model.dart';
import 'package:monasabti/data/models/provider_model.dart';
import 'package:monasabti/data/repo/provider_repo.dart';

part 'providers_state.dart';

class ProvidersCubit extends Cubit<ProvidersState> {
  ProviderRepo providerRepo;
  ProviderModel providers = ProviderModel(message: "", providers: []);
  ProviderDetailsModel images = ProviderDetailsModel(images: Images(message: "", images: []), times: Times(message: "", dates: []));
  ProvidersCubit(this.providerRepo) : super(ProvidersInitial());

  ProviderModel getAllProviders() {
    providerRepo.getProviders().then((providers) {
      emit(ProviderLoaded(providers));
      this.providers = providers;
    });
    return providers;
  }

  ProviderModel getProvidersType(int typeId) {
    providerRepo.getProvidersOnTypes(typeId).then((providersType) {
      log("$providersType['message']");
      emit(ProvidersTypeLoaded(providersType));
      providers = providersType;
    });
    return providers;
  }

    ProviderDetailsModel getProvidersDetails(int proId) {
    providerRepo.getProvidersImages(proId).then((images) {
      emit(ProviderImagesLoaded(images));
      this.images = images;
    });
    return images;
  }
}
