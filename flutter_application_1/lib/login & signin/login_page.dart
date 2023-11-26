import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/class/user_Info.dart';
import 'package:flutter_application_1/login%20&%20signin/finding_id.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/provider/party_create_provider.dart';
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
  String partyId = "";
  String inputStatus = "";
  String inputdate = "";
  String inputTime = "";
  String inputStart = "";
  String inputEnd = "";
  int inputMaxNum = 0;
  int inputCurNum = 0;
  String subLeaderName = "";
  // List<dynamic> inputMemberList = [];
  List<String> inputMemberList = [];
  // String inputType = "";
  // static final storage = FlutterSecureStorage();
  List<String> memberNameList = [];
  List<String> memberPhoneList = [];

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
      Map<String, dynamic> data = json.decode(utf8.decode(response.bodyBytes));

      return data;
    } else {
      print(response.statusCode);
      return;
    }
  }

  @override
  Future total() async {
    await getNameEmail(subLeaderName);
    for (String i in inputMemberList) {
      await getNameEmail(i);
    }
    return true;
  }

  @override
  Future getNameEmail(String inputUserId) async {
    var response = await http.post(
      // Uri.parse('http://10.0.2.1:8000/user/login'),
      // Uri.parse('http://3.27.196.5/user/find'),
      Uri.parse('http://127.0.0.1:8000/user/getNamePhone'),

      headers: <String, String>{
        // 'Content-Type': 'application/x-www-form-urlencoded'

        'Content-Type': 'application/json; charset=UTF-8',
        // 'Authorization': 'Bearer $dataToken',
      },
      body: jsonEncode(<String, String>{
        'user_name': inputUserId,
      }),
    );
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    // var data = json.decode(response.body);
    print("사람이름은" + data['real_name']);
    print("전화번호이름은" + data['phone_number']);

    if (response.statusCode == 200 ||
        data['message'] != "There is no user with such Id") {
      memberNameList.add(data['real_name'].toString());
      memberPhoneList.add(data['phone_number'].toString());
      print("add 완료");
      return true;
    } else {
      return false;
    }
  }

  @override
  Future saveparty(BuildContext context) async {
    String? loginId = await storage.read(key: "loginId");
    int check = 0;
    print("save check 로 넘어옴");

    final response = await http.get(
      // Uri.parse('http://3.27.196.5/party/create/$dataId'),
      Uri.parse('http://127.0.0.1:8000/party/find/current/$loginId'),

      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded'
      },
    );
    if (response.statusCode == 200 && response.body.toString() != "null") {
      print("Current: 200까지는 넘어왔다");
      Map<String, dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      // print("Current:" + data.toString());
      partyId = data["_id"].toString();

      inputStatus = data["party_type"].toString();
      // print("current" + data["date_time"].toString());

      inputdate = data["date_time"].toString()[0] +
          data["date_time"].toString()[1] +
          data["date_timre"].toString()[2] +
          data["date_time"].toString()[3] +
          '.' +
          data["date_time"].toString()[5] +
          data["date_time"].toString()[6] +
          '.' +
          data["date_time"].toString()[8] +
          data["date_time"].toString()[9];
      inputTime = data["date_time"].toString()[11] +
          data["date_time"].toString()[12] +
          data["date_time"].toString()[13] +
          data["date_time"].toString()[14] +
          data["date_time"].toString()[15];

      inputStart = data["destination"].toString();
      inputEnd = data["departure"].toString();
      inputMaxNum = int.parse(data["max_recruitment"].toString());
      // print("current:" + inputMaxNum.toString());
      inputCurNum = int.parse(data["cur_recruitment"].toString());
      subLeaderName = data["party_recruiter_id"].toString();
      // print("current" + data["party_member_id"].runtimeType.toString());
      // print(data["party_member_id"][0].toString());
      // List<> listData =
      //     jsonDecode(utf8.decode(data["party_member_id"]));
      // print("current" + listData.toString());
      List<dynamic> datadata = data["party_member_id"];
      inputMemberList = datadata.map((e) => e.toString()).toList();
      print("current" + inputMemberList.runtimeType.toString());

      Provider.of<PartyCreateProvider>(context, listen: false).changeAll(
          inputStatus,
          inputdate,
          inputTime,
          inputStart,
          inputEnd,
          inputMaxNum,
          inputCurNum,
          subLeaderName,
          inputMemberList,
          //dynamic 이라 안될수도
          0.0,
          0.0,
          0.0,
          0.0);
      await total();
      await storage.write(key: "partyId", value: partyId);
      return true;
    }

    final response2 = await http.get(
      // Uri.parse('http://3.27.196.5/party/create/$dataId'),
      Uri.parse('http://127.0.0.1:8000/party/find/currentMine/$loginId'),

      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded'
      },
    );
    if (response2.statusCode == 200 && response2.body.toString() != "null") {
      print("성공인듯");
      Map<String, dynamic> data2 =
          json.decode(utf8.decode(response2.bodyBytes));
      // print("Current:" + data.toString());
      partyId = data2["_id"].toString();

      inputStatus = data2["party_type"].toString();
      // print("current" + data["date_time"].toString());

      inputdate = data2["date_time"].toString()[0] +
          data2["date_time"].toString()[1] +
          data2["date_timre"].toString()[2] +
          data2["date_time"].toString()[3] +
          '.' +
          data2["date_time"].toString()[5] +
          data2["date_time"].toString()[6] +
          '.' +
          data2["date_time"].toString()[8] +
          data2["date_time"].toString()[9];
      inputTime = data2["date_time"].toString()[11] +
          data2["date_time"].toString()[12] +
          data2["date_time"].toString()[13] +
          data2["date_time"].toString()[14] +
          data2["date_time"].toString()[15];

      inputStart = data2["destination"].toString();
      inputEnd = data2["departure"].toString();
      inputMaxNum = int.parse(data2["max_recruitment"].toString());
      // print("current:" + inputMaxNum.toString());
      inputCurNum = int.parse(data2["cur_recruitment"].toString());
      subLeaderName = data2["party_recruiter_id"].toString();
      // print("current" + data["party_member_id"].runtimeType.toString());
      // print(data["party_member_id"][0].toString());
      // List<> listData =
      //     jsonDecode(utf8.decode(data["party_member_id"]));
      // print("current" + listData.toString());
      List<dynamic> datadata = data2["party_member_id"];
      inputMemberList = datadata.map((e) => e.toString()).toList();
      print("current" + inputMemberList.runtimeType.toString());

      Provider.of<PartyCreateProvider>(context, listen: false).changeAll(
          inputStatus,
          inputdate,
          inputTime,
          inputStart,
          inputEnd,
          inputMaxNum,
          inputCurNum,
          subLeaderName,
          inputMemberList,
          //dynamic 이라 안될수도
          0.0,
          0.0,
          0.0,
          0.0);
      await total();
      await storage.write(key: "partyId", value: partyId);
      return true;
    }
    return false;
  }

  @override
  bool checking() {
    if (usernameEditingController.text.isNotEmpty &&
        passwordEditingController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  @override
  Future save(String inputusername, String inputpassword) async {
    final Map<String, String> userDate = {
      'username': inputusername,
      'password': inputpassword,
    };

    var response = await http.post(
      // Uri.parse('http://10.0.2.1:8000/user/login'),
      // Uri.parse('http://3.27.196.5/user/login'),
      Uri.parse('http://127.0.0.1:8000/user/login'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: userDate,
    );

    if (response.statusCode == 200) {
      // var val = jsonEncode(
      //     User(usernameEditingController.text, passwordEditingController.text));
      Map<String, dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));

      // Map<String, dynamic> data = json.decode(response.body);
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
                      var data = await getData();
                      print(data.toString());
                      print(data['real_name'].toString());
                      if (data['user_type'] == "Passenger") {
                        Provider.of<UserInformationProvider>(context,
                                listen: false)
                            .changeAllPassenger(
                                data['real_name'],
                                data['user_name'],
                                data['password'],
                                data['phone_number'],
                                data['email'],
                                data['homeroom']);
                        await saveparty(context);
                      } else if (data['user_type'] == "Driver") {
                        Provider.of<UserInformationProvider>(context,
                                listen: false)
                            .changeAllDriver(
                                data['real_name'],
                                data['user_name'],
                                data['password'],
                                data['phone_number'],
                                data['email'],
                                data['car_number'],
                                data['car_color'],
                                data['car_type']);
                        await saveparty(context);
                      }
                      print('성공');

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
                    Get.to(() => finding_id());
                  },
                  child: Text(
                    '아이디 찾기',
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
                    // final response = await Dio().post('http://3.27.196.5/user/login', data: jsonEncode(Map loginInfo))

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
