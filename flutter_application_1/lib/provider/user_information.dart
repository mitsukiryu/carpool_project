import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/MongoDBModel.dart';
import 'package:provider/provider.dart';

class UserInformationProvider extends ChangeNotifier {
  String _name = "류황희";
  String _id = "myidis3939";
  String _pw = "mypwis8989";
  String _phoneNumber = "01063004833";
  String _email = "his1234@his.sc.kr";
  String _status = "Passenger";
  String _carNumber = "";
  String _carColor = "";
  String _carType = "";
  String _homeroom = "";
  int _penealty = 0;
  List _warnings = [];

  String get name => _name;
  String get id => _id;
  String get pw => _pw;
  String get phoneNumber => _phoneNumber;
  String get email => _email;
  String get status => _status;
  String get CarNumber => _carNumber;
  String get carColor => _carColor;
  String get carType => _carType;
  String get homeroom => _homeroom;
  int get penealty => _penealty;
  List get warnings => _warnings;

  void changeCarColor(String inputCarColor) {
    _name = inputCarColor;
    notifyListeners();
  }

  void changeCarNumber(String inputCarNumber) {
    _name = inputCarNumber;
    notifyListeners();
  }

  void changeCarType(String inputCarType) {
    _name = inputCarType;
    notifyListeners();
  }

  void changeHomeroom(String inputHomeroom) {
    _name = inputHomeroom;
    notifyListeners();
  }

  void changeName(String inputName) {
    _name = inputName;
    notifyListeners();
  }

  void changeId(String inputId) {
    _id = inputId;
    notifyListeners();
  }

  void changePw(String inputPw) {
    _pw = inputPw;
    notifyListeners();
  }

  void changePhoneNumber(String inputPhoneNumber) {
    _phoneNumber = inputPhoneNumber;
    notifyListeners();
  }

  void changeEmail(String inputEmail) {
    _email = inputEmail;
    notifyListeners();
  }

  void changeStatus(String inputStatus) {
    _status = inputStatus;
    notifyListeners();
  }
}
