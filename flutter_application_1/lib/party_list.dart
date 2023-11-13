import 'dart:async';
import 'dart:convert';
import 'package:flutter_application_1/widget/card_partylist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/class/party.dart';
import 'package:get/get.dart';
import 'sub_party_list.dart';
import 'package:http/http.dart' as http;

class name extends StatefulWidget {
  const name({super.key});

  @override
  State<name> createState() => _nameState();
}

class _nameState extends State<name> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

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
  Future<List<Party>> getData() async {
    final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/party/find'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded'
        // 'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      // Here i declare the jsonDecode typ as List<dynamic> to give it the right type
      final jsonData =
          jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
      // final jsonData = jsonDecode(response.body) as List<dynamic>;

      // Here i cast the List<dynamic> jsonData to List<Map<String,dynamic>>
      final castedData = List<Map<String, dynamic>>.from(jsonData);
      // Here i convert the castedData to the a List<Party> model
      final parties = castedData.map(Party.fromJson).toList();
      print(parties);
      return parties;
    } else {
      print("bad");
      return <Party>[];
    }
  }

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
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(children: <Widget>[
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
          // FutureBuilder<List<Party>>(
          //   future: getData(),
          //   builder: (context, snapshot) {
          //     if (snapshot.data == null) {
          //       print(snapshot);
          //       return CircularProgressIndicator();
          //     } else {
          //       return ListView.builder(
          //         primary: false,
          //         shrinkWrap: true,
          //         itemCount: snapshot.data?.length ?? 0,
          //         itemBuilder: (context, index) =>
          //             // final party = snapshot.data![index];
          //             Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: card_partylist(
          //               snapshot.data![index].date_time,
          //               snapshot.data![index].party_type,
          //               snapshot.data![index].date_time,
          //               snapshot.data![index].departure,
          //               snapshot.data![index].destination,
          //               '&snapshot.data![index].cur_recruitment/&snapshot.data![index].max_recruitment'),
          //         ),
          //       );
          //     }
          //   },
          // ),
          FutureBuilder<List<Party>>(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                final data = snapshot.data!;
                return ListView.builder(
                  primary: false, // <====  disable scrolling. 리스트뷰 내부는 스크롤 안할거임
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) =>
                      card_partylist(
                    data[index].date_time,
                    data[index].party_type,
                    // data[index].party_member_id,
                    data[index].departure,
                    data[index].destination,
                    data[index].cur_recruitment.toString() +
                        '/' +
                        data[index].max_recruitment.toString(),
                    'user',
                    'phone',
                    'user',
                    'phone',
                    'user',
                    'phone',
                    'user',
                    'phone',
                  ),
                );
              } else if (snapshot.hasError) {
                return const Center(child: Icon(Icons.error_outline));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          // FutureBuilder<List<Party>>(
          //   future: getData(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData && snapshot.data != null) {
          //       final data = snapshot.data!;
          //       return ListView.builder(
          //         itemCount: data.length,
          //         itemBuilder: (BuildContext context, int index) {
          //           final party = data[index];
          //           return Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: card_partylist(
          //                 party.date_time,
          //                 party.party_type,
          //                 party.date_time,
          //                 party.departure,
          //                 party.destination,
          //                 '&snapshot.data[index].cur_recruitment/&snapshot.data[index].max_recruitment'),
          //           );
          //         },
          //       );
          //     } else if (snapshot.hasError) {
          //       print("Error: ${snapshot.error}");
          //       return const Center(child: Icon(Icons.error_outline));
          //     } else {
          //       return const Center(child: CircularProgressIndicator());
          //     }
          //   },
          // ),
          // ListView.builder(
          //     primary: false, // <====  disable scrolling. 리스트뷰 내부는 스크롤 안할거임
          //     shrinkWrap: true,
          //     itemCount: 10,
          //     itemBuilder: (context, index) => card_partylist(
          //         'string', 'string', 'string', 'string', 'string', 'string')),

          // card_partylist('hello', 'hello', 'hello', 'hello', 'hello', 'hello'),
          // GestureDetector(
          //   onTap: () {
          //     Get.to(() => sub_party_list(
          //           '박경태',
          //           '010-6300-2734',
          //           '박경태',
          //           '010-6300-2734',
          //           '박경태',
          //           '010-6300-2734',
          //           '박경태',
          //           '010-6300-2734',
          //         ));
          //   },
          //   child: Container(
          //     height: 90,
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         border: Border(
          //             bottom: BorderSide(width: 1, color: Colors.black))),
          //     child: Row(
          //       children: [
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(flex: contextFont, child: Text('날짜')),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(flex: contextFont, child: Text('종류')),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(
          //             flex: contextFont,
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: const [
          //                 Expanded(
          //                   flex: 1,
          //                   child: SizedBox(),
          //                 ),
          //                 Expanded(
          //                   flex: 2,
          //                   child: Text('시간'),
          //                 ),
          //                 Expanded(
          //                   flex: 2,
          //                   child: Text('출발'),
          //                 )
          //               ],
          //             )),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(flex: contextFont, child: Text('도착')),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(flex: contextFont, child: Text('현황')),
          //       ],
          //     ),
          //   ),
          // ),
          // GestureDetector(
          //   onTap: () {
          //     Get.to(() => sub_party_list(
          //           '박경태',
          //           '010-6300-2734',
          //           '박경태',
          //           '010-6300-2734',
          //           '박경태',
          //           '010-6300-2734',
          //           '박경태',
          //           '010-6300-2734',
          //         ));
          //   },
          //   child: Container(
          //     height: 90,
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         border: Border(
          //             bottom: BorderSide(width: 1, color: Colors.black))),
          //     child: Row(
          //       children: [
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(flex: contextFont, child: Text('날짜')),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(flex: contextFont, child: Text('종류')),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(
          //             flex: contextFont,
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: const [
          //                 Expanded(
          //                   flex: 1,
          //                   child: SizedBox(),
          //                 ),
          //                 Expanded(
          //                   flex: 2,
          //                   child: Text('시간'),
          //                 ),
          //                 Expanded(
          //                   flex: 2,
          //                   child: Text('출발'),
          //                 )
          //               ],
          //             )),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(flex: contextFont, child: Text('도착')),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(flex: contextFont, child: Text('현황')),
          //       ],
          //     ),
          //   ),
          // ),
          // GestureDetector(
          //   onTap: () {
          //     Get.to(() => sub_party_list(
          //           '박경태',
          //           '010-6300-2734',
          //           '박경태',
          //           '010-6300-2734',
          //           '박경태',
          //           '010-6300-2734',
          //           '박경태',
          //           '010-6300-2734',
          //         ));
          //   },
          //   child: Container(
          //     height: 90,
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         border: Border(
          //             bottom: BorderSide(width: 1, color: Colors.black))),
          //     child: Row(
          //       children: [
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(flex: contextFont, child: Text('날짜')),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(flex: contextFont, child: Text('종류')),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(
          //             flex: contextFont,
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: const [
          //                 Expanded(
          //                   flex: 1,
          //                   child: SizedBox(),
          //                 ),
          //                 Expanded(
          //                   flex: 2,
          //                   child: Text('시간'),
          //                 ),
          //                 Expanded(
          //                   flex: 2,
          //                   child: Text('출발'),
          //                 )
          //               ],
          //             )),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(flex: contextFont, child: Text('도착')),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(flex: contextFont, child: Text('현황')),
          //       ],
          //     ),
          //   ),
          // ),
          // GestureDetector(
          //   onTap: () {
          //     Get.to(() => sub_party_list(
          //           '박경태',
          //           '010-6300-2734',
          //           '박경태',
          //           '010-6300-2734',
          //           '박경태',
          //           '010-6300-2734',
          //           '박경태',
          //           '010-6300-2734',
          //         ));
          //   },

          //   // onPressed: () {
          //   //         Get.offAll(() => Homescreen());
          //   //       },
          //   child: Container(
          //     height: 90,
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         border: Border(
          //             bottom: BorderSide(width: 1, color: Colors.black))),
          //     child: Row(
          //       children: [
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(flex: contextFont, child: Text('날짜')),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(flex: contextFont, child: Text('종류')),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(
          //             flex: contextFont,
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: const [
          //                 Expanded(
          //                   flex: 1,
          //                   child: SizedBox(),
          //                 ),
          //                 Expanded(
          //                   flex: 2,
          //                   child: Text('시간'),
          //                 ),
          //                 Expanded(
          //                   flex: 2,
          //                   child: Text('출발'),
          //                 )
          //               ],
          //             )),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(flex: contextFont, child: Text('도착')),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(
          //           flex: contextSpace,
          //           child: SizedBox(),
          //         ),
          //         Expanded(flex: contextFont, child: Text('현황')),
          //       ],
          //     ),
          //   ),
          // ),
        ]),
      ),
    );
  }
}
