// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

//This is a model to store user data

import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  dynamic id;
  dynamic username;
  dynamic email;
  dynamic phone;
  dynamic country;
  dynamic logo;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.country,
    required this.logo,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        country: json["country"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "phone": phone,
        "country": country,
        "logo": logo,
      };
}
