// To parse this JSON data, do
//
//     final sliderImageModel = sliderImageModelFromJson(jsonString);

import 'dart:convert';

SliderImageModel sliderImageModelFromJson(String str) => SliderImageModel.fromJson(json.decode(str));

String sliderImageModelToJson(SliderImageModel data) => json.encode(data.toJson());

class SliderImageModel {
  String? id;
  String? name;
  String? description;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  SliderImageModel({
    this.id,
    this.name,
    this.description,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory SliderImageModel.fromJson(Map<String, dynamic> json) => SliderImageModel(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "image": image,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
