import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomeScreen.dart';
import 'package:get/get.dart';

class sub_party_list extends StatelessWidget {
  sub_party_list({super.key});

  @override
  int contextFont = 3;
  int contextSpace = 1;
  double subInfo = 22;
  String subLeaderName = "김강희";
  String subLeaderPhone = "010-5555-5555";
  String subMemberName1 = "류황희";
  String subMemberPhone1 = "010-6666-6666";
  String subMemberName2 = "박경태";
  String subMemberPhone2 = "010-7777-7777";
  String subMemberName3 = "안현빈";
  String subMemberPhone3 = "010-8888-8888";

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
                    child: SizedBox(),
                    flex: contextSpace,
                  ),
                  Expanded(child: Text('날짜'), flex: contextFont),
                  Expanded(
                    child: SizedBox(),
                    flex: contextSpace,
                  ),
                  Expanded(
                    child: SizedBox(),
                    flex: contextSpace,
                  ),
                  Expanded(child: Text('종류'), flex: contextFont),
                  Expanded(
                    child: SizedBox(),
                    flex: contextSpace,
                  ),
                  Expanded(
                    child: SizedBox(),
                    flex: contextSpace,
                  ),
                  Expanded(child: Text('출발'), flex: contextFont),
                  Expanded(
                    child: SizedBox(),
                    flex: contextSpace,
                  ),
                  Expanded(
                    child: SizedBox(),
                    flex: contextSpace,
                  ),
                  Expanded(child: Text('도착'), flex: contextFont),
                  Expanded(
                    child: SizedBox(),
                    flex: contextSpace,
                  ),
                  Expanded(
                    child: SizedBox(),
                    flex: contextSpace,
                  ),
                  Expanded(child: Text('현황'), flex: contextFont),
                ],
              ),
            ),
            Container(
              height: 90,
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(),
                    flex: contextSpace,
                  ),
                  Expanded(child: Text('날짜'), flex: contextFont),
                  Expanded(
                    child: SizedBox(),
                    flex: contextSpace,
                  ),
                  Expanded(
                    child: SizedBox(),
                    flex: contextSpace,
                  ),
                  Expanded(child: Text('종류'), flex: contextFont),
                  Expanded(
                    child: SizedBox(),
                    flex: contextSpace,
                  ),
                  Expanded(
                    child: SizedBox(),
                    flex: contextSpace,
                  ),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SizedBox(),
                            flex: 1,
                          ),
                          Expanded(
                            child: Text('시간'),
                            flex: 2,
                          ),
                          Expanded(
                            child: Text('출발'),
                            flex: 2,
                          )
                        ],
                      ),
                      flex: contextFont),
                  Expanded(
                    child: SizedBox(),
                    flex: contextSpace,
                  ),
                  Expanded(
                    child: SizedBox(),
                    flex: contextSpace,
                  ),
                  Expanded(child: Text('도착'), flex: contextFont),
                  Expanded(
                    child: SizedBox(),
                    flex: contextSpace,
                  ),
                  Expanded(
                    child: SizedBox(),
                    flex: contextSpace,
                  ),
                  Expanded(child: Text('현황'), flex: contextFont),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(),
                  flex: 2,
                ),
                Expanded(
                  child: Text(
                    '파티장',
                    style: TextStyle(fontSize: subInfo),
                  ),
                  flex: 7,
                ),
                Expanded(
                  child: SizedBox(),
                  flex: 2,
                ),
                Expanded(
                  child: Text(
                    subLeaderName,
                    style: TextStyle(fontSize: subInfo),
                  ),
                  flex: 7,
                ),
                Expanded(
                  child: SizedBox(),
                  flex: 2,
                ),
                Expanded(
                  child: Text(
                    subLeaderPhone,
                    style: TextStyle(fontSize: subInfo),
                  ),
                  flex: 14,
                ),
                Expanded(
                  child: SizedBox(),
                  flex: 2,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(),
                  flex: 2,
                ),
                Expanded(
                  child: Text(
                    '파티원1',
                    style: TextStyle(fontSize: subInfo),
                  ),
                  flex: 7,
                ),
                Expanded(
                  child: SizedBox(),
                  flex: 2,
                ),
                Expanded(
                  child: Text(
                    subMemberName1,
                    style: TextStyle(fontSize: subInfo),
                  ),
                  flex: 7,
                ),
                Expanded(
                  child: SizedBox(),
                  flex: 2,
                ),
                Expanded(
                  child: Text(
                    subMemberPhone1,
                    style: TextStyle(fontSize: subInfo),
                  ),
                  flex: 14,
                ),
                Expanded(
                  child: SizedBox(),
                  flex: 2,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(),
                  flex: 2,
                ),
                Expanded(
                  child: Text(
                    '파티원2',
                    style: TextStyle(fontSize: subInfo),
                  ),
                  flex: 7,
                ),
                Expanded(
                  child: SizedBox(),
                  flex: 2,
                ),
                Expanded(
                  child: Text(
                    subMemberName2,
                    style: TextStyle(fontSize: subInfo),
                  ),
                  flex: 7,
                ),
                Expanded(
                  child: SizedBox(),
                  flex: 2,
                ),
                Expanded(
                  child: Text(
                    subMemberPhone2,
                    style: TextStyle(fontSize: subInfo),
                  ),
                  flex: 14,
                ),
                Expanded(
                  child: SizedBox(),
                  flex: 2,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(),
                  flex: 2,
                ),
                Expanded(
                  child: Text(
                    '파티원3',
                    style: TextStyle(fontSize: subInfo),
                  ),
                  flex: 7,
                ),
                Expanded(
                  child: SizedBox(),
                  flex: 2,
                ),
                Expanded(
                  child: Text(
                    subMemberName3,
                    style: TextStyle(fontSize: subInfo),
                  ),
                  flex: 7,
                ),
                Expanded(
                  child: SizedBox(),
                  flex: 2,
                ),
                Expanded(
                  child: Text(
                    subMemberPhone3,
                    style: TextStyle(fontSize: subInfo),
                  ),
                  flex: 14,
                ),
                Expanded(
                  child: SizedBox(),
                  flex: 2,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(children: [
              Expanded(child: SizedBox(), flex: 2),
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
              Expanded(child: SizedBox(), flex: 2),
            ]),
          ],
        ));
  }
}
