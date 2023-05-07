// To parse this JSON data, do
//
//     final providerDetailsModel = providerDetailsModelFromJson(jsonString);

import 'dart:convert';

ProviderDetailsModel providerDetailsModelFromJson(String str) => ProviderDetailsModel.fromJson(json.decode(str));


class ProviderDetailsModel {
    ProviderDetailsModel({
        required this.images,
        required this.times,
    });

    final Images images;
    final Times times;

    factory ProviderDetailsModel.fromJson(Map<String, dynamic> json) => ProviderDetailsModel(
        images: Images.fromJson(json["images"]),
        times: Times.fromJson(json["times"]),
    );
}

class Images {
    Images({
        required this.message,
        required this.images,
    });

    final String message;
    final List<ProviderImages> images;

    factory Images.fromJson(Map<String, dynamic> json) => Images(
        message: json["message"],
        images: List<ProviderImages>.from(json["images"].map((x) => ProviderImages.fromJson(x))),
    );
}

class ProviderImages {
    ProviderImages({
        required this.id,
        required this.image,
    });

    final int id;
    final String image;

    factory ProviderImages.fromJson(Map<String, dynamic> json) => ProviderImages(
        id: json["id"],
        image: json["image"],
    );
}

class Times {
    Times({
        required this.message,
        required this.dates,
    });

    final String message;
    final List<ProviderDates> dates;

    factory Times.fromJson(Map<String, dynamic> json) => Times(
        message: json["message"],
        dates: List<ProviderDates>.from(json["dates"].map((x) => ProviderDates.fromJson(x))),
    );
}

class ProviderDates {
    ProviderDates({
        required this.id,
        required this.startDate,
        required this.endDate,
        required this.startTime,
        required this.endTime,
        required this.price,
    });

    final int id;
    final String startDate;
    final String endDate;
    final String startTime;
    final String endTime;
    final num price;

    factory ProviderDates.fromJson(Map<String, dynamic> json) => ProviderDates(
        id: json["id"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        price: json["price"],
    );
}
