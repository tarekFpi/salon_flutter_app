// To parse this JSON data, do
//
//     final salonProfileShowResponseModel = salonProfileShowResponseModelFromJson(jsonString);

import 'dart:convert';

SalonProfileShowResponseModel salonProfileShowResponseModelFromJson(String str) => SalonProfileShowResponseModel.fromJson(json.decode(str));

String salonProfileShowResponseModelToJson(SalonProfileShowResponseModel data) => json.encode(data.toJson());

class SalonProfileShowResponseModel {
  Location? location;
  Verification? verification;
  String? id;
  String? outletId;
  String? name;
  String? email;
  String? phone;
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

  SalonProfileShowResponseModel({
    this.location,
    this.verification,
    this.id,
    this.outletId,
    this.name,
    this.email,
    this.phone,
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

  factory SalonProfileShowResponseModel.fromJson(Map<String, dynamic> json) => SalonProfileShowResponseModel(
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    verification: json["verification"] == null ? null : Verification.fromJson(json["verification"]),
    id: json["_id"],
    outletId: json["outletId"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
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
