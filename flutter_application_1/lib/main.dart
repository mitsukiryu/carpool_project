import 'package:flutter/material.dart';
import 'package:flutter_application_1/SplashScreen.dart';
import 'package:flutter_application_1/provider/user_information.dart';
import 'package:get/get.dart';
import 'HomeScreen.dart';
import 'party_list.dart';
import 'MyInfo.dart';
import 'EditProfile.dart';
import 'package:provider/provider.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'dbHelper/mongodb.dart';
import 'dbHelper/constant.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter/src/widgets/framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongDatabase.connect();
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => UserInformationProvider(),
      child: MyApp()));
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
          name: '/PartyList',
          page: () => party_list(),
        ),
        GetPage(
          name: '/EditProflie',
          page: () => EditProflie(),
        )
      ],
    );
  }
}
