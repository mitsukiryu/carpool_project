import 'package:flutter/material.dart';

class UserInformationProvider extends ChangeNotifier {
  String _name = "류황희";
  String _id = "myidis3939";
  String _pw = "mypwis8989";
  String _phoneNumber = "01063004833";
  String _email = "his1234@his.sc.kr";
  String _status = "Passenger";

  String get name => _name;
  String get id => _id;
  String get pw => _pw;
  String get phoneNumber => _phoneNumber;
  String get email => _email;
  String get status => _status;

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
