// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

AuthSession sessionFromJson(String str) =>
    AuthSession.fromJson(json.decode(str));

String sessionToJson(AuthSession data) => json.encode(data.toJson());

class AuthSession {
  String? username;
  String? message;
  String? token;

  AuthSession({
    this.username,
    this.message,
    this.token,
  });

  factory AuthSession.fromJson(Map<String, dynamic> json) => AuthSession(
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
