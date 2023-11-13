import 'package:flutter/material.dart';
import 'package:flutter_application_1/SplashScreen.dart';
import 'package:flutter_application_1/login%20&%20signin/login_page.dart';
import 'package:flutter_application_1/provider/user_information.dart';
import 'package:flutter_application_1/provider/party_create_provider.dart';
import 'package:get/get.dart';
import 'HomeScreen.dart';
import 'party_list.dart';
import 'MyInfo.dart';
import 'EditProfile.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (BuildContext context) => UserInformationProvider()),
    ChangeNotifierProvider(
      create: (BuildContext context) => PartyCreateProvider(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // home: party_list(),
      home: SplashScreen(),
      getPages: [
        GetPage(
          name: '/',
          // page: () => party_list(),

          page: () => SplashScreen(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginPage(),
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
          page: () => EditProfile(),
        )
      ],
    );
  }
}
