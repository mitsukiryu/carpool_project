import 'package:flutter/material.dart';
import 'package:flutter_application_1/places_api.dart';
import 'main.dart';
import 'package:get/get.dart';
import 'PartyList.dart';
import 'dart:async';
import 'ScreenThree.dart';
import 'MyInfo.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  TextEditingController _searchCon = TextEditingController();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(36.09826133580664, 129.387749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _searchCon,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(hintText: 'Search by KeyWords'),
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  places_api().get_place_id(_searchCon.text);
                },
                icon: Icon(Icons.search),
              ),
            ],
          ),
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ],
      ),
      // body: Center(
      //   child: SingleChildScrollView(
      //     child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      //       TextButton(
      //         onPressed: () {
      //           // Navigator.of(context).push(
      //           //   MaterialPageRoute(
      //           //     builder: (_) => ScreenTwo(),
      //           //   )
      //           // );

      //           Get.to(MyInfo());
      //         },
      //         child: Text(
      //           'Screen Two 이동',
      //         ),
      //       ),
      //       TextButton(
      //         onPressed: () {
      //           // Navigator.of(context).pushReplacement(
      //           //   MaterialPageRoute(
      //           //     builder: (_) => ScreenTwo(),
      //           //   ),
      //           // );

      //           Get.off(MyInfo());
      //         },
      //         child: Text(
      //           '전 페이지로 돌아가지 못하게하기',
      //         ),
      //       ),
      //     ]),
      //   ),
      // ),
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
