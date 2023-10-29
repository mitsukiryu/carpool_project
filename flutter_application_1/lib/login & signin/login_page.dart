import 'dart:convert';
import 'package:flutter/material.dart';
import '../HomeScreen.dart';
import 'package:get/get.dart';
import 'Signin_choose.dart';
import 'choosing_finding_id_pw.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

const String baseUrl = "http://127.0.0.1:8000";

class LoginPage extends StatefulWidget {
  @override
  _Login_PageState createState() => _Login_PageState();
}

class _Login_PageState extends State<LoginPage> {
  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  // Future<Map> loginInfo = Future.value({"user_name": usernameEditingController.text, "password": });

  // @override
  // Widget build(BuildContext context) {
  //   Future<Map> getData() async {
  //     Map SigninInfo = {"user_name" : usernameEditingController.text, "password" : }
  //   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 230.0,
            width: 190.0,
            padding: EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
            ),
            child: Center(
              child: Image.asset(
                'assets/images/saferide.png',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: usernameEditingController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '아이디',
                  hintText: '가입하신 이메일을 입력해주세요'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: passwordEditingController,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '비밀번호',
                  hintText: '비밀번호를 입력해주세요'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              onPressed: () async {
                Map<String, String> loginInfo = {
                  "user_name": usernameEditingController.text,
                  "password": passwordEditingController.text,
                };

                try {
                  final response = await Dio().post(
                    'http://127.0.0.1:8000/user/login',
                    data: jsonEncode(loginInfo),
                  );

                  // 응답 처리를 수행합니다.
                } catch (e) {
                  // 에러 처리를 수행합니다.
                }

                // Login_class note = note.inputValues(usernameEditingController.text, passwordEditingController.text);

                // await LoginController().loginTry(note);
                Get.offAll(() => Homescreen());
              },
              child: Text(
                '로그인',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 4,
                child: TextButton(
                  onPressed: () {
                    Get.to(() => Choosing_finding_id_pw());
                  },
                  child: Text(
                    '아이디 / 비밀번호 찾기',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    // final response = await Dio().post('http://10.0.2.2:8000/user/login', data: jsonEncode(Map loginInfo))

                    Get.to(() => Signin_choose());
                  },
                  child: Text(
                    '회원가입',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// class LoginController {
//   Future<bool> loginTry(Login_class note) async {
// bool is_success = true;
// try {
// var fastApiUrl = Uri.parse(baseUrl + '/user/login');
// http.Response response = await http.post(
// fastApiUrl,
// body: jsonEncode({
// "user_email": note.username,
// "title": note.password,
// },),
// headers: {
// 'accept': 'application/json',
// 'Content-Type': 'application/json'
// },);
// final responseData = json.decode(utf8.decode(response.bodyBytes));
// is_success = responseData ?? false;
// if (response.statusCode != 200) {
// final errorMessage = responseData['detail'];
// print("error : $errorMessage");
// // throw Exception(errorMessage);
// }
// }}}