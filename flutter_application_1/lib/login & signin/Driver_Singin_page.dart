import 'dart:convert';
import 'login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class Driver_Signin_page extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController pwCheckController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController carNumberController = TextEditingController();
  TextEditingController carColorController = TextEditingController();
  TextEditingController carTypeController = TextEditingController();
  var dio = Dio(BaseOptions());

  static String ErrorText = '';

  @override
  bool checking() {
    if (nameController.text.isNotEmpty &&
        idController.text.isNotEmpty &&
        pwController.text.isNotEmpty &&
        pwCheckController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        carNumberController.text.isNotEmpty &&
        carColorController.text.isNotEmpty &&
        carTypeController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool PW_format_check() {
    if (pwController.text.contains(RegExp(r'[0-9]')) &&
        pwController.text.contains(RegExp(r'[A-Za-z]'))) {
      return true;
    }
    return false;
  }

  String error_text() {
    if (checking() && !PW_format_check()) {
      return '비밀번호 형식은 숫자와 문자 조합입니다 숫자를 포함해주세요.';
    } else if (checking() &&
        PW_format_check() &&
        pwController.text != pwCheckController.text) {
      return '비밀번호 확인이 되지 않았습니다.';
    } else {
      return '모든 필드를 확인해주세요.';
    }
  }

  @override
  Future save(
      String inputusername,
      String inputName,
      String inputpassword,
      String inputphoneNumber,
      String inputemail,
      int inputcarNumber,
      String inputcarColor,
      String inputcarType) async {
    final Map<String, dynamic> userData = {
      'user_name': inputusername,
      'real_name': inputName,
      'password': inputpassword,
      'phone_number': inputphoneNumber,
      'email': inputemail,
      'car_number': inputcarNumber, // An integer, not a string
      'car_color': inputcarColor,
      'car_type': inputcarType,
      'homeroom': "",
      'user_type': "Driver",
      'warning': [""],
      'penalty': 0,
    };

    final response = await http.post(
      // Uri.parse('http://10.0.2.2:8000/user/create'),
      // Uri.parse('http://127.0.0.1:8000/user/login'),

      Uri.parse('http://127.0.0.1:8000/user/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userData),
    );

    if (response.statusCode == 422) {
      print('Response body for 422 error: ${response.body}');
    } else if (response.statusCode == 200) {
      print('success');
    } else {
      // Handle other status codes
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, //이거를 false 로 하게 되면 키보드가 올라와도 바뀌지 않는다
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
              size: 30,
            ),
            onPressed: () => Get.back()),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('드라이버 회원가입',
            style: TextStyle(
                color: Color.fromARGB(255, 110, 110, 110),
                fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 230.0,
                width: 190.0,
                padding: EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                ),
                child: Row(children: [
                  Image.asset(
                    'assets/images/saferide.png',
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '이름',
                      hintText: '이름을 입력해주세요'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: idController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '아이디',
                      hintText: '아이디 입력 (6-20자)'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: pwController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '비밀번호',
                      hintText: '비밀번호 입력'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  controller: pwCheckController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '비밀번호 확인',
                      hintText: '비밀번호 재입력'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '전화번호',
                      hintText: '휴대폰 번호 입력 \'-\'제외 11 자리 입력'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '이메일 주소',
                      hintText: '이메일 주소 @gmail.com'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: carNumberController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '차량번호',
                      hintText: '차량번호 입력'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: carColorController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '차량색상',
                      hintText: '차량색상 입력'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: carTypeController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '차량종류',
                      hintText: '차량종류 입력'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(color: Colors.blue),
                child: TextButton(
                    onPressed: () {
                      print(PW_format_check());
                    },
                    child: Text("check")),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  child: Text("회원가입", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    ErrorText = error_text();
                    if (checking() && PW_format_check()) {
                      save(
                        idController.text,
                        nameController.text,
                        pwController.text,
                        phoneController.text,
                        emailController.text,
                        int.parse(carNumberController.text),
                        carColorController.text,
                        carTypeController.text,
                      );
                      // Provider.of<UserInformationProvider>(context,
                      //         listen: false)
                      //     .changeAllDriver(
                      //   idController.text,
                      //   nameController.text,
                      //   pwController.text,
                      //   phoneController.text,
                      //   emailController.text,
                      //   int.parse(carNumberController.text),
                      //   carColorController.text,
                      //   carTypeController.text,
                      // );
                      Get.to(() => LoginPage());
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('입력 오류'),
                          content: Text(ErrorText),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
