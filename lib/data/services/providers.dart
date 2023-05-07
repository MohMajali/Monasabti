import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:monasabti/data/end_points.dart';

class ProviderService {
  Future getProviders() async {
    try {
      var response =
          await http.get(Uri.parse("${EndPoints.url}${EndPoints.getProvider}"));

      var providerResponse = json.decode(response.body);
      // log("user $providerResponse");

      return providerResponse;
    } catch (ex) {
      log("getProviders ex $ex");
      return ex;
    }
  }

  Future getTypes() async {
    try {
      var response =
          await http.get(Uri.parse("${EndPoints.url}${EndPoints.getType}"));

      var typeResponse = json.decode(response.body);
      // log("user $userResponse");

      return typeResponse;
    } catch (ex) {
      log("getTypes ex $ex");
      return ex;
    }
  }

  Future getProvidersOnTypes(int typeId) async {
    try {
      var response = await http.get(
          Uri.parse("${EndPoints.url}${EndPoints.getProvidersOnTypes}$typeId"));

      var providerResponse = json.decode(response.body);

      return providerResponse;
    } catch (ex) {
      log("getProvidersOnTypes ex $ex");
      return ex;
    }
  }

  Future getProvidersImages(int proId) async {
    try {
      var response = await http.get(
          Uri.parse("${EndPoints.url}${EndPoints.getProvidersDetails}$proId"));

      var imagesResponse = json.decode(response.body);

      return imagesResponse;
    } catch (ex) {
      log("getProvidersImages ex $ex");
      return ex;
    }
  }

  Future rateProvider(int clinetId, int providerId, double rate) async {
    try {
      var response = await http
          .post(Uri.parse("${EndPoints.url}${EndPoints.rateProvider}"), body: {
        "client_id": "$clinetId",
        "provider_id": "$providerId",
        "rate": "$rate"
      });

      var rateResponse = json.decode(response.body);
      return rateResponse;
    } catch (ex) {
      log("rate ex $ex");
      return ex;
    }
  }
}
