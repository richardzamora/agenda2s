// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? username;
  String? message;
  String? token;

  User({
    this.username,
    this.message,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        message: json["message"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "message": message,
        "token": token,
      };
}
