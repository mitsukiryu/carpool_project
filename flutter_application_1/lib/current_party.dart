import 'dart:js';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomeScreen.dart';
import 'package:flutter_application_1/provider/party_create_provider.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

//여기서 프로파이더로 하기
//파티 나가기 + 경고 문자 띄우기

class current_party_list extends StatelessWidget {
  String inputStatus = "";
  String inputdate = "";
  String inputTime = "";
  String inputStart = "";
  String inputEnd = "";
  int inputMaxNum = 0;
  int inputCurNum = 0;
  String subLeaderName = "";
  List<String> inputMemberList = [];
  // String inputType = "";
  static final storage = FlutterSecureStorage();
  List<String> memberNameList = [];
  List<String> memberPhoneList = [];

  @override
  save(context) {
    subLeaderName = Provider.of<PartyCreateProvider>(context, listen: false)
        .partyRecruiterId;
    // inputType = Provider.of<PartyCreateProvider>(context, listen: false).status;
    // inputId = Provider.of<PartyCreateProvider>(context, listen: false).partyId;
    inputdate = Provider.of<PartyCreateProvider>(context, listen: false).date;
    inputTime = Provider.of<PartyCreateProvider>(context, listen: false).time;
    inputStart = Provider.of<PartyCreateProvider>(context, listen: false).start;
    inputEnd = Provider.of<PartyCreateProvider>(context, listen: false).end;
    inputStatus =
        Provider.of<PartyCreateProvider>(context, listen: false).status;
    inputMemberList =
        Provider.of<PartyCreateProvider>(context, listen: false).partyMemberId;
    inputMaxNum =
        Provider.of<PartyCreateProvider>(context, listen: false).peopleNumMax;
    inputCurNum =
        Provider.of<PartyCreateProvider>(context, listen: false).peopleNumCur;
    print("Subleadername: " + subLeaderName);
  }

  @override
  Future saveTwo(BuildContext context) async {
    String? dataId = await storage.read(key: "loginId");
    String? dataToken = await storage.read(key: "token");
    String? inputId = await storage.read(key: "partyId");

    final response = await http.put(
      // Uri.parse('http://3.27.196.5/party/join/$inputId/$dataId'),
      Uri.parse('http://127.0.0.1:8000/party/join/$inputId/$dataId'),

      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $dataToken',
      },
    );
    if (response.statusCode == 200) {
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
      return true;
    } else {}
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
    save(context);
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
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
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
                        Expanded(flex: 3, child: Text(inputStatus)),
                        Expanded(
                            flex: 6,
                            child: Container(
                              width: 70, // 동그란 모양의 틀의 지름을 나타내는 값
                              height: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey, // 동그란 모양의 틀의 배경색
                                image: DecorationImage(
                                  image: inputStatus == '택시'
                                      ? AssetImage(
                                          'images/taxi_icon.jpg') // 택시 이미지의 경로
                                      : AssetImage(
                                          'images/car_icon.jpg'), // 카풀 이미지의 경로
                                  // 기본 이미지 경로
                                  fit: BoxFit.cover, // 이미지를 동그란 틀에 맞춰서 보여주도록 설정
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
                              Text(inputdate + ' ' + inputTime)
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
                    flex: 7,
                    child: Text(
                      '파티장',
                      style: TextStyle(fontSize: subInfo),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 14,
                    child: Text(
                      this.subLeaderName,
                      style: TextStyle(fontSize: subInfo),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(),
                  ),
                  // Expanded(
                  //   flex: 14,
                  //   child: Text(
                  //     this.subLeaderPhone,
                  //     style: TextStyle(fontSize: subInfo),
                  //   ),
                  // ),
                  // Expanded(
                  //   flex: 2,
                  //   child: SizedBox(),
                  // ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                primary: false, // <====  disable scrolling. 리스트뷰 내부는 스크롤 안할거임
                shrinkWrap: true,
                // itemCount: inputMemberList.length,
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
                        flex: 7,
                        child: Text(
                          '파티원$dataindex',
                          style: TextStyle(fontSize: subInfo),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 14,
                        child: Text(
                          inputMemberList[index],
                          style: TextStyle(fontSize: subInfo),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: SizedBox(),
                      ),
                      // Expanded(
                      //   flex: 14,
                      //   child: Text(
                      //     this.subMemberPhone1,
                      //     style: TextStyle(fontSize: subInfo),
                      //   ),
                      // ),
                      // Expanded(
                      //   flex: 2,
                      //   child: SizedBox(),
                      // ),
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
                      onPressed: () {
                        // if (await save()) {
                        //   Provider.of<PartyCreateProvider>(context, listen: false)
                        //       .changeAll(
                        //           inputStatus,
                        //           inputdate[0] +
                        //               inputdate[1] +
                        //               inputdate[2] +
                        //               inputdate[3] +
                        //               '.' +
                        //               inputdate[5] +
                        //               inputdate[6] +
                        //               '.' +
                        //               inputdate[8] +
                        //               inputdate[9],
                        //           inputdate[11] +
                        //               inputdate[12] +
                        //               inputdate[13] +
                        //               inputdate[14] +
                        //               inputdate[15],
                        //           inputStart,
                        //           inputEnd,
                        //           inputMaxNum);

                        //   Get.to(() => Homescreen());
                        // }

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
          ),
        ));
  }
}
