import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/class/user_Info.dart';
import 'package:flutter_application_1/login%20&%20signin/finding_id.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/provider/user_information.dart';
import '../HomeScreen.dart';
import 'package:get/get.dart';
import 'Signin_choose.dart';
import 'choosing_finding_id_pw.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatefulWidget {
  @override
  _Login_PageState createState() => _Login_PageState();
}

class _Login_PageState extends State<LoginPage> {
  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  static final storage = FlutterSecureStorage();
  dynamic userInfo = '';

  @override
  bool checking() {
    if (usernameEditingController.text.isNotEmpty &&
        passwordEditingController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  @override
  Future save(String inputusername, String inputpassword) async {
    final Map<String, String> userDate = {
      'username': inputusername,
      'password': inputpassword,
    };

    var response = await http.post(
      // Uri.parse('http://10.0.2.1:8000/user/login'),
      Uri.parse('http://3.27.196.5/user/login'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: userDate,
    );

    if (response.statusCode == 200) {
      // var val = jsonEncode(
      //     User(usernameEditingController.text, passwordEditingController.text));
      Map<String, dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));

      // Map<String, dynamic> data = json.decode(response.body);
      String accessToken = data['access_token'];
      print(accessToken);

      await storage.write(
          key: 'loginId', value: usernameEditingController.text);
      await storage.write(
          key: 'loginPw', value: passwordEditingController.text);
      await storage.write(key: 'token', value: accessToken);
      print(await storage.read(key: 'token'));

      print('success');
      return true;
    } else if (response.statusCode == 422) {
      print('Response body for 422 error: ${response.body}');
      return false;
    } else {
      // Handle other status codes
    }
  }

  @override
  Future getData() async {
    String? dataToken = await storage.read(key: "token");

    final response = await http.get(
        Uri.parse('http://3.27.196.5/user/user_info'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $dataToken',
        });
    if (response.statusCode == 200) {
      // Here i declare the jsonDecode typ as
      // List<dynamic> to give it the right type

      Map<String, dynamic> data = json.decode(utf8.decode(response.bodyBytes));

      // final jsonData =
      //     jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
      // // final jsonData = jsonDecode(response.body) as List<dynamic>;

      // final data = jsonDecode(response.body);

      // // Here i cast the List<dynamic> jsonData to List<Map<String,dynamic>>
      // final castedData = List<Map<String, dynamic>>.from(data);
      // // Here i convert the castedData to the a List<Party> model
      // final users = castedData.map(User_Info.fromJson);
      // // print(users);
      return data;
    } else {
      print(response.statusCode);
      return;
    }
  }

  @override
  static void storeToken(String token) async {
    await storage.write(key: "token", value: token);
  }

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
                  child: Text(
                    '로그인',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () async {
                    if (await save(usernameEditingController.text,
                            passwordEditingController.text) ==
                        true) {
                      print("Went in");
                      var data = await getData();
                      print(data.toString());
                      print(data['real_name'].toString());
                      if (data['user_type'] == "Passenger") {
                        Provider.of<UserInformationProvider>(context,
                                listen: false)
                            .changeAllPassenger(
                                data['real_name'],
                                data['user_name'],
                                data['password'],
                                data['phone_number'],
                                data['email'],
                                data['homeroom']);
                      } else if (data['user_type'] == "Driver") {
                        Provider.of<UserInformationProvider>(context,
                                listen: false)
                            .changeAllDriver(
                                data['real_name'],
                                data['user_name'],
                                data['password'],
                                data['phone_number'],
                                data['email'],
                                data['car_number'],
                                data['car_color'],
                                data['car_type']);
                      }
                      print('성공');

                      Get.offAll(() => Homescreen());
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('로그인 실패'),
                          content: const Text('입력정보가 일치하지 않습니다'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                  // else {
                  //   print("로그인 실패");
                  //   showDialog(
                  //       context: context,
                  //       builder: (BuildContext context) => AlertDialog(
                  //             title: const Text('로그인 실패'),
                  //             content: const Text('입력정보가 일치하지 않습니다'),
                  //             actions: <Widget>[
                  //               TextButton(
                  //                 onPressed: () =>
                  //                     Navigator.pop(context, 'OK'),
                  //                 child: const Text('OK'),
                  //               ),
                  //             ],
                  //           ));
                  // }
                  )),
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
                    Get.to(() => finding_id());
                  },
                  child: Text(
                    '아이디 찾기',
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
                    // final response = await Dio().post('http://3.27.196.5/user/login', data: jsonEncode(Map loginInfo))

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
