import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomeScreen.dart';
import 'package:flutter_application_1/login%20&%20signin/Signin_choose.dart';
import 'package:get/get.dart';
import 'login & signin/login_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static final storage = FlutterSecureStorage();
  dynamic userInfo = '';

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _asyncMethod();
    // });

    super.initState();
  }

  _asyncMethod() async {
    print(await storage.read(key: 'loginId'));
    userInfo = await storage.read(key: 'loginId');

    // user의 정보가 있다면 로그인 후 들어가는 첫 페이지로 넘어가게 합니다.

    if (userInfo != null) {
      Get.to(() => Homescreen());
    } else {
      print('로그인이 필요합니다');
      Get.to(() => LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 225, 225),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 300, // Adjust the size as needed
            color: Colors.grey[300],
            child: Center(
                child: Image(image: AssetImage('assets/images/saferide.png'))),
          ),
          // SizedBox(height: 20),
          // Loading Button with Spinner
          CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.black)), // Replace with your desired loading indicator
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    Get.to(() => LoginPage());
                  },
                  child: Text('로그인')),
              SizedBox(width: 5),
              TextButton(
                  onPressed: () {
                    Get.to(() => Homescreen());
                  },
                  child: Text('회원가입')),
            ],
          )
          // // Buttons
        ],
      ),
    );
    ;
  }
}
