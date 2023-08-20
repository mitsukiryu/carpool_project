import 'package:flutter/material.dart';
import 'package:flutter_application_1/SplashScreen.dart';
import 'package:get/get.dart';
import 'HomeScreen.dart';
import 'PartyList.dart';
import 'MyInfo.dart';
import 'ScreenThree.dart';
import 'EditProfile.dart';
// import 'package:flutter/src/widgets/framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScreen(),
      getPages: [
        GetPage(
          name: '/',
          page: () => SplashScreen(),
        ),
        GetPage(
          name: '/home',
          page: () => Homescreen(),
        ),
        GetPage(
          name: '/info',
          page: () => MyInfo(),
        ),
        GetPage(
          name: '/three',
          page: () => ScreenThree(),
        ),
        GetPage(
          name: '/PartyList',
          page: () => PartyList(),
        ),
        GetPage(
          name: '/EditProflie',
          page: () => EditProflie(),
        )
      ],
    );
  }
}
