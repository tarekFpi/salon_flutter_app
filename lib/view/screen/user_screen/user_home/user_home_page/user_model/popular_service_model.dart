// To parse this JSON data, do
//
//     final popularServiceModel = popularServiceModelFromJson(jsonString);

import 'dart:convert';

PopularServiceModel popularServiceModelFromJson(String str) => PopularServiceModel.fromJson(json.decode(str));

String popularServiceModelToJson(PopularServiceModel data) => json.encode(data.toJson());

class PopularServiceModel {
  Outlet? outlet;
  Price? price;
  Discount? discount;
  String? id;
  String? name;
  bool? isDiscount;
  String? image;
  int? consumeCount;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  bool? isHomeServiceAvailable;

  PopularServiceModel({
    this.outlet,
    this.price,
    this.discount,
    this.id,
    this.name,
    this.isDiscount,
    this.image,
    this.consumeCount,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.isHomeServiceAvailable,
  });

  factory PopularServiceModel.fromJson(Map<String, dynamic> json) => PopularServiceModel(
    outlet: json["outlet"] == null ? null : Outlet.fromJson(json["outlet"]),
    price: json["price"] == null ? null : Price.fromJson(json["price"]),
    discount: json["discount"] == null ? null : Discount.fromJson(json["discount"]),
    id: json["_id"],
    name: json["name"],
    isDiscount: json["isDiscount"],
    image: json["image"],
    consumeCount: json["consumeCount"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    isHomeServiceAvailable: json["isHomeServiceAvailable"],
  );

  Map<String, dynamic> toJson() => {
    "outlet": outlet?.toJson(),
    "price": price?.toJson(),
    "discount": discount?.toJson(),
    "_id": id,
    "name": name,
    "isDiscount": isDiscount,
    "image": image,
    "consumeCount": consumeCount,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "isHomeServiceAvailable": isHomeServiceAvailable,
  };
}

class Discount {
  String? type;
  int? amount;
  String? currency;

  Discount({
    this.type,
    this.amount,
    this.currency,
  });

  factory Discount.fromJson(Map<String, dynamic> json) => Discount(
    type: json["type"],
    amount: json["amount"],
    currency: json["currency"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "amount": amount,
    "currency": currency,
  };
}

class Outlet {
  String? outletId;
  String? name;
  String? type;

  Outlet({
    this.outletId,
    this.name,
    this.type,
  });

  factory Outlet.fromJson(Map<String, dynamic> json) => Outlet(
    outletId: json["outletId"],
    name: json["name"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "outletId": outletId,
    "name": name,
    "type": type,
  };
}

class Price {
  int? amount;
  String? currency;

  Price({
    this.amount,
    this.currency,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    amount: json["amount"],
    currency: json["currency"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "currency": currency,
  };
}
