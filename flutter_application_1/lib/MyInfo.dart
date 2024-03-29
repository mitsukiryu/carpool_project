import 'dart:ui';

import 'package:flutter_application_1/EditProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login%20&%20signin/login_page.dart';
import 'package:flutter_application_1/provider/party_create_provider.dart';
import 'package:flutter_application_1/provider/user_information.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MyInfo extends StatefulWidget {
  const MyInfo({super.key});

  @override
  State<MyInfo> createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''), // You can add title here
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
            size: 30,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white, //You can make this transparent
        elevation: 0.0, //No shadow
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // CircleAvatar(
              //   radius: 60,
              //   backgroundColor:
              //       Colors.grey, // Choose a background color for the circle
              // ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 150,
                child: Text(
                  "SAFE RIDE는 안전하고 편리한 학부모 차량 자동 매칭 서비스를 제공합니다. \n이를 통해 한동글로벌학교의 한정적인 등하교 수단 문제, \n등하교 시 교통 혼잡문제, 안전 사고 문제에 대안을 제시하고자 합니다. \n한동글로벌학교에서 시범 운영 후 대한민국 전 학교의 \n등하교 문제를 해결하고자 합니다. ",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
              // SizedBox(
              //   height: 30,
              // ),
              Container(
                width: 100, // 동그란 모양의 틀의 지름을 나타내는 값
                height: 110,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey, // 동그란 모양의 틀의 배경색
                  image: DecorationImage(
                    image: Provider.of<UserInformationProvider>(context,
                                    listen: false)
                                .status ==
                            'Passenger'
                        ? AssetImage('images/passenger.jpg') // 택시 이미지의 경로
                        : AssetImage('images/driver.jpg'), // 카풀 이미지의 경로
                    // 기본 이미지 경로
                    fit: BoxFit.scaleDown, // 이미지를 동그란 틀에 맞춰서 보여주도록 설정
                  ),
                ),
              ),
              Text(
                Provider.of<UserInformationProvider>(context).name.toString(),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                Provider.of<UserInformationProvider>(context)
                    .phoneNumber
                    .toString(),
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                Provider.of<UserInformationProvider>(context).email.toString(),
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),

                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        // title: const Text('입력 오류'),
                        content: Text("추후 계발될 예정입니다"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                    // Get.to(() => EditProfile());
                  },
                  // print(Provider.of<UserInformationProvider>(context).name.);
                  child: Text('내 정보 수정'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  onPressed: () async {
                    await storage.delete(key: "token");
                    await storage.delete(key: "loginId");
                    await storage.delete(key: "loginPw");
                    Provider.of<PartyCreateProvider>(context, listen: false)
                        .resetAll();
                    String? datadata = await storage.read(key: "loginId");
                    print("삭제됬나 체크" + datadata.toString());
                    Get.offAll(() => LoginPage());
                  },
                  // print(Provider.of<UserInformationProvider>(context).name.);
                  child: Text('로그아웃'),
                ),
              ),
              SizedBox(height: 50),

              // SizedBox(
              //   width: 200,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              //     onPressed: () {
              //       // Action for "푸시알림 설정" button
              //     },
              //     child: Text('푸시알림 설정'),
              //   ),
              // ),
              // SizedBox(
              //   width: 200,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(primary: Colors.grey),
              //     onPressed: () {
              //       // Action for "푸시알림 설정" button
              //     },
              //     child: Text('현제 참여중인 파티'),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   color: const Color.fromARGB(255, 212, 212, 212),
      //   height: 60,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Expanded(
      //           child: TextButton(
      //               child: Text('파티 리스트',
      //                   style: TextStyle(color: Colors.black, fontSize: 20)),
      //               onPressed: () {
      //                 Get.to(PartyList());
      //               })),
      //       VerticalDivider(
      //         color: Colors.white,
      //         thickness: 3,
      //       ),
      //       Expanded(
      //           child: TextButton(
      //               child: Text('내 정보',
      //                   style: TextStyle(color: Colors.black, fontSize: 20)),
      //               onPressed: () {
      //                 Get.to(MyInfo());
      //               }))
      //     ],
      //   ),
      // ),
    );
  }
}
