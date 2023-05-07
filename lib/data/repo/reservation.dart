import 'dart:developer';

import 'package:monasabti/data/models/reservation_message.dart';
import 'package:monasabti/data/services/reservation.dart';

import '../models/reservations_model.dart';

class ReservationRepo {
  final ReservationService reservationService;
  ReservationRepo(this.reservationService);

  Future<ReservationMessageModel> reserve(int clientId, int ownerId,
      int providerId, int reservationTimeId, double price) async {
    try {
      final reservation = await reservationService.reserve(
          clientId, ownerId, providerId, reservationTimeId, price);

      if (!reservation['error']) {
        return ReservationMessageModel.fromJson(reservation);
      }

      return ReservationMessageModel(
          error: true, message: "Error In Reservation");
    } catch (ex) {
      return ReservationMessageModel(
          error: true, message: "Error In Reservation");
    }
  }

  Future<ReservationsModel> getReservations(int clientId) async {
    try {
      final reservations = await reservationService.getReservations(clientId);

      if (reservations['message'] == "ok") {
        return ReservationsModel.fromJson(reservations);
      }
      return ReservationsModel(message: "Error", reservations: []);
    } catch (ex) {
      return ReservationsModel(message: "Error ex $ex", reservations: []);
    }
  }
}
