// To parse this JSON data, do
//
//     final typeModel = typeModelFromJson(jsonString);

import 'dart:convert';

TypeModel typeModelFromJson(String str) => TypeModel.fromJson(json.decode(str));


class TypeModel {
    TypeModel({
        required this.message,
        required this.types,
    });

    final String message;
    final List<Type> types;

    factory TypeModel.fromJson(Map<String, dynamic> json) => TypeModel(
        message: json["message"],
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
    );
}

class Type {
    Type({
        required this.id,
        required this.name,
    });

    final int id;
    final String name;

    factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        name: json["name"],
    );
}
