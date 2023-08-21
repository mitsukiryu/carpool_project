import 'package:flutter/material.dart';
import '../HomeScreen.dart';
import 'package:get/get.dart';
import 'Signin_choose.dart';
import 'Singin_page.dart';

class Login_Page extends StatelessWidget {
  const Login_Page({super.key});

//   @override
//   State<Login_Page> createState() => _Login_PageState();
// }

// class _Login_PageState extends State<Login_Page> {
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
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '아이디',
                  hintText: '가입하신 이메일을 입력해주세요'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
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
              onPressed: () {
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
                child: SizedBox(),
                flex: 1,
              ),
              Expanded(
                flex: 4,
                child: TextButton(
                  onPressed: () {
                    Get.to(() => Signin_choose());
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
                child: SizedBox(),
                flex: 1,
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
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
                child: SizedBox(),
                flex: 1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
