import 'package:flutter/material.dart';
import 'package:flutter_application_1/sub_party_list.dart';
import 'package:get/get.dart';

Widget card_partylist(
  String inputdate,
  String inputType,
  // List<dynamic> inputType,
  String inputStart,
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
          inputdate,
          inputType,
          inputStart,
          inputEnd,
          inputStatus));
    },
    child: Container(
      height: 90,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black))),
      child: Row(
        children: [
          Expanded(
            flex: contextSpace,
            child: SizedBox(),
          ),
          Expanded(
            flex: contextFont,
            child: Text(inputdate[0] +
                inputdate[1] +
                inputdate[2] +
                inputdate[3] +
                inputdate[4] +
                inputdate[5] +
                inputdate[6] +
                inputdate[7] +
                inputdate[8] +
                inputdate[9]),
          ),
          Expanded(
            flex: contextSpace,
            child: SizedBox(),
          ),
          Expanded(
            flex: contextSpace,
            child: SizedBox(),
          ),
          Expanded(flex: contextFont, child: Text(inputType.toString())),
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
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(
                      flex: 2,
                      child: Text(inputdate[11] +
                          inputdate[12] +
                          inputdate[13] +
                          inputdate[14] +
                          inputdate[15])),
                  Expanded(
                    flex: 2,
                    child: Text(inputStart),
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
          Expanded(flex: contextFont, child: Text(inputEnd)),
          Expanded(
            flex: contextSpace,
            child: SizedBox(),
          ),
          Expanded(
            flex: contextSpace,
            child: SizedBox(),
          ),
          Expanded(flex: contextFont, child: Text(inputStatus)),
        ],
      ),
    ),
  );
}
