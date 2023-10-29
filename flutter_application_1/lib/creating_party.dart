import "package:flutter/rendering.dart";
import 'package:intl/intl.dart';
import "package:get/get.dart";
import "package:flutter/material.dart";

class creating_party extends StatefulWidget {
  @override
  State<creating_party> createState() => _creating_partyState();
}

class _creating_partyState extends State<creating_party> {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeinput = TextEditingController();

  @override
  void initState() {
    dateController.text = "";
    timeinput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Color taxi_button = const Color.fromARGB(255, 132, 132, 132);
    // Color carpool_button = Color.fromARGB(255, 254, 254, 254);
    String notthingStatement = "";
    String taxiStatement = "택시를 선택하셨습니다";
    String carpoolStatement = "카풀을 선택하셨습니다";
    Color carpoolButtonColor = Colors.grey;
    Color taxiButtonColor = Colors.grey;
    const List<Widget> statusChoice = <Widget>[
      Text('카풀'),
      Text('택시'),
    ];
    final List<bool> _selectedStatus = <bool>[true, false];
    String selected = "none";
    bool vertical = false;
    void _changeColor(String selected) {
      setState(() {
        if (selected == "carpool") {
          carpoolButtonColor = Colors.blue;
          taxiButtonColor = Colors.grey;
        } else if (selected == "taxi") {
          carpoolButtonColor = Colors.grey;
          taxiButtonColor = Colors.blue;
        }
      });
    }

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
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = "first"; // Update the selected variable
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: selected == "first"
                            ? Colors.grey
                            : Colors.transparent,
                        border: Border.all(width: 2, color: Colors.black),
                      ),
                      height: 60,
                      child: Center(
                        child: Text(
                          '택시',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = "second";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: selected == "second"
                              ? Colors.grey
                              : Colors.transparent,
                          border: Border.all(width: 2, color: Colors.black)),
                      height: 60,
                      child: Center(
                          child: Text('카풀',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 20))),
                    ),
                  ),
                ),
              ],
            ),
            // GestureDetector(
            //   onTap: () {
            //     setState(() {
            //       selected = 'first';
            //     });
            //   },
            //   child: Container(
            //     height: 200,
            //     width: 200,
            //     color: selected == 'first' ? Colors.blue : Colors.transparent,
            //     child: Text("First"),
            //   ),
            // ),

            // Expanded(
            //   flex: 1,
            //   child: GestureDetector(
            //     child: Container(
            //       decoration: BoxDecoration(
            //           color: selected == "thrid"
            //               ? Colors.black
            //               : Colors.amberAccent),
            //     ),
            //     onTap: () {
            //       setState(() {
            //         selected = "thrid";
            //       });
            //     },
            //   ),
            // ),

            // GestureDetector(
            //   child: Expanded(
            //     flex: 1,
            //     child: Container(
            //       decoration: BoxDecoration(
            //           color: selected == "thrid"
            //               ? Colors.black
            //               : Colors.amberAccent),
            //     ),
            //   ),
            //   onTap: () {
            //     setState(() {
            //       selected = "thrid";
            //     });
            //   },
            // ),
            // Container(
            //   // color: const Color.fromARGB(255, 212, 212, 212),
            //   decoration: BoxDecoration(
            //       color: Colors.grey,
            //       border: Border.all(width: 2, color: Colors.black)),
            //   height: 60,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       Expanded(
            //           child: TextButton(
            //               child: Text('택시',
            //                   style:
            //                       TextStyle(color: Colors.black, fontSize: 20)),
            //               onPressed: () {})),
            //       VerticalDivider(
            //         color: const Color.fromARGB(255, 0, 0, 0),
            //         thickness: 3,
            //       ),
            //       Expanded(
            //           child: TextButton(
            //               child: Text('카풀',
            //                   style:
            //                       TextStyle(color: Colors.black, fontSize: 20)),
            //               onPressed: () {}))
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 20,
            ),

            ToggleButtons(
              // direction: vertical ? Axis.vertical : Axis.horizontal,
              onPressed: (int newIndex) {
                print(newIndex);
                setState(() {
                  // The button that is tapped is set to true, and the others to false.
                  for (int index = 0; index < _selectedStatus.length; index++) {
                    if (index == newIndex) {
                      // toggling between the button to set it to true
                      _selectedStatus[index] = !_selectedStatus[index];
                    } else {
                      // other two buttons will not be selected and are set to false
                      _selectedStatus[index] = false;
                    }
                  }
                });
              },
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              selectedBorderColor: Colors.red[700],
              selectedColor: Colors.white,
              fillColor: Colors.red[200],
              color: Colors.red[400],
              constraints: const BoxConstraints(
                minHeight: 40.0,
                minWidth: 80.0,
              ),
              isSelected: _selectedStatus,
              children: statusChoice,
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
                          readOnly: false, // Allow user input
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
                          // Get.offAll(() => Homescreen());
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
