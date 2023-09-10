import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomeScreen.dart';
import 'package:flutter_application_1/provider/user_information.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _confirmFormKey = GlobalKey<FormState>();

  TextEditingController textEditingController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isMatching = false;
  bool isPasswordConfirmed = false;
  String errorMessage = "";
  bool okChangePw = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '현재 비밀번호 입력',
                    errorText: errorMessage.isNotEmpty ? errorMessage : null,
                  ),
                  validator: (value) {
                    if (value !=
                        Provider.of<UserInformationProvider>(context,
                                listen: false)
                            .pw
                            .toString()) {
                      return "잘못된 비밀번호를 입력하셨습니다";
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    isMatching = true;
                    errorMessage = '';
                  });
                }
              },
              child: Text('확인'),
            ),
            if (isMatching) ...[
              SizedBox(height: 20),
              Form(
                key: _confirmFormKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: newPasswordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '새로운 비밀번호 입력',
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '비밀번호 확인',
                          errorText:
                              isPasswordConfirmed ? '비밀번호가 일치하지 않습니다.' : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_confirmFormKey.currentState!.validate()) {
                    // Check if new password and confirm password match
                    if (newPasswordController.text ==
                        confirmPasswordController.text) {
                      okChangePw = true;
                      print(confirmPasswordController.text);
                      setState(() {
                        isPasswordConfirmed = false; // Reset error
                        okChangePw = true;
                        print('changed');
                      });
                      // Handle the logic when passwords match
                    } else {
                      setState(() {
                        isPasswordConfirmed = true; // Display error
                      });
                    }
                  }
                },
                child: Text('확인'),
              ),
            ],
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        '취소',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 4,

                  // behavior: HitTestBehavior.opaque,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: TextButton(
                      onPressed: () {
                        print("Clicked");
                        print(okChangePw);
                        if (okChangePw) {
                          Provider.of<UserInformationProvider>(context,
                                  listen: false)
                              .changePw(confirmPasswordController.text);
                          print("Confirmed");
                        }
                        ;
                        print(okChangePw);
                        Get.to(() => Homescreen());
                      },
                      child: Text(
                        '변경',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
