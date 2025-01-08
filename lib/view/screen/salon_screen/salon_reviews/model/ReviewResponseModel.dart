// To parse this JSON data, do
//
//     final reviewResponseModel = reviewResponseModelFromJson(jsonString);

import 'dart:convert';

ReviewResponseModel reviewResponseModelFromJson(String str) => ReviewResponseModel.fromJson(json.decode(str));

String reviewResponseModelToJson(ReviewResponseModel data) => json.encode(data.toJson());

class ReviewResponseModel {
  User? user;
  Outlet? outlet;
  String? id;
  int? rating;
  String? comment;
  Booking? booking;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ReviewResponseModel({
    this.user,
    this.outlet,
    this.id,
    this.rating,
    this.comment,
    this.booking,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ReviewResponseModel.fromJson(Map<String, dynamic> json) => ReviewResponseModel(
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    outlet: json["outlet"] == null ? null : Outlet.fromJson(json["outlet"]),
    id: json["_id"],
    rating: json["rating"],
    comment: json["comment"],
    booking: json["booking"] == null ? null : Booking.fromJson(json["booking"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "outlet": outlet?.toJson(),
    "_id": id,
    "rating": rating,
    "comment": comment,
    "booking": booking?.toJson(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Booking {
  Service? service;
  String? id;

  Booking({
    this.service,
    this.id,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    service: json["service"] == null ? null : Service.fromJson(json["service"]),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "service": service?.toJson(),
    "_id": id,
  };
}

class Service {
  Price? price;
  String? serviceId;
  String? name;

  Service({
    this.price,
    this.serviceId,
    this.name,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    price: json["price"] == null ? null : Price.fromJson(json["price"]),
    serviceId: json["serviceId"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "price": price?.toJson(),
    "serviceId": serviceId,
    "name": name,
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

class Outlet {
  String? outletId;
  String? type;
  String? name;
  String? address;

  Outlet({
    this.outletId,
    this.type,
    this.name,
    this.address,
  });

  factory Outlet.fromJson(Map<String, dynamic> json) => Outlet(
    outletId: json["outletId"],
    type: json["type"],
    name: json["name"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "outletId": outletId,
    "type": type,
    "name": name,
    "address": address,
  };
}

class User {
  String? userId;
  String? name;
  String? address;

  User({
    this.userId,
    this.name,
    this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["userId"],
    name: json["name"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "name": name,
    "address": address,
  };
}
