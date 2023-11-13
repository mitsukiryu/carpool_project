import 'dart:convert';
import 'package:flutter/material.dart';
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

  // Future<Map> loginInfo = Future.value({"user_name": usernameEditingController.text, "password": });

  // @override
  // Widget build(BuildContext context) {
  //   Future<Map> getData() async {
  //     Map SigninInfo = {"user_name" : usernameEditingController.text, "password" : }
  //   }

  @override
  bool checking() {
    if (usernameEditingController.text.isNotEmpty &&
        passwordEditingController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  // @override
  // saveThree(String inputusername, String inputpassword) async {
  //   try {
  //     var dio = Dio();
  //     final Map<String, String> userData = {
  //       'user_name': inputusername,
  //       'password': inputpassword,
  //     };

  //     final response = await dio.post('http://127.0.0.1:8000/users/login',
  //         data: jsonEncode(userData));
  //     if (response.statusCode == 200) {
  //       final jsonBody = json.decode(response.data['user_id'].toString());
  //       return true;
  //       // 직렬화를 이용하여 데이터를 입출력하기 위해 model.dart에 Login 정의 참고
  //       //   var val = jsonEncode(Login('$accountName', '$password', '$jsonBody'));

  //       // 	await storage.write(
  //       //     key: 'login',
  //       //     value: val,
  //       //   );
  //       //   print('접속 성공!');
  //       //   return true;
  //       // } else {
  //       //   print('error');
  //       //   return false;
  //       // }
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     return false;
  //   }
  // }

  @override
  Future save(String inputusername, String inputpassword) async {
    final Map<String, String> userDate = {
      'username': inputusername,
      'password': inputpassword,
    };

    var response = await http.post(
      // Uri.parse('http://10.0.2.1:8000/user/login'),
      Uri.parse('http://127.0.0.1:8000/user/login'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: userDate,
    );

    if (response.statusCode == 200) {
      // var val = jsonEncode(
      //     User(usernameEditingController.text, passwordEditingController.text));
      Map<String, dynamic> data = json.decode(response.body);
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
  static void storeToken(String token) async {
    await storage.write(key: "token", value: token);
  }

  @override
  Future<Map<String, String>> saveTwo(
    String inputusername,
    String inputpassword,
  ) async {
    final Map<String, String> userData = {
      'username': inputusername,
      'password': inputpassword,
    };

    final response = await Dio().post(
      'http://127.0.0.1:8000/user/login',
      data: jsonEncode(userData),
    );

    //     await http.post(
    //   Uri.parse('http://127.0.0.1:8000/user/login'),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: jsonEncode(userData),
    // );

    if (response.statusCode == 401) {
      print('Response body for 401 error: ${response.data}');
    } else if (response.statusCode == 404) {
      print('Response body for 404 error: ${response.data}');
    } else if (response.statusCode == 200) {
      print('success');
    } else {
      print("other error");
    }

    return response.data;
  }

  @override
  saveThree(inputusername, inputpassword) async {
    try {
      var dio = Dio();
      var param = {'username': inputusername, 'password': inputpassword};

      final response =
          await dio.post('http://127.0.0.1:8000/user/login', data: param);

      if (response.statusCode == 200) {
        final jsonBody = json.decode(response.data['user_id'].toString());
        // 직렬화를 이용하여 데이터를 입출력하기 위해 model.dart에 Login 정의 참고
        var val = jsonEncode(User(
            usernameEditingController.text, passwordEditingController.text));
        await storage.write(key: 'login', value: val);

        await storage.write(
          key: 'login',
          value: val,
        );
        print('접속 성공!');
        return true;
      } else {
        print('error');
        return false;
      }
    } catch (e) {
      return false;
    }
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
                      Provider.of<UserInformationProvider>(context,
                              listen: false)
                          .changeId(
                        usernameEditingController.text,
                      );
                      Provider.of<UserInformationProvider>(context,
                              listen: false)
                          .changeId(
                        passwordEditingController.text,
                      );
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

          //     switch (snapshot.data) {
          //       case "message: No such username exist.":
          //         showDialog(
          //             context: context,
          //             builder: (BuildContext context) =>
          //                 AlertDialog(
          //                   title: const Text('로그인 실패'),
          //                   content:
          //                       const Text('비밀번호가 일치하지 않습니다'),
          //                   actions: <Widget>[
          //                     TextButton(
          //                       onPressed: () =>
          //                           Navigator.pop(context, 'OK'),
          //                       child: const Text('OK'),
          //                     ),
          //                   ],
          //                 ));
          //         break;
          //       default:
          //         Provider.of<UserInformationProvider>(context,
          //                 listen: false)
          //             .changeId(
          //           usernameEditingController.text,
          //         );
          //         Provider.of<UserInformationProvider>(context,
          //                 listen: false)
          //             .changeId(
          //           passwordEditingController.text,
          //         );
          //         Get.offAll(() => Homescreen());
          //     }
          //   } else {
          //     showDialog(
          //       context: context,
          //       builder: (BuildContext context) => AlertDialog(
          //         title: const Text('입력 오류'),
          //         content: const Text('모든 필드를 입력해주세요.'),
          //         actions: <Widget>[
          //           TextButton(
          //             onPressed: () =>
          //                 Navigator.pop(context, 'OK'),
          //             child: const Text('OK'),
          //           ),
          //         ],
          //       ),
          //     );
          //   }

          //   // if (checking()) {
          //   //   save(
          //   //     usernameEditingController.text,
          //   //     passwordEditingController.text,
          //   //   );
          //   //   print('##### 토큰 정보 : ${save(
          //   //     usernameEditingController.text,
          //   //     passwordEditingController.text,
          //   //   ).toString()} #####');
          //   //   Provider.of<UserInformationProvider>(context, listen: false)
          //   //       .changeId(
          //   //     usernameEditingController.text,
          //   //   );
          //   //   Provider.of<UserInformationProvider>(context, listen: false)
          //   //       .changeId(
          //   //     passwordEditingController.text,
          //   //   );
          //   //   Get.offAll(() => Homescreen());
          //   // } else {
          //   //   showDialog(
          //   //     context: context,
          //   //     builder: (BuildContext context) => AlertDialog(
          //   //       title: const Text('입력 오류'),
          //   //       content: const Text('모든 필드를 입력해주세요.'),
          //   //       actions: <Widget>[
          //   //         TextButton(
          //   //           onPressed: () => Navigator.pop(context, 'OK'),
          //   //           child: const Text('OK'),
          //   //         ),
          //   //       ],
          //   //     ),
          //   //   );
          //   // }
          // },
          // child: Text(
          //   '로그인',
          //   style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 20,
          //       fontWeight: FontWeight.bold),
          // )));

          // FutureBuilder(
          //     future: saveThree(usernameEditingController.text,
          //         passwordEditingController.text),
          //     builder: (context, snapshot) {
          //       return Container(
          //           height: 50,
          //           width: 250,
          //           decoration: BoxDecoration(
          //               color: Colors.blue,
          //               borderRadius: BorderRadius.circular(20)),
          //           child: TextButton(
          //               onPressed: () {
          //                 print(snapshot.data.toString());
          //                 if (checking()) {
          //                   switch (snapshot.data) {
          //                     case "message: No such username exist.":
          //                       showDialog(
          //                           context: context,
          //                           builder: (BuildContext context) =>
          //                               AlertDialog(
          //                                 title: const Text('로그인 실패'),
          //                                 content:
          //                                     const Text('비밀번호가 일치하지 않습니다'),
          //                                 actions: <Widget>[
          //                                   TextButton(
          //                                     onPressed: () =>
          //                                         Navigator.pop(context, 'OK'),
          //                                     child: const Text('OK'),
          //                                   ),
          //                                 ],
          //                               ));
          //                       break;
          //                     default:
          //                       Provider.of<UserInformationProvider>(context,
          //                               listen: false)
          //                           .changeId(
          //                         usernameEditingController.text,
          //                       );
          //                       Provider.of<UserInformationProvider>(context,
          //                               listen: false)
          //                           .changeId(
          //                         passwordEditingController.text,
          //                       );
          //                       Get.offAll(() => Homescreen());
          //                   }
          //                 } else {
          //                   showDialog(
          //                     context: context,
          //                     builder: (BuildContext context) => AlertDialog(
          //                       title: const Text('입력 오류'),
          //                       content: const Text('모든 필드를 입력해주세요.'),
          //                       actions: <Widget>[
          //                         TextButton(
          //                           onPressed: () =>
          //                               Navigator.pop(context, 'OK'),
          //                           child: const Text('OK'),
          //                         ),
          //                       ],
          //                     ),
          //                   );
          //                 }

          //                 // if (checking()) {
          //                 //   save(
          //                 //     usernameEditingController.text,
          //                 //     passwordEditingController.text,
          //                 //   );
          //                 //   print('##### 토큰 정보 : ${save(
          //                 //     usernameEditingController.text,
          //                 //     passwordEditingController.text,
          //                 //   ).toString()} #####');
          //                 //   Provider.of<UserInformationProvider>(context, listen: false)
          //                 //       .changeId(
          //                 //     usernameEditingController.text,
          //                 //   );
          //                 //   Provider.of<UserInformationProvider>(context, listen: false)
          //                 //       .changeId(
          //                 //     passwordEditingController.text,
          //                 //   );
          //                 //   Get.offAll(() => Homescreen());
          //                 // } else {
          //                 //   showDialog(
          //                 //     context: context,
          //                 //     builder: (BuildContext context) => AlertDialog(
          //                 //       title: const Text('입력 오류'),
          //                 //       content: const Text('모든 필드를 입력해주세요.'),
          //                 //       actions: <Widget>[
          //                 //         TextButton(
          //                 //           onPressed: () => Navigator.pop(context, 'OK'),
          //                 //           child: const Text('OK'),
          //                 //         ),
          //                 //       ],
          //                 //     ),
          //                 //   );
          //                 // }
          //               },
          //               child: Text(
          //                 '로그인',
          //                 style: TextStyle(
          //                     color: Colors.white,
          //                     fontSize: 20,
          //                     fontWeight: FontWeight.bold),
          //               )));
          //     }),
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
                    // final response = await Dio().post('http://127.0.0.1:8000/user/login', data: jsonEncode(Map loginInfo))

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
