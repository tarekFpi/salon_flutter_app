// To parse this JSON data, do
//
//     final privacyModel = privacyModelFromJson(jsonString);

import 'dart:convert';

PrivacyModel privacyModelFromJson(String str) => PrivacyModel.fromJson(json.decode(str));

String privacyModelToJson(PrivacyModel data) => json.encode(data.toJson());

class PrivacyModel {
  String? id;
  String? privacyPolicy;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  PrivacyModel({
    this.id,
    this.privacyPolicy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory PrivacyModel.fromJson(Map<String, dynamic> json) => PrivacyModel(
    id: json["_id"],
    privacyPolicy: json["privacyPolicy"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "privacyPolicy": privacyPolicy,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
