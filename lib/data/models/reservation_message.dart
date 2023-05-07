// To parse this JSON data, do
//
//     final reservationMessageModel = reservationMessageModelFromJson(jsonString);

import 'dart:convert';

ReservationMessageModel reservationMessageModelFromJson(String str) => ReservationMessageModel.fromJson(json.decode(str));


class ReservationMessageModel {
    ReservationMessageModel({
        required this.error,
        required this.message,
    });

    final bool error;
    final String message;

    factory ReservationMessageModel.fromJson(Map<String, dynamic> json) => ReservationMessageModel(
        error: json["error"],
        message: json["message"],
    );
}
