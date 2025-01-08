// To parse this JSON data, do
//
//     final messageModel = messageModelFromJson(jsonString);

import 'dart:convert';

MessageModel messageModelFromJson(String str) => MessageModel.fromJson(json.decode(str));

String messageModelToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
    String? id;
    String? conversation;
    Sender? sender;
    String? senderRole;
    String? type;
    String? content;
    List<String>? attachment;
    String? createdAt;
    DateTime? updatedAt;
    int? v;

    MessageModel({
        this.id,
        this.conversation,
        this.sender,
        this.senderRole,
        this.type,
        this.content,
        this.attachment,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        id: json["_id"],
        conversation: json["conversation"],
        sender: json["sender"] == null ? null : Sender.fromJson(json["sender"]),
        senderRole: json["senderRole"],
        type: json["type"],
        content: json["content"],
        attachment: json["attachment"] == null ? [] : List<String>.from(json["attachment"]!.map((x) => x)),
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "conversation": conversation,
        "sender": sender?.toJson(),
        "senderRole": senderRole,
        "type": type,
        "content": content,
        "attachment": attachment == null ? [] : List<dynamic>.from(attachment!.map((x) => x)),
        "createdAt": createdAt,
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class Sender {
    String? id;
    String? fullName;
    String? image;

    Sender({
        this.id,
        this.fullName,
        this.image,
    });

    factory Sender.fromJson(Map<String, dynamic> json) => Sender(
        id: json["_id"],
        fullName: json["fullName"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "image": image,
    };
}
