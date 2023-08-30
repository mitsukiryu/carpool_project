import "package:get/get.dart";
import "package:flutter/material.dart";

class creating_party extends StatelessWidget {
  const creating_party({super.key});

  @override
  Widget build(BuildContext context) {
    // Color taxi_button = const Color.fromARGB(255, 132, 132, 132);
    // Color carpool_button = Color.fromARGB(255, 254, 254, 254);
    String notthing_statement = "";
    String taxi_statement = "택시를 선택하셨습니다";
    String carpool_statement = "카풀을 선택하셨습니다";

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
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Container(
              // color: const Color.fromARGB(255, 212, 212, 212),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(width: 2, color: Colors.black)),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: TextButton(
                          child: Text('택시',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                          onPressed: () {})),
                  VerticalDivider(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    thickness: 3,
                  ),
                  Expanded(
                      child: TextButton(
                          child: Text('카풀',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                          onPressed: () {}))
                ],
              ),
            ),
            SizedBox(
              height: 20,
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
                      child: Text(
                        '날짜:',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      flex: 5,
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
                      child: SizedBox(),
                      flex: 1,
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
                      child: Text(
                        '시간:',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      flex: 5,
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
                      child: SizedBox(),
                      flex: 1,
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
                      child: Text(
                        '출발지:',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      flex: 5,
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
                      child: SizedBox(),
                      flex: 1,
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
                      child: Text(
                        '목적지:',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      flex: 5,
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
                      child: SizedBox(),
                      flex: 1,
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
                      child: Text(
                        '모집인원:',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      flex: 5,
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
                      child: SizedBox(),
                      flex: 1,
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(children: [
                  Expanded(child: SizedBox(), flex: 1),
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
                  Expanded(child: SizedBox(), flex: 1),
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
                  Expanded(child: SizedBox(), flex: 1),
                ]),
              ],
            ),
          ]),
        ));
  }
}
