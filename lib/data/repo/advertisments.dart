import 'package:monasabti/data/models/advertisment_model.dart';
import 'package:monasabti/data/services/advertisments.dart';

class AdvertismentRepo {
  final AdvertismentsService advertismentsService;
  AdvertismentRepo(this.advertismentsService);

  Future<AdvertismentModel> getAdvertisments() async {
    try {
      final advertisments = await advertismentsService.getAdvertisments();

      return AdvertismentModel.fromJson(advertisments);
    } catch (ex) {
      return AdvertismentModel(message: "no", advertisments: []);
    }
  }
}
