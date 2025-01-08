// To parse this JSON data, do
//
//     final completedEarningResponseModel = completedEarningResponseModelFromJson(jsonString);

import 'dart:convert';

CompletedEarningResponseModel completedEarningResponseModelFromJson(String str) => CompletedEarningResponseModel.fromJson(json.decode(str));

String completedEarningResponseModelToJson(CompletedEarningResponseModel data) => json.encode(data.toJson());

class CompletedEarningResponseModel {
  User? user;
  Outlet? outlet;
  Service? service;
  PaymentSource? paymentSource;
  String? id;
  DateTime? date;
  String? time;
  String? paymentType;
  String? paymentStatus;
  String? bookingStatus;
  bool? homeService;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  CompletedEarningResponseModel({
    this.user,
    this.outlet,
    this.service,
    this.paymentSource,
    this.id,
    this.date,
    this.time,
    this.paymentType,
    this.paymentStatus,
    this.bookingStatus,
    this.homeService,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CompletedEarningResponseModel.fromJson(Map<String, dynamic> json) => CompletedEarningResponseModel(
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    outlet: json["outlet"] == null ? null : Outlet.fromJson(json["outlet"]),
    service: json["service"] == null ? null : Service.fromJson(json["service"]),
    paymentSource: json["paymentSource"] == null ? null : PaymentSource.fromJson(json["paymentSource"]),
    id: json["_id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    time: json["time"],
    paymentType: json["paymentType"],
    paymentStatus: json["paymentStatus"],
    bookingStatus: json["bookingStatus"],
    homeService: json["homeService"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "outlet": outlet?.toJson(),
    "service": service?.toJson(),
    "paymentSource": paymentSource?.toJson(),
    "_id": id,
    "date": date?.toIso8601String(),
    "time": time,
    "paymentType": paymentType,
    "paymentStatus": paymentStatus,
    "bookingStatus": bookingStatus,
    "homeService": homeService,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Outlet {
  String? outletId;
  String? name;
  String? address;

  Outlet({
    this.outletId,
    this.name,
    this.address,
  });

  factory Outlet.fromJson(Map<String, dynamic> json) => Outlet(
    outletId: json["outletId"],
    name: json["name"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "outletId": outletId,
    "name": name,
    "address": address,
  };
}

class PaymentSource {
  String? type;
  String? number;
  String? transactionId;

  PaymentSource({
    this.type,
    this.number,
    this.transactionId,
  });

  factory PaymentSource.fromJson(Map<String, dynamic> json) => PaymentSource(
    type: json["type"],
    number: json["number"],
    transactionId: json["transactionId"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "number": number,
    "transactionId": transactionId,
  };
}

class Service {
  Price? price;
  ServiceId? serviceId;
  String? name;

  Service({
    this.price,
    this.serviceId,
    this.name,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    price: json["price"] == null ? null : Price.fromJson(json["price"]),
    serviceId: json["serviceId"] == null ? null : ServiceId.fromJson(json["serviceId"]),
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "price": price?.toJson(),
    "serviceId": serviceId?.toJson(),
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

class ServiceId {
  Discount? discount;
  String? id;
  bool? isDiscount;

  ServiceId({
    this.discount,
    this.id,
    this.isDiscount,
  });

  factory ServiceId.fromJson(Map<String, dynamic> json) => ServiceId(
    discount: json["discount"] == null ? null : Discount.fromJson(json["discount"]),
    id: json["_id"],
    isDiscount: json["isDiscount"],
  );

  Map<String, dynamic> toJson() => {
    "discount": discount?.toJson(),
    "_id": id,
    "isDiscount": isDiscount,
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
