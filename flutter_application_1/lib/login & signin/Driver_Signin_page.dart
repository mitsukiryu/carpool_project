import 'dart:convert';
import 'package:flutter_application_1/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class Driver_Signin_page extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController carNumberController = TextEditingController();
  TextEditingController carColorController = TextEditingController();
  TextEditingController carTypeController = TextEditingController();

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
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: FutureBuilder(
                      future: postSigninInfo(),
                      builder: (context, snapshot) {
                        return TextButton(
                            child: Text("회원가입"),
                            onPressed: () {
                              Get.to(Homescreen());
                              // switch (snapshot.data) {
                              //   case "FAILURE: 비밀번호가 일치하지 않습니다":
                              //     showDialog(
                              //         context: context,
                              //         builder: (context) {
                              //           return AlertDialog(
                              //             title: Text("로그인 실패"),
                              //             content: Text("비밀번호가 일치하지 않습니다"),
                              //             actions: [
                              //               TextButton(
                              //                   onPressed: () {
                              //                     Get.back();
                              //                   },
                              //                   child: Text("확인"))
                              //             ],
                              //           );
                              //         });
                              //     break;

                              //   case "FAILURE: 이메일 주소가 존재하지 않습니다":
                              //     showDialog(
                              //         context: context,
                              //         builder: (context) {
                              //           return AlertDialog(
                              //             title: Text("로그인 실패"),
                              //             content: Text("이메일 주소가 존재하지 않습니다"),
                              //             actions: [
                              //               TextButton(
                              //                   onPressed: () {
                              //                     Get.back();
                              //                   },
                              //                   child: Text("확인"))
                              //             ],
                              //           );
                              //         });
                              //     break;

                              //   default:
                              //     Get.to(Homescreen());
                              //     break;
                              // }
                            });
                      })
                  // child: TextButton(
                  //   onPressed: () {
                  //     // _insertToDriverSigninPage(
                  //     //   nameController.text,
                  //     //   idController.text,
                  //     //   pwController.text,
                  //     //   phoneController.text,
                  //     //   emailController.text,
                  //     //   carNumberController.text,
                  //     //   carColorController.text,
                  //     //   carTypeController.text,
                  //     // );

                  //     // Get.to(() => LoginPage());
                  //   },
                  //   child: Text(
                  //     '회원가입',
                  //     style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.bold),
                  //   ),
                  // ),
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

  Future<Map> postSigninInfo() async {
    Map SigninInfo = {
      'user_name': idController.text,
      'real_name': nameController.text,
      'password': pwController.text,
      'phone_number': phoneController.text,
      'email': emailController.text,
      'car_number': carNumberController.text,
      'car_color': carColorController.text,
      'homeroom': "none",
      'user_type': "Driver",
      'warning': [],
      'penalty': 0
    };
    print('##### SigninInfoMap is ${SigninInfo} #####');
    final response = await Dio().post(
      'http://http://127.0.0.1:8000//user/create',
      data: jsonEncode(SigninInfo),
    );
    return response.data;
  }
}
