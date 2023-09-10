import 'package:flutter_application_1/EditProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/user_information.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MyInfo extends StatefulWidget {
  const MyInfo({super.key});

  @override
  State<MyInfo> createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor:
                  Colors.grey, // Choose a background color for the circle
            ),
            SizedBox(height: 16),
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
                  Get.to(() => EditProflie());
                },
                child: Text('내 정보 수정'),
              ),
            ),
            SizedBox(height: 8),
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
