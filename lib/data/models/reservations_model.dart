// To parse this JSON data, do
//
//     final reservationsModel = reservationsModelFromJson(jsonString);

import 'dart:convert';

ReservationsModel reservationsModelFromJson(String str) => ReservationsModel.fromJson(json.decode(str));

String reservationsModelToJson(ReservationsModel data) => json.encode(data.toJson());

class ReservationsModel {
    ReservationsModel({
        required this.message,
        required this.reservations,
    });

    final String message;
    final List<Reservations> reservations;

    factory ReservationsModel.fromJson(Map<String, dynamic> json) => ReservationsModel(
        message: json["message"],
        reservations: List<Reservations>.from(json["reservations"].map((x) => Reservations.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "reservations": List<dynamic>.from(reservations.map((x) => x.toJson())),
    };
}

class Reservations {
    Reservations({
        required this.id,
        required this.ownerId,
        required this.providerId,
        required this.reservationTimeId,
        required this.ownerName,
        required this.ownerEmail,
        required this.ownerPhone,
        required this.providerName,
        required this.providerEmail,
        required this.providerPhone,
        required this.providerImage,
        required this.startDate,
        required this.endDate,
        required this.startTime,
        required this.endTime,
        required this.reservationPrice,
    });

    final int id;
    final int ownerId;
    final int providerId;
    final int reservationTimeId;
    final String ownerName;
    final String ownerEmail;
    final String ownerPhone;
    final String providerName;
    final String providerEmail;
    final String providerPhone;
    final String providerImage;
    final String startDate;
    final String endDate;
    final String startTime;
    final String endTime;
    final double reservationPrice;

    factory Reservations.fromJson(Map<String, dynamic> json) => Reservations(
        id: json["id"],
        ownerId: json["owner_id"],
        providerId: json["provider_id"],
        reservationTimeId: json["reservation_time_id"],
        ownerName: json["ownerName"],
        ownerEmail: json["ownerEmail"],
        ownerPhone: json["ownerPhone"],
        providerName: json["providerName"],
        providerEmail: json["providerEmail"],
        providerPhone: json["providerPhone"],
        providerImage: json["providerImage"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        reservationPrice: json["reservationPrice"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "owner_id": ownerId,
        "provider_id": providerId,
        "reservation_time_id": reservationTimeId,
        "ownerName": ownerName,
        "ownerEmail": ownerEmail,
        "ownerPhone": ownerPhone,
        "providerName": providerName,
        "providerEmail": providerEmail,
        "providerPhone": providerPhone,
        "providerImage": providerImage,
        "startDate": startDate,
        "endDate": endDate,
        "startTime": startTime,
        "endTime": endTime,
        "reservationPrice": reservationPrice,
    };
}
