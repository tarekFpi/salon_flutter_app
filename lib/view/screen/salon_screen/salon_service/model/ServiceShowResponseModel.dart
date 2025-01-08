// To parse this JSON data, do
//
//     final serviceShowResponseModel = serviceShowResponseModelFromJson(jsonString);

import 'dart:convert';

ServiceShowResponseModel serviceShowResponseModelFromJson(String str) => ServiceShowResponseModel.fromJson(json.decode(str));

String serviceShowResponseModelToJson(ServiceShowResponseModel data) => json.encode(data.toJson());

class ServiceShowResponseModel {
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

  ServiceShowResponseModel({
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

  factory ServiceShowResponseModel.fromJson(Map<String, dynamic> json) => ServiceShowResponseModel(
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
  OutletId? outletId;
  String? name;
  String? type;

  Outlet({
    this.outletId,
    this.name,
    this.type,
  });

  factory Outlet.fromJson(Map<String, dynamic> json) => Outlet(
    outletId: json["outletId"] == null ? null : OutletId.fromJson(json["outletId"]),
    name: json["name"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "outletId": outletId?.toJson(),
    "name": name,
    "type": type,
  };
}

class OutletId {
  Location? location;
  Verification? verification;
  String? id;
  String? outletId;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? status;
  String? profileImage;
  String? coverImage;
  String? nidNumber;
  String? nidImage;
  String? bankAccountNumber;
  String? role;
  bool? isRecommended;
  bool? isEmailVerified;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? about;
  String? experience;
  String? type;

  OutletId({
    this.location,
    this.verification,
    this.id,
    this.outletId,
    this.name,
    this.email,
    this.phone,
    this.password,
    this.status,
    this.profileImage,
    this.coverImage,
    this.nidNumber,
    this.nidImage,
    this.bankAccountNumber,
    this.role,
    this.isRecommended,
    this.isEmailVerified,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.about,
    this.experience,
    this.type,
  });

  factory OutletId.fromJson(Map<String, dynamic> json) => OutletId(
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    verification: json["verification"] == null ? null : Verification.fromJson(json["verification"]),
    id: json["_id"],
    outletId: json["outletId"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    password: json["password"],
    status: json["status"],
    profileImage: json["profileImage"],
    coverImage: json["coverImage"],
    nidNumber: json["nidNumber"],
    nidImage: json["nidImage"],
    bankAccountNumber: json["bankAccountNumber"],
    role: json["role"],
    isRecommended: json["isRecommended"],
    isEmailVerified: json["isEmailVerified"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    about: json["about"],
    experience: json["experience"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "location": location?.toJson(),
    "verification": verification?.toJson(),
    "_id": id,
    "outletId": outletId,
    "name": name,
    "email": email,
    "phone": phone,
    "password": password,
    "status": status,
    "profileImage": profileImage,
    "coverImage": coverImage,
    "nidNumber": nidNumber,
    "nidImage": nidImage,
    "bankAccountNumber": bankAccountNumber,
    "role": role,
    "isRecommended": isRecommended,
    "isEmailVerified": isEmailVerified,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "about": about,
    "experience": experience,
    "type": type,
  };
}

class Location {
  String? latitude;
  String? longitude;
  String? address;

  Location({
    this.latitude,
    this.longitude,
    this.address,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    latitude: json["latitude"],
    longitude: json["longitude"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
    "address": address,
  };
}

class Verification {
  dynamic code;
  dynamic expireDate;

  Verification({
    this.code,
    this.expireDate,
  });

  factory Verification.fromJson(Map<String, dynamic> json) => Verification(
    code: json["code"],
    expireDate: json["expireDate"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "expireDate": expireDate,
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
