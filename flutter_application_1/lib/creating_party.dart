import 'package:flutter_application_1/HomeScreen.dart';
import 'package:flutter_application_1/provider/party_create_provider.dart';
import 'package:intl/intl.dart';
import "package:get/get.dart";
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class creating_party extends StatefulWidget {
  @override
  State<creating_party> createState() => _creating_partyState();
}

class _creating_partyState extends State<creating_party> {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  TextEditingController startinput = TextEditingController();
  TextEditingController endinput = TextEditingController();
  TextEditingController numinput = TextEditingController();
  String choice = "";
  @override
  void initState() {
    dateController.text = "";
    timeinput.text = "";
    super.initState();
  }

  @override
  bool checking() {
    if (choice != "" &&
        dateController.text.isNotEmpty &&
        timeinput.text.isNotEmpty &&
        startinput.text.isNotEmpty &&
        endinput.text.isNotEmpty &&
        numinput.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // Color taxi_button = const Color.fromARGB(255, 132, 132, 132);
    // Color carpool_button = Color.fromARGB(255, 254, 254, 254);

    final List<bool> _selectedStatus = <bool>[true, false];
    String selected = "none";
    bool vertical = false;

    return Scaffold(
      resizeToAvoidBottomInset: true,
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
        title: Text('파티 생성',
            style: TextStyle(
                color: Color.fromARGB(255, 110, 110, 110),
                fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ToggleSwitch(
              minWidth: 100.0,
              // cornerRadius: -10,
              initialLabelIndex: 3, radiusStyle: vertical,
              // cornerRadius: 20.0,
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              totalSwitches: 2,
              labels: ['택시', '카풀'],
              activeBgColors: [
                [Colors.blue],
                [Colors.blue]
              ],
              onToggle: (index) {
                print('switched to: $index');
                if (index == 0) {
                  choice = "택시";
                } else if (index == 1) {
                  choice = "카풀";
                }
                print(choice);
              },
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(
                        '날짜:',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: dateController,
                          decoration: InputDecoration(
                            icon: Icon(Icons.calendar_today),
                            // labelText: "날짜를 입력하세요",
                            border: OutlineInputBorder(),
                          ),

                          readOnly: true, // when true user cannot edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(), //get today's date
                                firstDate: DateTime(
                                    2000), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2101));

                            if (pickedDate != null) {
                              print(
                                  pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                              String formattedDate = DateFormat('yyyy-MM-dd')
                                  .format(
                                      pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                              print(
                                  formattedDate); //formatted date output using intl package =>  2022-07-04
                              //You can format date as per your need

                              setState(() {
                                dateController.text =
                                    formattedDate; //set foratted date to TextField value.
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(
                        '시간:',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: timeinput,

                          decoration: InputDecoration(
                            icon: Icon(Icons.access_time),
                            border: OutlineInputBorder(),
                          ),
                          readOnly: true, // Allow user input
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );

                            if (pickedTime != null) {
                              print(pickedTime
                                  .format(context)); // Output formatted time

                              // Format the pickedTime to your desired pattern
                              String formattedTime = pickedTime.format(context);

                              setState(() {
                                timeinput.text =
                                    formattedTime; // Set the value of the text field
                              });
                            } else {
                              print("Time is not selected");
                            }
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(
                        '출발지:',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                            controller: startinput,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            )),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(
                        '목적지:',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                            controller: endinput,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            )),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(
                        '모집인원:',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                            controller: numinput,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            )),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
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
                          ),
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
                          print(choice +
                              dateController.text +
                              timeinput.text +
                              startinput.text +
                              endinput.text +
                              numinput.text);

                          if (checking()) {
                            Provider.of<PartyCreateProvider>(context,
                                    listen: false)
                                .changeAll(
                                    choice,
                                    dateController.text,
                                    timeinput.text,
                                    startinput.text,
                                    endinput.text,
                                    int.parse(numinput.text));

                            Get.offAll(() => Homescreen());
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('입력 오류'),
                                content: const Text('모든 필드를 입력해주세요.'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        child: Text(
                          '완료',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(flex: 1, child: SizedBox()),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}