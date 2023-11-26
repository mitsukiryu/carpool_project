import 'package:path/path.dart' as Path;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomeScreen.dart';
import 'package:flutter_application_1/current_party.dart';
import 'package:flutter_application_1/provider/party_create_provider.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

//지금 문제는 future 가 다른 메서드 시작하기 전까지 되지 않아서 우선순위에서 밀림

class sub_party_list extends StatelessWidget {
  final String subLeaderName;
  final String inputId;
  final String inputdate;
  final String inputType;
  final String inputStart;
  final String inputEnd;
  final String inputStatus;
  final List<String> inputMemberList;
  final int inputMaxNum;
  final int inputCurNum;

  static final storage = FlutterSecureStorage();
  List<String> memberNameList = [];
  List<String> memberPhoneList = [];

  sub_party_list(
      this.subLeaderName,
      this.inputId,
      this.inputdate,
      this.inputType,
      this.inputStart,
      this.inputEnd,
      this.inputStatus,
      this.inputMemberList,
      this.inputMaxNum,
      this.inputCurNum);

  @override
  Future save(BuildContext context) async {
    String? dataId = await storage.read(key: "loginId");
    String? dataToken = await storage.read(key: "token");

    final response = await http.put(
      // Uri.parse('http://3.27.196.5/party/join/$inputId/$dataId'),
      Uri.parse('http://127.0.0.1:8000/party/join/$inputId/$dataId'),

      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $dataToken',
      },
    );
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200 && data['message'] != "Party is full") {
      Provider.of<PartyCreateProvider>(context, listen: false).changeAll(
          inputStatus,
          inputdate[0] +
              inputdate[1] +
              inputdate[2] +
              inputdate[3] +
              inputdate[4] +
              inputdate[5] +
              inputdate[6] +
              inputdate[7] +
              inputdate[8],
          inputdate[10] +
              inputdate[11] +
              inputdate[12] +
              inputdate[13] +
              inputdate[14],
          inputStart,
          inputEnd,
          inputMaxNum,
          inputCurNum,
          subLeaderName,
          inputMemberList,
          0.0,
          0.0,
          0.0,
          0.0);

      await storage.write(key: "partyId", value: inputId);
      return true;
    } else {
      return false;
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
  int contextFont = 3;
  int contextSpace = 1;
  double subInfo = 22;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: total(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // If an error occurs, display an error message
          return Text('Error: ${snapshot.error}');
        } else {
          // If data is available, display it
          // List<String> namePhoneList = snapshot.data!;
          // print("리더의 이름 전번: $namePhoneList");

          return Scaffold(
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
              ),
              body: Column(
                children: [
                  Container(
                    height: 110,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 229, 228, 228),
                      border: Border.all(
                        color: const Color.fromARGB(255, 229, 228, 228),
                      ),
                      // borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: contextSpace,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 6,
                          child: Column(children: [
                            Expanded(
                              flex: 1,
                              child: SizedBox(),
                            ),
                            Expanded(flex: 3, child: Text(inputType)),
                            Expanded(
                                flex: 6,
                                child: Container(
                                  width: 70, // 동그란 모양의 틀의 지름을 나타내는 값
                                  height: 70,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey, // 동그란 모양의 틀의 배경색
                                    image: DecorationImage(
                                      image: inputType == '택시'
                                          ? AssetImage(
                                              'images/taxi_icon.jpg') // 택시 이미지의 경로
                                          : inputType == '카풀'
                                              ? AssetImage(
                                                  'images/car_icon.jpg') // 카풀 이미지의 경로
                                              : AssetImage(
                                                  'assets/default_image.png'), // 기본 이미지 경로
                                      fit: BoxFit
                                          .cover, // 이미지를 동그란 틀에 맞춰서 보여주도록 설정
                                    ),
                                  ),
                                )),
                            Expanded(
                              child: SizedBox(),
                              flex: 1,
                            )
                          ]),
                        ),
                        Expanded(
                          child: SizedBox(),
                          flex: 2,
                        ),
                        Expanded(
                            flex: 18,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(' ',
                                      style: TextStyle(
                                        fontSize: 3.0,
                                      )),
                                  Text(inputStart,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      )),
                                  Text(inputEnd,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      )),
                                  Text(' ',
                                      style: TextStyle(
                                        fontSize: 7.0,
                                      )),
                                  Text(inputdate[0] +
                                      inputdate[1] +
                                      inputdate[2] +
                                      inputdate[3] +
                                      '.' +
                                      inputdate[5] +
                                      inputdate[6] +
                                      '.' +
                                      inputdate[8] +
                                      inputdate[9] +
                                      '   ' +
                                      inputdate[11] +
                                      inputdate[12] +
                                      inputdate[13] +
                                      inputdate[14] +
                                      inputdate[15])
                                ])),
                        Expanded(
                          child: SizedBox(),
                          flex: 1,
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(inputStatus),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 10,
                        child: Text(
                          '파티장',
                          style: TextStyle(fontSize: subInfo),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 7,
                        child: Text(
                          memberNameList[0],
                          style: TextStyle(fontSize: subInfo),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 14,
                        child: Text(
                          memberPhoneList[0],
                          style: TextStyle(fontSize: subInfo),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    primary:
                        false, // <====  disable scrolling. 리스트뷰 내부는 스크롤 안할거임
                    shrinkWrap: true,
                    itemCount: inputMemberList.length,
                    itemBuilder: (BuildContext context, int index) {
                      int dataindex = index + 1;

                      return Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 10,
                            child: Text(
                              '파티원$dataindex',
                              style: TextStyle(fontSize: subInfo),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 7,
                            child: Text(
                              memberNameList[index],
                              style: TextStyle(fontSize: subInfo),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 14,
                            child: Text(
                              memberPhoneList[index],
                              style: TextStyle(fontSize: subInfo),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: SizedBox(),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(children: [
                    Expanded(flex: 2, child: SizedBox()),
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                        ),
                        // borderRadius: BorderRadius.circular(20)),
                        child: TextButton(
                          onPressed: () async {
                            if (await save(context)) {
                              Get.to(() => Homescreen());
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('참가 오류'),
                                  content: const Text('파티에 참가할수 없습니다'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }

                            // Get.to(() => Homescreen());
                          },
                          child: Text(
                            '참여하기',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Expanded(flex: 2, child: SizedBox()),
                  ]),
                ],
              ));
        }
      },
    );
  }
}
