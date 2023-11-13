import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomeScreen.dart';
import 'package:flutter_application_1/provider/user_information.dart';
import 'package:provider/provider.dart';
import 'changepw.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Future save(
      String inputUsername,
      String inputId,
      String inputPhoneNumber,
      String inputEmail,
      String inputpassword,
      String inputphoneNumber,
      String inputCarNumber,
      String inputCarColor,
      String inputCarType,
      String inputhomeroom,
      String inputUserType,
      List<String> inputWarning,
      int inputPenalty) async {
    final Map<String, dynamic> userData = {
      'user_name': inputId,
      'real_name': inputUsername,
      'password': inputpassword,
      'phone_number': inputphoneNumber,
      'email': inputEmail,
      'car_number': inputCarNumber, // An integer, not a string
      'car_color': inputCarColor,
      'car_type': inputCarType,
      'homeroom': inputhomeroom,
      'user_type': inputUserType,
      'warning': inputWarning,
      'penalty': inputPenalty,
    };
  }

  @override
  void initState() {
    super.initState();
    // nameController = new TextEditingController(
    //     text: Provider.of<UserInformationProvider>(context).name.toString());
  }

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
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '이름',
                      hintText: '변경할 이름을 입력해주세요'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: idController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '아이디',
                      hintText: '변경할 아이디를 입력해주세요'),
                ),
              ),
              Row(
                children: [
                  // Expanded(
                  //   flex: 1,
                  //   child: SizedBox(),
                  // ),

                  //지금 비밀번호변경 방식을 같은 페이지에서 비밀번호 인증하고 돌아와서 하게 만들기 위해서, index 사용하는 리스트 위젯 사용해야함 추후에
                  Expanded(
                    flex: 50,
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
                              BorderRadius.circular(4), // Add rounded corners

                          border: Border.all(
                              color: Colors.black, width: 1), // Add border
                        ),
                        margin: EdgeInsets.only(left: 8, right: 8),
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
                  // Expanded(
                  //   flex: 1,
                  //   child: SizedBox(),
                  // )
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
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '전화번호',
                      hintText: '변경할 전화번호를 입력해주세요'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: emailController,
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
                        if (nameController.text.isNotEmpty) {
                          Provider.of<UserInformationProvider>(context,
                                  listen: false)
                              .changeName(nameController.text);
                        }
                        if (idController.text.isNotEmpty) {
                          Provider.of<UserInformationProvider>(context,
                                  listen: false)
                              .changeId(idController.text);
                        }
                        if (phoneNumberController.text.isNotEmpty) {
                          Provider.of<UserInformationProvider>(context,
                                  listen: false)
                              .changeName(phoneNumberController.text);
                        }
                        if (emailController.text.isNotEmpty) {
                          Provider.of<UserInformationProvider>(context,
                                  listen: false)
                              .changeName(emailController.text);
                        }
                        print(Provider.of<UserInformationProvider>(context,
                                listen: false)
                            .name);

                        Get.offAll(() => Homescreen());
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
