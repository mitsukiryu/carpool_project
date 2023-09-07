import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'finding_id.dart';
import 'finding_pw.dart';

class Choosing_finding_id_pw extends StatelessWidget {
  const Choosing_finding_id_pw({super.key});

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => finding_id());
                },
                child: Column(children: [
                  Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        // color: Colors.blue,
                        border: Border.all(color: Colors.grey, width: 5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.person_2_outlined,
                        size: 70,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '아이디 찾기',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ]),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => finding_pw());
                },
                child: Column(
                  children: [
                    Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.lock_outline,
                          size: 65,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '비밀번호 찾기',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
