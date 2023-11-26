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
      // Uri.parse('http://3.27.196.5/party/find'),
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
          FutureBuilder<List<Party>>(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                final data = snapshot.data!;
                print(data.toString());
                return ListView.builder(
                  primary: false, // <====  disable scrolling. 리스트뷰 내부는 스크롤 안할거임
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) =>
                      Column(children: [
                    card_partylist(
                        data[index].date_time,
                        data[index].party_type,

                        // data[index].party_member_id,
                        data[index].departure,
                        data[index].id,
                        data[index].destination,
                        data[index].cur_recruitment.toString() +
                            '/' +
                            data[index].max_recruitment.toString(),
                        data[index].party_recruiter_id,
                        // 'phone',
                        (data[index]
                            .party_member_id
                            .map((e) => e.toString())
                            .toList()),
                        data[index].max_recruitment,
                        data[index].cur_recruitment
                        // 'user',
                        // 'phone',
                        // 'user',
                        // 'phone',
                        // 'user',
                        // 'phone'
                        ),
                    SizedBox(
                      height: 7,
                    )
                  ]),
                );
              } else if (snapshot.hasError) {
                return const Center(child: Icon(Icons.error_outline));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ]),
      ),
    );
  }
}
