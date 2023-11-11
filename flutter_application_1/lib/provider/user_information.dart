import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInformationProvider extends ChangeNotifier {
  String _name = "류황희";
  String _id = "myidis3939";
  String _pw = "mypwis8989";
  String _phoneNumber = "01063004833";
  String _email = "his1234@his.sc.kr";
  String _status = "Passenger";
  int _carNumber = 3;
  String _carColor = "Blue";
  String _carType = "Sonata";
  String _homeroom = "12-B";
  int _penealty = 0;
  List _warnings = [];

  String get name => _name;
  String get id => _id;
  String get pw => _pw;
  String get phoneNumber => _phoneNumber;
  String get email => _email;
  String get status => _status;
  int get CarNumber => _carNumber;
  String get carColor => _carColor;
  String get carType => _carType;
  String get homeroom => _homeroom;
  int get penealty => _penealty;
  List get warnings => _warnings;

  void changeAllDriver(
      String inputName,
      String inputId,
      String inputPW,
      String inputPhoneNumber,
      String inputEmail,
      int inputCarNumber,
      String inputCarColor,
      String inputCarType) {
    _name = inputName;
    _id = inputId;
    _pw = inputPW;
    _phoneNumber = inputPhoneNumber;
    _email = inputEmail;
    _carNumber = inputCarNumber;
    _carColor = inputCarColor;
    _carType = inputCarType;
    notifyListeners();
  }

  void changeAllPassenger(
    String inputName,
    String inputId,
    String inputPW,
    String inputPhoneNumber,
    String inputEmail,
    String inputHomeroom,
  ) {
    _name = inputName;
    _id = inputId;
    _pw = inputPW;
    _phoneNumber = inputPhoneNumber;
    _email = inputEmail;
    _homeroom = inputHomeroom;
    notifyListeners();
  }

  void changeCarColor(String inputCarColor) {
    _carColor = inputCarColor;
    notifyListeners();
  }

  void changeCarNumber(int inputCarNumber) {
    _carNumber = inputCarNumber;
    notifyListeners();
  }

  void changeCarType(String inputCarType) {
    _carType = inputCarType;
    notifyListeners();
  }

  void changeHomeroom(String inputHomeroom) {
    _homeroom = inputHomeroom;
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
