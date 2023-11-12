import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/class/party.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'sub_party_list.dart';
import 'widget/card_partylist.dart';
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
  Future getData() async {
    var response = await http.get(
      Uri.parse('http://10.0.2.2:8000/party/find'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded'
      },
    );
    if (response.statusCode == 200) {
      List<dynamic> jsonDataList = json.decode(response.body);

      // List<Party> parties =
      //     jsonDataList.map((json) => Party.fromJson(json)).toList();

      // print(parties);
      return response;

      // List <Party> = parties =  List<Party>.from(json.decode(response.body));
//       Iterable l = json.decode(response.body);
// List<Party> posts = List<Party>.from(l.map((model)=> Party.fromJson(model)));
      // List<Party> parties;
      // parties = (json.decode(response.body) as List)
      //     .map((i) => parties.(i))
      //     .toList();
      // print('success');

      // final parsed =
      //     (jsonDecode(response.body) as List).cast<Map<String, dynamic>>();

      // parsed.map<Party>((json) => Party.fromJson(json).toList());

      // List jsonData = json.decode(response.body);
      // print(jsonData[0]);
      // print(jsonData.length);

      // List<dynamic> jsonDataList = jsonDecode(response.body);
      // print('success');

      // print(jsonDataList.length);
      // print(jsonDataList[1]);
      // print("\n");
      // print("\n");

      // print(jsonDataList[1]);
      // List<Party> parties = [];
      // for (var u in jsonDataList) {
      //   Party party = Party(
      //       u['date_time'],
      //       u['destination'],
      //       u['departure'],
      //       u['max_recruitment'],
      //       u['cur_recruitment'],
      //       u['party_type'],
      //       u['party_recruiter_id'],
      //       u['party_member_id'],
      //       u['departure_party_Lat'],
      //       u['departure_party_Lng'],
      //       u['destination_party_Lat'],
      //       u['destination_party_Lng']);

      //   parties.add(party);
      // }
      // print(parties.length);
      // return jsonDataList;
    } else {
      print("힝");
      return;
    }
  }
  // @override
  // Future List<Party> getData() async {
  //   var response = await http.get(
  //     Uri.parse('http://10.0.2.2:8000/party/find'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/x-www-form-urlencoded'
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     // List<dynamic> responseJson = json.decode(response.body);
  //     print("페이지1 완료");
  //     // List<Party> parties =
  //         // responseJson.map((json) => Party.fromJson(json)).toList();

  //     // List responseJson = json.decode(response.body);

  //     // print('데이터나옵니다$parties');

  //     return response.map<Party>().toList();
  //     print('success');
  //     return parties;
  //   } else if (response.statusCode == 422) {
  //     print('Response body for 422 error: ${response.body}');
  //     return;
  //   } else {
  //     return;
  //   }
  // }

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
        //     future: getData(),
        //     builder: (context, snapshot) {
        //       if (snapshot.data == null) {
        //         print(snapshot);
        //         return CircularProgressIndicator();
        //       } else {
        //         return ListView.builder(
        //             itemCount: snapshot.data!.legnth,
        //             itemBuilder: (BuildContext context, int index) {
        //               return Padding(
        //                 padding: const EdgeInsets.all(8.0),
        //                 child: card_partylist(
        //                     snapshot.data[index].date_time,
        //                     snapshot.data[index].party_type,
        //                     snapshot.data[index].dateTime,
        //                     snapshot.data[index].departure,
        //                     snapshot.data[index].destination,
        //                     '&snapshot.data[index].cur_recruitment/&snapshot.data[index].max_recruitment'),
        //               );
        //             });
        //       }
        //     }),

        // FutureBuilder(
        //   future: getData(),
        //   builder: (context, AsyncSnapshot<dynamic> snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return CircularProgressIndicator();
        //     } else if (snapshot.hasError) {
        //       return Text("Error: ${snapshot.error}");
        //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
        //       return Text("No data available");
        //     } else {
        //       // print('데이터나옵니다&snapshot.data!.length');
        //       return ListView.builder(
        //         itemCount: snapshot.data!.length,
        //         itemBuilder: (context, index) {
        //           final party = snapshot.data![index];
        //           return Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: card_partylist(
        //               party.dateTime,
        //               party.partyType,
        //               party.dateTime,
        //               party.departure,
        //               party.destination,
        //               party.curRecruitment.toString(),
        //             ),
        //           );
        //         },
        //       );
        //     }
        //   },
        // ),

        // FutureBuilder(
        //   future: getData(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       return ListView.builder(
        //         itemCount: snapshot.data.length,
        //         itemBuilder: (context, index) {
        //           final studentInfo = [index];
        //           return Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             //10
        //             child: card_partylist(inputdate, inputType, inputTime, inputStart, inputEnd, inputStatus)

        //           );
        //         },
        //       );
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
