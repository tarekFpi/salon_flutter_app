// To parse this JSON data, do
//
//     final serviceOutletModel = serviceOutletModelFromJson(jsonString);

import 'dart:convert';

ServiceOutletModel serviceOutletModelFromJson(String str) => ServiceOutletModel.fromJson(json.decode(str));

String serviceOutletModelToJson(ServiceOutletModel data) => json.encode(data.toJson());

class ServiceOutletModel {
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
  CategoryId? categoryId;
  bool? isRecommended;
  bool? isEmailVerified;
  DateTime? createdAt;
  DateTime? updatedAt;
  num? v;
  String? about;
  String? experience;
  num? rating;
  ScheduleStamp? scheduleStamp;

  ServiceOutletModel({
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
    this.categoryId,
    this.isRecommended,
    this.isEmailVerified,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.about,
    this.experience,
    this.rating,
    this.scheduleStamp,
  });

  factory ServiceOutletModel.fromJson(Map<String, dynamic> json) => ServiceOutletModel(
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
    categoryId: json["categoryId"] == null ? null : CategoryId.fromJson(json["categoryId"]),
    isRecommended: json["isRecommended"],
    isEmailVerified: json["isEmailVerified"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    about: json["about"],
    experience: json["experience"],
    rating: json["rating"],
    scheduleStamp: json["scheduleStamp"] == null ? null : ScheduleStamp.fromJson(json["scheduleStamp"]),
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
    "categoryId": categoryId?.toJson(),
    "isRecommended": isRecommended,
    "isEmailVerified": isEmailVerified,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "about": about,
    "experience": experience,
    "rating": rating,
    "scheduleStamp": scheduleStamp?.toJson(),
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

class ScheduleStamp {
  String? days;
  String? times;

  ScheduleStamp({
    this.days,
    this.times,
  });

  factory ScheduleStamp.fromJson(Map<String, dynamic> json) => ScheduleStamp(
    days: json["days"],
    times: json["times"],
  );

  Map<String, dynamic> toJson() => {
    "days": days,
    "times": times,
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
