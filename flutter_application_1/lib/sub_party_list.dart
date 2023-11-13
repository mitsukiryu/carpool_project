import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomeScreen.dart';
import 'package:get/get.dart';

class sub_party_list extends StatelessWidget {
  final String subLeaderName;
  final String subLeaderPhone;
  final String subMemberName1;
  final String subMemberPhone1;
  final String subMemberName2;
  final String subMemberPhone2;
  final String subMemberName3;
  final String subMemberPhone3;
  final String datetime;
  final String type;
  // final List<dynamic> type;
  final String start;
  final String end;
  final String status;

  sub_party_list(
      this.subLeaderName,
      this.subLeaderPhone,
      this.subMemberName1,
      this.subMemberPhone1,
      this.subMemberName2,
      this.subMemberPhone2,
      this.subMemberName3,
      this.subMemberPhone3,
      this.datetime,
      this.type,
      this.start,
      this.end,
      this.status);

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
              color: Color.fromARGB(255, 222, 222, 222),
              height: 30,
              child: Row(
                children: [
                  Expanded(
                    flex: contextSpace,
                    child: SizedBox(),
                  ),
                  Expanded(flex: contextFont, child: Text('날짜')),
                  Expanded(
                    flex: contextSpace,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: contextSpace,
                    child: SizedBox(),
                  ),
                  Expanded(flex: contextFont, child: Text('종류')),
                  Expanded(
                    flex: contextSpace,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: contextSpace,
                    child: SizedBox(),
                  ),
                  Expanded(flex: contextFont, child: Text('출발')),
                  Expanded(
                    flex: contextSpace,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: contextSpace,
                    child: SizedBox(),
                  ),
                  Expanded(flex: contextFont, child: Text('도착')),
                  Expanded(
                    flex: contextSpace,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: contextSpace,
                    child: SizedBox(),
                  ),
                  Expanded(flex: contextFont, child: Text('현황')),
                ],
              ),
            ),
            SizedBox(
              height: 90,
              child: Row(
                children: [
                  Expanded(
                    flex: contextSpace,
                    child: SizedBox(),
                  ),
                  Expanded(flex: contextFont, child: Text(datetime)),
                  Expanded(
                    flex: contextSpace,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: contextSpace,
                    child: SizedBox(),
                  ),
                  // Expanded(flex: contextFont, child: Text(type)),
                  Expanded(flex: contextFont, child: Text(type)),

                  Expanded(
                    flex: contextSpace,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: contextSpace,
                    child: SizedBox(),
                  ),
                  Expanded(
                      flex: contextFont,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(datetime),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(start),
                          )
                        ],
                      )),
                  Expanded(
                    flex: contextSpace,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: contextSpace,
                    child: SizedBox(),
                  ),
                  Expanded(flex: contextFont, child: Text(end)),
                  Expanded(
                    flex: contextSpace,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: contextSpace,
                    child: SizedBox(),
                  ),
                  Expanded(flex: contextFont, child: Text(status)),
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
