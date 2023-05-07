import 'package:monasabti/data/models/provider_model.dart';
import 'package:monasabti/data/models/types.dart';
import 'package:monasabti/data/models/update_message.dart';
import '../models/provider_details_model.dart';
import '../services/providers.dart';

class ProviderRepo {
  final ProviderService providerService;
  ProviderRepo(this.providerService);

  Future<ProviderModel> getProviders() async {
    try {
      final provider = await providerService.getProviders();

      return ProviderModel.fromJson(provider);
    } catch (ex) {
      return ProviderModel(message: "no", providers: []);
    }
  }

  Future<TypeModel> getTypes() async {
    try {
      final types = await providerService.getTypes();

      return TypeModel.fromJson(types);
    } catch (ex) {
      return TypeModel(message: "no", types: []);
    }
  }

  Future<ProviderModel> getProvidersOnTypes(int typeId) async {
    try {
      final providersType = await providerService.getProvidersOnTypes(typeId);

      return ProviderModel.fromJson(providersType);
    } catch (ex) {
      return ProviderModel(message: "no", providers: []);
    }
  }

  Future<ProviderDetailsModel> getProvidersImages(int proId) async {
    try {
      final images = await providerService.getProvidersImages(proId);

      return ProviderDetailsModel.fromJson(images);
    } catch (ex) {
      return ProviderDetailsModel(
          images: Images(message: "no", images: []),
          times: Times(message: "no", dates: []));
    }
  }

  Future<UpdatedMessage> rateProvider(
      int clinetId, int providerId, double rate) async {
    try {
      final rateModel =
          await providerService.rateProvider(clinetId, providerId, rate);

      if (!rateModel['error']) {
        return UpdatedMessage(error: false, message: "Success Rate");
      }

      return UpdatedMessage(error: true, message: "Fail Rate");
    } catch (ex) {
      return UpdatedMessage(error: true, message: "Error in Rate $ex");
    }
  }
}
