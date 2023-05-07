// To parse this JSON data, do
//
//     final advertismentModel = advertismentModelFromJson(jsonString);

import 'dart:convert';

AdvertismentModel advertismentModelFromJson(String str) => AdvertismentModel.fromJson(json.decode(str));

class AdvertismentModel {
    AdvertismentModel({
        required this.message,
        required this.advertisments,
    });

    final String message;
    final List<Advertisment> advertisments;

    factory AdvertismentModel.fromJson(Map<String, dynamic> json) => AdvertismentModel(
        message: json["message"],
        advertisments: List<Advertisment>.from(json["advertisments"].map((x) => Advertisment.fromJson(x))),
    );
}

class Advertisment {
    Advertisment({
        required this.id,
        required this.title,
        required this.description,
        required this.image,
    });

    final int id;
    final String title;
    final String description;
    final String image;

    factory Advertisment.fromJson(Map<String, dynamic> json) => Advertisment(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
    );
}
