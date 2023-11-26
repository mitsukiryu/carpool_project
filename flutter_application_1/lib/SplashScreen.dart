import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomeScreen.dart';
import 'package:flutter_application_1/login%20&%20signin/Signin_choose.dart';
import 'package:get/get.dart';
import 'login & signin/login_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'provider/user_information.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });

    super.initState();
  }

  _asyncMethod() async {
    print(await storage.read(key: 'loginId'));
    userInfo = await storage.read(key: 'loginId');

    // user의 정보가 있다면 로그인 후 들어가는 첫 페이지로 넘어가게 합니다.

    if (userInfo != null) {
      var data = await getData();
      if (data['user_type'] == "Passenger") {
        Provider.of<UserInformationProvider>(context, listen: false)
            .changeAllPassenger(
                data['real_name'],
                data['user_name'],
                data['password'],
                data['phone_number'],
                data['email'],
                data['homeroom']);
      } else if (data['user_type'] == "Driver") {
        Provider.of<UserInformationProvider>(context, listen: false)
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
      Get.to(() => Homescreen());
    } else {
      print('로그인이 필요합니다');
      Get.to(() => LoginPage());
    }
  }

  @override
  Future getData() async {
    String? dataToken = await storage.read(key: "token");

    final response = await http.get(
        // Uri.parse('http://3.27.196.5/user/user_info'),
        Uri.parse('http://127.0.0.1:8000/user/user_info'),
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
                    Get.to(() => Signin_choose());
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
