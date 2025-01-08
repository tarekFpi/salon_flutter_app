// To parse this JSON data, do
//
//     final termModel = termModelFromJson(jsonString);

import 'dart:convert';

TermModel termModelFromJson(String str) => TermModel.fromJson(json.decode(str));

String termModelToJson(TermModel data) => json.encode(data.toJson());

class TermModel {
  String? id;
  String? termsCondition;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  TermModel({
    this.id,
    this.termsCondition,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory TermModel.fromJson(Map<String, dynamic> json) => TermModel(
    id: json["_id"],
    termsCondition: json["termsCondition"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "termsCondition": termsCondition,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
