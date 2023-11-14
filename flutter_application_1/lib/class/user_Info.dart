import 'package:flutter_application_1/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

class User_Info {
  final String user_name;
  final String real_name;
  final String password;
  final String phone_number;
  final String email;
  final int car_number;
  final String car_color;
  final String car_type;
  final String homeroom;
  final String user_type;
  final List<String> warning;
  final int penalty;
  final String disabled;

  const User_Info(
    this.user_name,
    this.real_name,
    this.password,
    this.phone_number,
    this.email,
    this.car_number,
    this.car_color,
    this.car_type,
    this.homeroom,
    this.user_type,
    this.warning,
    this.penalty,
    this.disabled,
  );

  factory User_Info.fromJson(Map<String, dynamic> json) {
    return User_Info(
        json['user_name'] as String,
        json['real_name'] as String,
        json['password'] as String,
        json['phone_number'] as String,
        json['email'] as String,
        json['car_number'] as int,
        json['car_color'] as String,
        json['car_type'] as String,
        json['homeroom'] as String,
        json['user_type'] as String,
        json['warning'] as List<String>,
        json['penalty'] as int,
        json['disabled'] as String);
  }
}
