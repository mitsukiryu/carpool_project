import 'package:flutter/material.dart';
import 'package:get/get.dart';

class finding_id extends StatelessWidget {
  const finding_id({super.key});

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
        title: Text('',
            style: TextStyle(
                color: Color.fromARGB(255, 110, 110, 110),
                fontWeight: FontWeight.bold)),
      ),
      body: Column(children: [
        SizedBox(
          height: 20,
        ),
        Text('가입시 입력하신 이메일을 입력해주세요', style: TextStyle(fontSize: 17)),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '이메일',
                hintText: '이메일을 입력해주세요'),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text('가입시 입력하신 이름을 입력해주세요', style: TextStyle(fontSize: 17)),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '이름',
                hintText: '이름을 입력해주세요'),
          ),
        ),
        SizedBox(
          height: 20,
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
                  // Get.back();
                },
                child: Text(
                  '아이디 찾기',
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
      ]),
    );
  }
}
