// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  String userName;
  String realName;
  String password;
  String phoneNumber;
  String email;
  String carNumber;
  String carColor;
  String carType;
  String homeroom;
  String userType;
  List<String> warning;
  String penalty;

  Welcome({
    required this.userName,
    required this.realName,
    required this.password,
    required this.phoneNumber,
    required this.email,
    required this.carNumber,
    required this.carColor,
    required this.carType,
    required this.homeroom,
    required this.userType,
    required this.warning,
    required this.penalty,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        userName: json["user_name"],
        realName: json["real_name"],
        password: json["password"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        carNumber: json["car_number"],
        carColor: json["car_color"],
        carType: json["car_type"],
        homeroom: json["homeroom"],
        userType: json["user_type"],
        warning: List<String>.from(json["warning"].map((x) => x)),
        penalty: json["penalty"],
      );

  Map<String, dynamic> toJson() => {
        "user_name": userName,
        "real_name": realName,
        "password": password,
        "phone_number": phoneNumber,
        "email": email,
        "car_number": carNumber,
        "car_color": carColor,
        "car_type": carType,
        "homeroom": homeroom,
        "user_type": userType,
        "warning": List<dynamic>.from(warning.map((x) => x)),
        "penalty": penalty,
      };
}

class Id {
  String oid;

  Id({
    required this.oid,
  });

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024oid": oid,
      };
}
