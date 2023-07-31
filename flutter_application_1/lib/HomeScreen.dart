import 'package:flutter/material.dart';
import 'main.dart';
import 'package:get/get.dart';
import 'PartyList.dart';
import 'ScreenThree.dart';
import 'MyInfo.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (_) => ScreenTwo(),
                //   )
                // );

                Get.to(MyInfo());
              },
              child: Text(
                'Screen Two 이동',
              ),
            ),
            TextButton(
              onPressed: () {
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //     builder: (_) => ScreenTwo(),
                //   ),
                // );

                Get.off(MyInfo());
              },
              child: Text(
                '전 페이지로 돌아가지 못하게하기',
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 212, 212, 212),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: TextButton(
                    child: Text('파티 리스트',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    onPressed: () {
                      Get.to(PartyList());
                    })),
            VerticalDivider(
              color: Colors.white,
              thickness: 3,
            ),
            Expanded(
                child: TextButton(
                    child: Text('내 정보',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    onPressed: () {
                      Get.to(MyInfo());
                    }))
          ],
        ),
      ),
    );
  }
}
