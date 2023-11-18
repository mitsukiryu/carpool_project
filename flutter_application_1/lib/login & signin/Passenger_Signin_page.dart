import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/login%20&%20signin/login_page.dart';
import 'package:flutter_application_1/provider/user_information.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Signin_page extends StatefulWidget {
  const Signin_page({super.key});

  @override
  State<Signin_page> createState() => _Signin_pageState();
}

class _Signin_pageState extends State<Signin_page> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController pwCheckController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController homeroomController = TextEditingController();
  var dio = Dio(BaseOptions());

  @override
  Future save(String inputusername, String inputName, String inputpassword,
      String inputphoneNumber, String inputemail, String inputhomeroom) async {
    final Map<String, dynamic> userData = {
      'user_name': inputusername,
      'real_name': inputName,
      'password': inputpassword,
      'phone_number': inputphoneNumber,
      'email': inputemail,
      'car_number': 0, // An integer, not a string
      'car_color': "",
      'car_type': "",
      'homeroom': inputhomeroom,
      'user_type': "Passenger",
      'warning': [""],
      'penalty': 0,
    };

    final response = await http.post(
      Uri.parse('https://127.0.0.1:8000/user/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userData),
    );

    // final response =
    //     await Dio().post('http://127.0.0.1:8000/users/create', data: userData);

    if (response.statusCode == 422) {
      print('Response body for 422 error: ${response.body}');
    } else if (response.statusCode == 200) {
      print('success');
    } else {
      // Handle other status codes
    }
  }

  @override
  bool filled() {
    if (nameController.text.isNotEmpty &&
        idController.text.isNotEmpty &&
        pwController.text.isNotEmpty &&
        pwCheckController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        homeroomController.text.isNotEmpty) {
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

  bool ID_format_check() {
    if (idController.text.length >= 6) {
      return true;
    }
    return false;
  }

  bool phone_check() {
    if (phoneController.text.length == 11) {
      return true;
    }
    return false;
  }

  bool checking() {
    if (PW_format_check() & filled() & ID_format_check()) {
      return true;
    }
    return false;
  }

  String error_text() {
    if (!PW_format_check()) {
      return '비밀번호 형식은 숫자와 문자 조합입니다 숫자를 포함해주세요.';
    } else if (!ID_format_check()) {
      return '아이디는 6자 이상 입력해주세요.';
    } else if (!filled()) {
      return '모든 필드를 확인해주세요.';
    } else if (!phone_check()) {
      return '전화번호를 정확히 입력해주세요.';
    } else {
      return 'error';
    }
  }

  @override
  void initState() {
    super.initState();
    // fetch_users();
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
        title: Text('페신저 회원가입',
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
                  controller: pwCheckController,
                  obscureText: true,
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
                  maxLength: 11,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
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
                      labelText: '학교 이메일 주소',
                      hintText: '이메일 주소 @his.sc.kr'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: homeroomController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '홈룸',
                      hintText: '홈룸 입력'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    child: Text("회원가입", style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      String e_text = error_text();
                      if (checking()) {
                        save(
                            idController.text,
                            nameController.text,
                            pwController.text,
                            phoneController.text,
                            emailController.text,
                            homeroomController.text);
                        Provider.of<UserInformationProvider>(context,
                                listen: false)
                            .changeAllPassenger(
                                idController.text,
                                nameController.text,
                                pwController.text,
                                phoneController.text,
                                emailController.text,
                                homeroomController.text);
                        Get.offAll(() => LoginPage());
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('입력 오류'),
                            content: Text(e_text),
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
                  )),
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
