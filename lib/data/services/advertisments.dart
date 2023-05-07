import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:monasabti/data/end_points.dart';

class AdvertismentsService {
  Future getAdvertisments() async {
    try {
      var response =
          await http.get(Uri.parse("${EndPoints.url}${EndPoints.getAdvertisment}"));

      var advertismentResponse = json.decode(response.body);
      // log("user $userResponse");

      return advertismentResponse;
    } catch (ex) {
      log("ex $ex");
      return ex;
    }
  }
}
