// To parse this JSON data, do
//
//     final recommendServicesModel = recommendServicesModelFromJson(jsonString);

import 'dart:convert';

RecommendServicesModel recommendServicesModelFromJson(String str) => RecommendServicesModel.fromJson(json.decode(str));

String recommendServicesModelToJson(RecommendServicesModel data) => json.encode(data.toJson());

class RecommendServicesModel {
  Location? location;
  Verification? verification;
  String? id;
  String? outletId;
  String? type;
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
  CategoryId? categoryId;
  bool? isRecommended;
  bool? isEmailVerified;
  String? createdAt;
  DateTime? updatedAt;
  num? v;
  num? rating;

  RecommendServicesModel({
    this.location,
    this.verification,
    this.id,
    this.outletId,
    this.type,
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
    this.categoryId,
    this.isRecommended,
    this.isEmailVerified,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.rating,
  });

  factory RecommendServicesModel.fromJson(Map<String, dynamic> json) => RecommendServicesModel(
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    verification: json["verification"] == null ? null : Verification.fromJson(json["verification"]),
    id: json["_id"],
    outletId: json["outletId"],
    type: json["type"],
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
    categoryId: json["categoryId"] == null ? null : CategoryId.fromJson(json["categoryId"]),
    isRecommended: json["isRecommended"],
    isEmailVerified: json["isEmailVerified"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "location": location?.toJson(),
    "verification": verification?.toJson(),
    "_id": id,
    "outletId": outletId,
    "type": type,
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
    "categoryId": categoryId?.toJson(),
    "isRecommended": isRecommended,
    "isEmailVerified": isEmailVerified,
    "createdAt": createdAt,
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "rating": rating,
  };
}

class CategoryId {
  String? id;
  String? name;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  num? v;

  CategoryId({
    this.id,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CategoryId.fromJson(Map<String, dynamic> json) => CategoryId(
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
