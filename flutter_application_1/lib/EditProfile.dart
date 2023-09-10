import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'changepw.dart';

class EditProflie extends StatelessWidget {
  const EditProflie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Center(
                child: Text(
                  '내 정보 수정',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              //패딩에서 안에 변수로 묶에서 사용자 마다 처음에 보이는게 다르게 예를들어 "박경태" 이런식으로 보일수 있게 해야함
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '이름',
                      hintText: '변경할 이름을 입력해주세요'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '아이디',
                      hintText: '변경할 아이디를 입력해주세요'),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 35,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => ChangePasswordPage());
                      },
                      child: Container(
                        height: 65, // Adjust the height as needed
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 206, 206,
                              206), // Set the desired background color
                          borderRadius:
                              BorderRadius.circular(8), // Add rounded corners
                          border: Border.all(
                              color: Colors.black, width: 2), // Add border
                        ),
                        padding: EdgeInsets.all(
                            10), // Add padding to center the content
                        child: Text(
                          '비밀번호 변경하시려면 클릭해주세요', // Replace with your button text
                          style: TextStyle(
                            fontSize: 16, // Adjust the font size as needed
                            color: Colors.black, // Set the text color
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  )
                ],
              ),

              // Padding(
              //   padding: EdgeInsets.all(10),
              //   child: TextField(
              //     decoration: InputDecoration(
              //         border: OutlineInputBorder(),
              //         labelText: '변경할 비밀번호 입력',
              //         hintText: '변경할 비밀번호를 입력해주세요'),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '전화번호',
                      hintText: '변경할 전화번호를 입력해주세요'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '이메일',
                      hintText: '변경할 이메일을 입력해주세요'),
                ),
              ),

              SizedBox(
                height: 15,
              ),
              Row(children: [
                Expanded(flex: 1, child: SizedBox()),
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
                        Get.back();
                      },
                      child: Text(
                        '취소',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(flex: 1, child: SizedBox()),
                Expanded(
                  flex: 4,
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      // borderRadius: BorderRadius.circular(20)),
                    ),
                    child: TextButton(
                      onPressed: () {
                        // Get.offAll(() => Homescreen());
                      },
                      child: Text(
                        '완료',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(flex: 1, child: SizedBox()),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
