// To parse this JSON data, do
//
//     final providerModel = providerModelFromJson(jsonString);

import 'dart:convert';

ProviderModel providerModelFromJson(String str) => ProviderModel.fromJson(json.decode(str));


class ProviderModel {
    ProviderModel({
        required this.message,
        required this.providers,
    });

    final String message;
    final List<Provider> providers;

    factory ProviderModel.fromJson(Map<String, dynamic> json) => ProviderModel(
        message: json["message"],
        providers: List<Provider>.from(json["providers"].map((x) => Provider.fromJson(x))),
    );
}

class Provider {
    Provider({
        required this.providerId,
        required this.ownerId,
        required this.providerName,
        required this.providerEmail,
        required this.providerPhone,
        required this.providerDesc,
        required this.providerImage,
        required this.providerRate,
        required this.ownerName,
        required this.ownerPhone,
        required this.typeName,
    });

    final int providerId;
    final int ownerId;
    final String providerName;
    final String providerEmail;
    final String providerPhone;
    final String providerDesc;
    final String providerImage;
    final double providerRate;
    final String ownerName;
    final String ownerPhone;
    final String typeName;

    factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        providerId: json["providerId"],
        ownerId: json["ownerId"],
        providerName: json["providerName"],
        providerEmail: json["providerEmail"],
        providerPhone: json["providerPhone"],
        providerDesc: json["providerDesc"],
        providerImage: json["providerImage"],
        providerRate: json["ProviderRate"]?.toDouble(),
        ownerName: json["ownerName"],
        ownerPhone: json["ownerPhone"],
        typeName: json["typeName"],
    );
}
