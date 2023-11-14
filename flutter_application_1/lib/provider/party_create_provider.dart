import 'package:flutter/material.dart';

class PartyCreateProvider extends ChangeNotifier {
  String _partyId = "";
  String _status = "";
  String _date = "";
  String _time = "";
  String _start = "";
  String _end = "";
  int _peopleNumMax = 0;
  int _peopleNumCur = 0;
  String _partyRecruiterId = "";
  List<String> _partyMemberId = [];
  double _departurePartyLat = 0;
  double _departurePartyLng = 0;
  double _destinationPartyLat = 0;
  double _destinaationPartyLng = 0;

  String get partyId => _partyId;
  String get status => _status;
  String get date => _date;
  String get time => _time;
  String get start => _start;
  String get end => _end;
  int get peopleNumMax => _peopleNumMax;
  int get peopleNumCur => _peopleNumCur;
  String get partyRecruiterId => _partyRecruiterId;
  List<String> get partyMemberId => _partyMemberId;
  double get departurePartyLat => _departurePartyLat;
  double get departurePartyLng => _departurePartyLng;
  double get destinationPartyLat => _destinationPartyLat;
  double get destinationPartyLng => _destinaationPartyLng;

  void changeAll(
      String inputStatus,
      String inputDate,
      String inputTime,
      String inputStart,
      String inputEnd,
      int inputPeopleNumMax,
      int inputPeopleNumCur,
      String inputPartyRecruiterId,
      List<String> inputPartyMemberId,
      double inputDeparturePartyLat,
      double inputDeparturePartyLng,
      double inputDestinationPartyLat,
      double inputDestinationPartyLng) {
    _status = inputStatus;
    _date = inputDate;
    _time = inputTime;
    _start = inputStart;
    _end = inputEnd;
    _peopleNumMax = inputPeopleNumMax;
    _peopleNumCur = inputPeopleNumCur;
    _partyRecruiterId = inputPartyRecruiterId;
    _partyMemberId = inputPartyMemberId;
    _departurePartyLat = inputDeparturePartyLat;
    _departurePartyLng = inputDeparturePartyLng;
    _destinationPartyLat = inputDestinationPartyLat;
    _destinaationPartyLng = inputDestinationPartyLat;
    notifyListeners();
  }

  void resetAll() {
    _partyId = "";
    _status = "";
    _date = "";
    _time = "";
    _start = "";
    _end = "";
    _peopleNumCur = 0;
    _peopleNumMax = 0;
    _partyRecruiterId = "";
    _partyMemberId = [];
    _departurePartyLat = 0.0;
    _departurePartyLng = 0.0;
    _destinationPartyLat = 0.0;
    _destinaationPartyLng = 0.0;
    notifyListeners();
  }

  void changeName(String inputStatus) {
    _start = inputStatus;
    notifyListeners();
  }

  void changeId(String inputDate) {
    _date = inputDate;
    notifyListeners();
  }

  void changePw(String inputTime) {
    _time = inputTime;
    notifyListeners();
  }

  void changeStart(String inputStart) {
    _start = inputStart;
    notifyListeners();
  }

  void changeEnd(String inputEnd) {
    _end = inputEnd;
    notifyListeners();
  }

  void changeNum(int inputPeopleNum) {
    _peopleNumMax = inputPeopleNum;
    notifyListeners();
  }
}
