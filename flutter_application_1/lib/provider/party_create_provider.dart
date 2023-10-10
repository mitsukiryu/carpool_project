import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PartyCreateProvider extends ChangeNotifier {
  String _status = "";
  String _date = "";
  String _time = "";
  String _start = "";
  String _end = "";
  int _peoplenum = 0;

  String get status => _status;
  String get date => _date;
  String get time => _time;
  String get start => _start;
  String get end => _end;
  int get peoplenum => _peoplenum;

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

  void changePhoneNumber(String inputStart) {
    _start = inputStart;
    notifyListeners();
  }

  void changeEmail(int inputPeopleNum) {
    _peoplenum = inputPeopleNum;
    notifyListeners();
  }

  void resetAll() {
    _status = "";
    _date = "";
    _time = "";
    _start = "";
    _end = "";
    _peoplenum = 0;
    notifyListeners();
  }
}
