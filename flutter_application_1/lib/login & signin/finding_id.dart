import 'package:flutter_application_1/login%20&%20signin/login_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class finding_id extends StatelessWidget {
  finding_id({super.key});
  TextEditingController EmailInputController = TextEditingController();
  static final storage = FlutterSecureStorage();

  @override
  Future<String> save(String inputEmail) async {
    // final Map<String, String> userDate = {
    //   'username': inputusername,
    //   'password': inputpassword,
    // };
    String? dataToken = await storage.read(key: "token");

    var response = await http.post(
      // Uri.parse('http://10.0.2.1:8000/user/login'),
      // Uri.parse('http://3.27.196.5/user/find'),
      Uri.parse('http://127.0.0.1:8000/user/find'),

      headers: <String, String>{
        // 'Content-Type': 'application/x-www-form-urlencoded'

        'Content-Type': 'application/json; charset=UTF-8',
        // 'Authorization': 'Bearer $dataToken',
      },
      body: jsonEncode(<String, String>{
        'email': inputEmail,
      }),
    );

    if (response.statusCode == 200) {
      // print('okay untul response');
      // print(response.body);
      // print('okay until reponse printing');
      // var val = jsonEncode(r
      //     User(usernameEditingController.text, passwordEditingController.text));
      var data = json.decode(response.body);
      // print(data['message'].runtimeType);

      print('success');
      return data['message'];
    } else if (response.statusCode == 422) {
      print('Response body for 422 error: ${response.body}');
      return "입력하신 이메일이 존재하지 않습니다422";
    } else {
      return "입력하신 이메일이 존재하지 않습니다";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text('',
            style: TextStyle(
                color: Color.fromARGB(255, 110, 110, 110),
                fontWeight: FontWeight.bold)),
      ),
      body: Column(children: [
        SizedBox(
          height: 20,
        ),
        Text('가입시 입력하신 이메일을 입력해주세요', style: TextStyle(fontSize: 17)),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            controller: EmailInputController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '이메일',
                hintText: '이메일을 입력해주세요'),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 20,
        ),
        Row(children: [
          Expanded(flex: 2, child: SizedBox()),
          Expanded(
            flex: 4,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              // borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () async {
                  String data = await save(EmailInputController.text);
                  if (!data.isEmpty) {
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('아이디 찾기'),
                        content: Text(data),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('취소'),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(() => LoginPage());
                            },
                            child: const Text('로그인 하기'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('아이디 찾기 실패'),
                        content: Text(data),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('취소'),
                          ),
                          // TextButton(
                          //   onPressed: () {
                          //     Get.to(() => LoginPage());
                          //   },
                          //   child: const Text('),
                          // ),
                        ],
                      ),
                    );
                  }
                  Get.back();
                },
                child: Text(
                  '아이디 찾기',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(flex: 2, child: SizedBox()),
        ]),
      ]),
    );
  }
}
