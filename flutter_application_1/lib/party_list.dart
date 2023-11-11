import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
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
        SizedBox(
          height: 10,
        ),
        Container(
          color: Color.fromARGB(255, 222, 222, 222),
          height: 30,
          child: Row(
            children: [
              Expanded(
                flex: contextSpace,
                child: SizedBox(),
              ),
              Expanded(flex: contextFont, child: Text('날짜')),
              Expanded(
                flex: contextSpace,
                child: SizedBox(),
              ),
              Expanded(
                flex: contextSpace,
                child: SizedBox(),
              ),
              Expanded(flex: contextFont, child: Text('종류')),
              Expanded(
                flex: contextSpace,
                child: SizedBox(),
              ),
              Expanded(
                flex: contextSpace,
                child: SizedBox(),
              ),
              Expanded(flex: contextFont, child: Text('출발')),
              Expanded(
                flex: contextSpace,
                child: SizedBox(),
              ),
              Expanded(
                flex: contextSpace,
                child: SizedBox(),
              ),
              Expanded(flex: contextFont, child: Text('도착')),
              Expanded(
                flex: contextSpace,
                child: SizedBox(),
              ),
              Expanded(
                flex: contextSpace,
                child: SizedBox(),
              ),
              Expanded(flex: contextFont, child: Text('현황')),
            ],
          ),
        ),
        // FutureBuilder(
        //   future: Future,
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       return ListView.builder();
        //     }

        //     if (snapshot.hasError) return Text("error");
        //     return CircularProgressIndicator();
        //   },
        // ),
        GestureDetector(
          onTap: () {
            Get.to(() => sub_party_list());
          },
          child: Container(
            height: 90,
            decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.black))),
            child: Row(
              children: [
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(flex: contextFont, child: Text('날짜')),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(flex: contextFont, child: Text('종류')),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(
                    flex: contextFont,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text('시간'),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text('출발'),
                        )
                      ],
                    )),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(flex: contextFont, child: Text('도착')),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(flex: contextFont, child: Text('현황')),
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
            decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.black))),
            child: Row(
              children: [
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(flex: contextFont, child: Text('날짜')),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(flex: contextFont, child: Text('종류')),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(
                    flex: contextFont,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text('시간'),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text('출발'),
                        )
                      ],
                    )),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(flex: contextFont, child: Text('도착')),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(flex: contextFont, child: Text('현황')),
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
            decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.black))),
            child: Row(
              children: [
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(flex: contextFont, child: Text('날짜')),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(flex: contextFont, child: Text('종류')),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(
                    flex: contextFont,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text('시간'),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text('출발'),
                        )
                      ],
                    )),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(flex: contextFont, child: Text('도착')),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(flex: contextFont, child: Text('현황')),
              ],
            ),
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
            decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.black))),
            child: Row(
              children: [
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(flex: contextFont, child: Text('날짜')),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(flex: contextFont, child: Text('종류')),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(
                    flex: contextFont,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text('시간'),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text('출발'),
                        )
                      ],
                    )),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(flex: contextFont, child: Text('도착')),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: contextSpace,
                  child: SizedBox(),
                ),
                Expanded(flex: contextFont, child: Text('현황')),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
