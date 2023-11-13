import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomeScreen.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class sub_party_list extends StatelessWidget {
  final String subLeaderName;
  final String subLeaderPhone;
  final String subMemberName1;
  final String subMemberPhone1;
  final String subMemberName2;
  final String subMemberPhone2;
  final String subMemberName3;
  final String subMemberPhone3;
  final String inputId;
  final String inputdate;
  final String inputType;
  // final List<dynamic> type;
  final String inputStart;
  final String inputEnd;
  final String inputStatus;
  static final storage = FlutterSecureStorage();

  sub_party_list(
      this.subLeaderName,
      this.subLeaderPhone,
      this.subMemberName1,
      this.subMemberPhone1,
      this.subMemberName2,
      this.subMemberPhone2,
      this.subMemberName3,
      this.subMemberPhone3,
      this.inputId,
      this.inputdate,
      this.inputType,
      this.inputStart,
      this.inputEnd,
      this.inputStatus);

  @override
  Future save() async {
    String? dataId = await storage.read(key: "loginId");
    String? dataToken = await storage.read(key: "token");

    final response = await http.put(
      Uri.parse('http://127.0.0.1:8000/party/join/$inputId/$dataId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $dataToken',
      },
    );
  }

  @override
  int contextFont = 3;
  int contextSpace = 1;
  double subInfo = 22;
  // String subLeaderName = "김강희";
  // String subLeaderPhone = "010-5555-5555";
  // String subMemberName1 = "류황희";
  // String subMemberPhone1 = "010-6666-6666";
  // String subMemberName2 = "박경태";
  // String subMemberPhone2 = "010-7777-7777";
  // String subMemberName3 = "안현빈";
  // String subMemberPhone3 = "010-8888-8888";

  @override
  Widget build(BuildContext context) {
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
                  flex: 7,
                  child: Text(
                    this.subLeaderName,
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
                    this.subLeaderPhone,
                    style: TextStyle(fontSize: subInfo),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
              ],
            ),
            SizedBox(
              height: 10,
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
                    '파티원1',
                    style: TextStyle(fontSize: subInfo),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 7,
                  child: Text(
                    this.subMemberName1,
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
                    this.subMemberPhone1,
                    style: TextStyle(fontSize: subInfo),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
              ],
            ),
            SizedBox(
              height: 10,
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
                    '파티원2',
                    style: TextStyle(fontSize: subInfo),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 7,
                  child: Text(
                    this.subMemberName2,
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
                    this.subMemberPhone2,
                    style: TextStyle(fontSize: subInfo),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
              ],
            ),
            SizedBox(
              height: 10,
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
                    '파티원3',
                    style: TextStyle(fontSize: subInfo),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 7,
                  child: Text(
                    this.subMemberName3,
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
                    this.subMemberPhone3,
                    style: TextStyle(fontSize: subInfo),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
              ],
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
                      save();
                      Get.to(() => Homescreen());
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
}
