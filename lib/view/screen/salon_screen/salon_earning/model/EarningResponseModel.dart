// To parse this JSON data, do
//
//     final earningResponseModel = earningResponseModelFromJson(jsonString);

import 'dart:convert';

EarningResponseModel earningResponseModelFromJson(String str) => EarningResponseModel.fromJson(json.decode(str));

String earningResponseModelToJson(EarningResponseModel data) => json.encode(data.toJson());

class EarningResponseModel {
  Earning? totalEarning;
  Earning? weeklyEarning;

  EarningResponseModel({
    this.totalEarning,
    this.weeklyEarning,
  });

  factory EarningResponseModel.fromJson(Map<String, dynamic> json) => EarningResponseModel(
    totalEarning: json["totalEarning"] == null ? null : Earning.fromJson(json["totalEarning"]),
    weeklyEarning: json["weeklyEarning"] == null ? null : Earning.fromJson(json["weeklyEarning"]),
  );

  Map<String, dynamic> toJson() => {
    "totalEarning": totalEarning?.toJson(),
    "weeklyEarning": weeklyEarning?.toJson(),
  };
}

class Earning {
  int? amount;
  String? currency;

  Earning({
    this.amount,
    this.currency,
  });

  factory Earning.fromJson(Map<String, dynamic> json) => Earning(
    amount: json["amount"],
    currency: json["currency"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "currency": currency,
  };
}
