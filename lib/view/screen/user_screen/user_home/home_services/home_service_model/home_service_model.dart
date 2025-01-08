// To parse this JSON data, do
//
//     final homeServiceModel = homeServiceModelFromJson(jsonString);

import 'dart:convert';

HomeServiceModel homeServiceModelFromJson(String str) => HomeServiceModel.fromJson(json.decode(str));

String homeServiceModelToJson(HomeServiceModel data) => json.encode(data.toJson());

class HomeServiceModel {
  String? id;
  String? name;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  HomeServiceModel({
    this.id,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory HomeServiceModel.fromJson(Map<String, dynamic> json) => HomeServiceModel(
    id: json["_id"],
    name: json["name"],
    image: json["image"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "image": image,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
