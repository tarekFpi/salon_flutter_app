import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  Verification? verification;
  String? id;
  String? userId;
  String? fullName;
  String? email;
  String? phone;
  bool? isEmailVerified;
  String? role;
  String? status;
  String? image;
  int? point;
  bool? isActive;
  bool? isSocial;
  dynamic fcmToken;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? address;
  String? dateOfBirth;
  String? gender;

  ProfileModel({
    this.verification,
    this.id,
    this.userId,
    this.fullName,
    this.email,
    this.phone,
    this.isEmailVerified,
    this.role,
    this.status,
    this.image,
    this.point,
    this.isActive,
    this.isSocial,
    this.fcmToken,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.address,
    this.dateOfBirth,
    this.gender,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        verification: json["verification"] == null
            ? null
            : Verification.fromJson(json["verification"]),
        id: json["_id"],
        userId: json["userId"],
        fullName: json["fullName"],
        email: json["email"],
        phone: json["phone"],
        isEmailVerified: json["isEmailVerified"],
        role: json["role"],
        status: json["status"],
        image: json["image"],
        point: json["point"],
        isActive: json["isActive"],
        isSocial: json["isSocial"],
        fcmToken: json["fcmToken"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
        address: json["address"],
        dateOfBirth: json["dateOfBirth"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "verification": verification?.toJson(),
        "_id": id,
        "userId": userId,
        "fullName": fullName,
        "email": email,
        "phone": phone,
        "isEmailVerified": isEmailVerified,
        "role": role,
        "status": status,
        "image": image,
        "point": point,
        "isActive": isActive,
        "isSocial": isSocial,
        "fcmToken": fcmToken,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
        "address": address,
        "dateOfBirth": dateOfBirth,
        "gender": gender,
      };
}

class Verification {
  String? code;
  String? expireDate;

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


