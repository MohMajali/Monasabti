import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:monasabti/data/end_points.dart';

class ReservationService {
  Future reserve(int clientId, int ownerId, int providerId,
      int reservationTimeId, double price) async {
    try {
      var response = await http
          .post(Uri.parse("${EndPoints.url}${EndPoints.reservation}"), body: {
        "client_id": "$clientId",
        "owner_id": "$ownerId",
        "provider_id": "$providerId",
        "reservation_time_id": "$reservationTimeId",
        "price": "$price"
      });

      var reservationResponse = json.decode(response.body);

      return reservationResponse;
    } catch (ex) {
      log("ex111 $ex");
      return ex;
    }
  }

  Future getReservations(int clientId) async {
    try {
      var response = await http.get(
        Uri.parse("${EndPoints.url}${EndPoints.getReservations}$clientId"),
      );

      var reservationResponse = json.decode(response.body);
      return reservationResponse;
    } catch (ex) {
      log("message $ex");
      return ex;
    }
  }
}
