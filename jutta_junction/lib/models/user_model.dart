import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.userId,
    this.fullName,
    this.username,
    this.phone,
    this.imageUrl,
    this.imagePath,
    this.fcm,
    this.email,
    this.password,
  });

  String? id;
  String? userId;
  String? fullName;
  String? username;
  String? phone;
  String? imageUrl;
  String? imagePath;
  String? fcm;
  String? email;
  String? password;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        userId: json["user_id"],
        fullName: json["name"],
        username: json["username"],
        phone: json["phone"],
        imageUrl: json["imageUrl"],
        imagePath: json["imagePath"],
        fcm: json["fcm"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": fullName,
        "username": username,
        "phone": phone,
        "imageUrl": imageUrl,
        "imagePath": imagePath,
        "fcm": fcm,
        "email": email,
        "password": password,
      };

  factory UserModel.fromFirebaseSnapshot(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      UserModel(
        id: json.id,
        userId: json["user_id"],
        fullName: json["name"],
        username: json["username"],
        phone: json["phone"],
        imageUrl: json["imageUrl"],
        imagePath: json["imagePath"],
        fcm: json["fcm"],
        email: json["email"],
        password: json["password"],
      );

  UserModel copyWith({
    String? id,
    String? userId,
    String? fullName,
    String? username,
    String? phone,
    String? imageUrl,
    String? imagePath,
    String? fcm,
    String? email,
    String? password,
  }) {
    return UserModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      fullName: fullName ?? this.fullName,
      username: username ?? this.username,
      phone: phone ?? this.phone,
      imageUrl: imageUrl ?? this.imageUrl,
      imagePath: imagePath ?? this.imagePath,
      fcm: fcm ?? this.fcm,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
