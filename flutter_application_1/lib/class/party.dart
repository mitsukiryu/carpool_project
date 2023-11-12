import 'package:flutter_application_1/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

class Party {
  final String date_time;
  final String destination;
  final String departure;
  final int max_recruitment;
  final int cur_recruitment;
  final String party_type;
  final String party_recruiter_id;
  final List<String> party_member_id;
  final double departure_party_Lat;
  final double departure_party_Lng;
  final double destination_party_Lat;
  final double destination_party_Lng;

  const Party(
    this.date_time,
    this.destination,
    this.departure,
    this.max_recruitment,
    this.cur_recruitment,
    this.party_type,
    this.party_recruiter_id,
    this.party_member_id,
    this.departure_party_Lat,
    this.departure_party_Lng,
    this.destination_party_Lat,
    this.destination_party_Lng,
  );

  factory Party.fromJson(Map<String, dynamic> json) {
    return Party(
        json['date_time'] as String,
        json['destination'] as String,
        json['departure'] as String,
        json['max_recruitment'] as int,
        json['cur_recruitment'] as int,
        json['party_type'] as String,
        json['party_recruiter_id'] as String,
        json['party_member_id'] as List<String>,
        json['departure_party_Lat'] as double,
        json['departure_party_Lng'] as double,
        json['destination_party_Lat'] as double,
        json['destination_party_Lng'] as double);
  }

  // static Party fromJson(json) => Party(
  //       date_time: json['date_time'],
  //       destination: json['destination'],
  //       departure: json['departure'],
  //       max_recruitment: json['max_recruitment'],
  //       cur_recruitment: json['cur_recruitment'],
  //       party_type: json['party_type'],
  //       party_recruiter_id: json['party_recruiter_id'],
  //       party_member_id: List<String>.from(json['party_member_id']),
  //       departure_party_Lat: json['departure_party_Lat'],
  //       departure_party_Lng: json['departure_party_Lng'],
  //       destination_party_Lat: json['destination_party_Lat'],
  //       destination_party_Lng: json['destination_party_Lng'],
  //     );
}
