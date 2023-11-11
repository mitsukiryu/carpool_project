import 'package:flutter/material.dart';

Widget card_partylist(String inputdate, String inputType, String inputTime,
    String inputStart, String inputEnd, String inputStatus) {
  int contextSpace = 1;
  int contextFont = 3;

  return Container(
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
          child: Text(inputdate),
        ),
        Expanded(
          flex: contextSpace,
          child: SizedBox(),
        ),
        Expanded(
          flex: contextSpace,
          child: SizedBox(),
        ),
        Expanded(flex: contextFont, child: Text(inputType)),
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
                Expanded(flex: 2, child: Text(inputTime)),
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
  );
}
