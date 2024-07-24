// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

Session sessionFromJson(String str) => Session.fromJson(json.decode(str));

String sessionToJson(Session data) => json.encode(data.toJson());

class Session {
  String? username;
  String? message;
  String? token;

  Session({
    this.username,
    this.message,
    this.token,
  });

  factory Session.fromJson(Map<String, dynamic> json) => Session(
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
