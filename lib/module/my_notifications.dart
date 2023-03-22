// To parse this JSON data, do
//
//     final myNotifications = myNotificationsFromJson(jsonString);

import 'dart:convert';

MyNotifications myNotificationsFromJson(String str) => MyNotifications.fromJson(json.decode(str));

String myNotificationsToJson(MyNotifications data) => json.encode(data.toJson());

class MyNotifications {
    MyNotifications({
        this.id,
        this.userId,
        this.orderId,
        this.messages,
        this.messagType,
        this.fromUserId,
        this.toUserId,
        this.status,
        this.createdAt,
        this.imageUser,
        this.nameUser,
        this.message,
    });

    int id;
    int userId;
    int orderId;
    String messages;
    String messagType;
    dynamic fromUserId;
    dynamic toUserId;
    String status;
    DateTime createdAt;
    String imageUser;
    String nameUser;
    String message;

    factory MyNotifications.fromJson(Map<String, dynamic> json) => MyNotifications(
        id: json["id"],
        userId: json["user_id"],
        orderId: json["order_id"],
        messages: json["messages"],
        messagType: json["messag_type"],
        fromUserId: json["from_user_id"],
        toUserId: json["to_user_id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        imageUser: json["image_user"],
        nameUser: json["name_user"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "order_id": orderId,
        "messages": messages,
        "messag_type": messagType,
        "from_user_id": fromUserId,
        "to_user_id": toUserId,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "image_user": imageUser,
        "name_user": nameUser,
        "message": message,
    };
}
