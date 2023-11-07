import 'package:flutter/material.dart';
import 'package:flutter_application_1/MongoDBModel.dart';
import 'package:flutter_application_1/login%20&%20signin/login_page.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:flutter_application_1/MongoDBModel.dart';

class Signin_page extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController homeroomController = TextEditingController();

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
                  onPressed: () {
                    _insertToSigninPage(
                      nameController.text,
                      idController.text,
                      pwController.text,
                      phoneController.text,
                      emailController.text,
                      homeroomController.text,
                    );

                    Get.to(() => Login_Page());
                  },
                  child: Text(
                    '회원가입',
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
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _insertToSigninPage(
    // Id idho,
    String name,
    String username,
    String pw,
    String phone,
    String email,
    String homeroom,
  ) async {
    // var id = M.ObjectId();
    final data = Welcome(
        // id: idho,
        userName: username,
        realName: name,
        password: pw,
        phoneNumber: phone,
        email: email,
        carNumber: "",
        carColor: "",
        carType: "",
        homeroom: homeroom,
        userType: "Passenger",
        warning: [],
        penalty: "");
  }
}
