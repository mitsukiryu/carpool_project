import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';
import 'HomeScreen.dart';
import 'sub_party_list.dart';

class party_list extends StatefulWidget {
  const party_list({super.key});

  @override
  State<party_list> createState() => _party_listState();
}

class _party_listState extends State<party_list> {
  final List<String> genderItems = [
    'Male',
    'Female',
  ];
  double textSize = 15.0;
  double spaceBetweenBox = 1;
  int boxSize = 20;
  int contextFont = 3;
  int contextSpace = 1;

  String? selectedValue;

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
        title: Text('파티 리스트',
            style: TextStyle(
                color: Color.fromARGB(255, 110, 110, 110),
                fontWeight: FontWeight.bold)),
      ),
      body: Column(children: [
        Row(
          children: [
            Expanded(
              child: SizedBox(),
              flex: 1,
            ),
            Expanded(
              flex: boxSize,
              child: Container(
                child: DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    // Add Horizontal padding using menuItemStyleData.padding so it matches
                    // the menu padding when button's width is not specified.
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 16),

                    isDense: true,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    // Add more decoration..
                  ),
                  hint: Text(
                    '날짜임',
                    style: TextStyle(fontSize: textSize),
                  ),
                  items: genderItems
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(
                                fontSize: textSize,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return '원하시는 날짜를 입력해주세요.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    //Do something when selected item is changed.
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 20,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(),
              flex: 1,
            ),
            Expanded(
              flex: boxSize,
              child: Container(
                child: DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    // Add Horizontal padding using menuItemStyleData.padding so it matches
                    // the menu padding when button's width is not specified.
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    // Add more decoration..
                  ),
                  hint: Text(
                    '시간',
                    style: TextStyle(fontSize: textSize),
                  ),
                  items: genderItems
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(
                                fontSize: textSize,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return '원하시는 시간을 선택해주세요';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    //Do something when selected item is changed.
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(),
              flex: 1,
            ),
            Expanded(
              flex: boxSize,
              child: Container(
                child: DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    // Add Horizontal padding using menuItemStyleData.padding so it matches
                    // the menu padding when button's width is not specified.
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    // Add more decoration..
                  ),
                  hint: Text(
                    '목적지',
                    style: TextStyle(fontSize: textSize),
                  ),
                  items: genderItems
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(
                                fontSize: textSize,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return '목적지를 선택해주세요';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    //Do something when selected item is changed.
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 15,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(),
              flex: 1,
            ),
            Expanded(
              flex: boxSize,
              child: Container(
                child: DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    // Add Horizontal padding using menuItemStyleData.padding so it matches
                    // the menu padding when button's width is not specified.
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    // Add more decoration..
                  ),
                  hint: Text(
                    '종류',
                    style: TextStyle(fontSize: textSize),
                  ),
                  items: genderItems
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(
                                fontSize: textSize,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return '원하신는 종류를 선택해주세요';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    //Do something when selected item is changed.
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(),
              flex: 1,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => sub_party_list());
          },
          child: Container(
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
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => sub_party_list());
          },
          child: Container(
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
            decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.black))),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => sub_party_list());
          },
          child: Container(
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
            decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.black))),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => sub_party_list());
          },
          child: Container(
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
            decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.black))),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => sub_party_list());
          },

          // onPressed: () {
          //         Get.offAll(() => Homescreen());
          //       },
          child: Container(
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
            decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.black))),
          ),
        ),
      ]),
    );
  }
}
