// To parse this JSON data, do
//
//     final scheduleDayResponseModel = scheduleDayResponseModelFromJson(jsonString);

import 'dart:convert';

ScheduleDayResponseModel scheduleDayResponseModelFromJson(String str) => ScheduleDayResponseModel.fromJson(json.decode(str));

String scheduleDayResponseModelToJson(ScheduleDayResponseModel data) => json.encode(data.toJson());

class ScheduleDayResponseModel {
  String? id;
  List<DaySlot>? daySlot;
  String? outlet;
  List<String>? timeSlot;
  int? capacityOnTime;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ScheduleDayResponseModel({
    this.id,
    this.daySlot,
    this.outlet,
    this.timeSlot,
    this.capacityOnTime,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ScheduleDayResponseModel.fromJson(Map<String, dynamic> json) => ScheduleDayResponseModel(
    id: json["_id"],
    daySlot: json["daySlot"] == null ? [] : List<DaySlot>.from(json["daySlot"]!.map((x) => DaySlot.fromJson(x))),
    outlet: json["outlet"],
    timeSlot: json["timeSlot"] == null ? [] : List<String>.from(json["timeSlot"]!.map((x) => x)),
    capacityOnTime: json["capacityOnTime"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "daySlot": daySlot == null ? [] : List<dynamic>.from(daySlot!.map((x) => x.toJson())),
    "outlet": outlet,
    "timeSlot": timeSlot == null ? [] : List<dynamic>.from(timeSlot!.map((x) => x)),
    "capacityOnTime": capacityOnTime,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class DaySlot {
  String? dayName;
  int? dayIndex;
  String? openTime;
  String? closeTime;
  bool? isClosed;
  String? id;

  DaySlot({
    this.dayName,
    this.dayIndex,
    this.openTime,
    this.closeTime,
    this.isClosed,
    this.id,
  });

  factory DaySlot.fromJson(Map<String, dynamic> json) => DaySlot(
    dayName: json["dayName"],
    dayIndex: json["dayIndex"],
    openTime: json["openTime"],
    closeTime: json["closeTime"],
    isClosed: json["isClosed"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "dayName": dayName,
    "dayIndex": dayIndex,
    "openTime": openTime,
    "closeTime": closeTime,
    "isClosed": isClosed,
    "_id": id,
  };
}
