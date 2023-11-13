import 'package:flutter/material.dart';
import 'package:flutter_application_1/sub_party_list.dart';
import 'package:get/get.dart';

Widget card_partylist(
  String inputdate,
  String inputType,
  // List<dynamic> inputType,
  String inputStart,
  String inputId,
  String inputEnd,
  String inputStatus,
  String inputsubLeaderName,
  String inputsubLeaderPhone,
  String inputsubMemberName1,
  String inputsubMemberPhone1,
  String inputsubMemberName2,
  String inputsubMemberPhone2,
  String inputsubMemberName3,
  String inputsubMemberPhone3,
) {
  int contextSpace = 1;
  int contextFont = 3;

  return GestureDetector(
    onTap: () {
      Get.to(() => sub_party_list(
          inputsubLeaderName,
          inputsubLeaderPhone,
          inputsubMemberName1,
          inputsubMemberPhone1,
          inputsubMemberName2,
          inputsubMemberPhone2,
          inputsubMemberName3,
          inputsubMemberPhone3,
          inputId,
          inputdate,
          inputType,
          inputStart,
          inputEnd,
          inputStatus));
    },
    child: Container(
      height: 90,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 229, 228, 228),
          border: Border.all(
            color: const Color.fromARGB(255, 229, 228, 228),
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          Expanded(
            flex: contextSpace,
            child: SizedBox(),
          ),
          Expanded(
            flex: 6,
            child: Column(children: [
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(flex: 3, child: Text(inputType)),
              Expanded(
                  flex: 6,
                  child: Container(
                    width: 70, // 동그란 모양의 틀의 지름을 나타내는 값
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey, // 동그란 모양의 틀의 배경색
                      image: DecorationImage(
                        image: inputType == '택시'
                            ? AssetImage('images/taxi_icon.jpg') // 택시 이미지의 경로
                            : inputType == '카풀'
                                ? AssetImage(
                                    'images/car_icon.jpg') // 카풀 이미지의 경로
                                : AssetImage(
                                    'assets/default_image.png'), // 기본 이미지 경로
                        fit: BoxFit.cover, // 이미지를 동그란 틀에 맞춰서 보여주도록 설정
                      ),
                    ),
                  )),
              Expanded(
                child: SizedBox(),
                flex: 1,
              )
            ]),
          ),
          Expanded(
            child: SizedBox(),
            flex: 2,
          ),
          Expanded(
              flex: 18,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(' ',
                        style: TextStyle(
                          fontSize: 3.0,
                        )),
                    Text(inputStart,
                        style: TextStyle(
                          fontSize: 16.0,
                        )),
                    Text(inputEnd,
                        style: TextStyle(
                          fontSize: 16.0,
                        )),
                    Text(' ',
                        style: TextStyle(
                          fontSize: 3.0,
                        )),
                    Text(inputdate[0] +
                        inputdate[1] +
                        inputdate[2] +
                        inputdate[3] +
                        '.' +
                        inputdate[5] +
                        inputdate[6] +
                        '.' +
                        inputdate[8] +
                        inputdate[9] +
                        '   ' +
                        inputdate[11] +
                        inputdate[12] +
                        inputdate[13] +
                        inputdate[14] +
                        inputdate[15])
                  ])),
          Expanded(
            child: SizedBox(),
            flex: 1,
          ),
          Expanded(
            flex: 3,
            child: Text(inputStatus),
          )
        ],
      ),
    ),
  );
}
