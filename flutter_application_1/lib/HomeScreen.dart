import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/autocomplete_prediction.dart';
import 'package:flutter_application_1/party_list.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'MyInfo.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'bottom_popup.dart';
import 'places_api.dart';
import 'autocomplete.dart';
import 'complete_response.dart';
import 'location_list_tile.dart';
import 'creating_party.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<AutocompletePrediction> placePrediction = [];
  bool _isWriting = false;

  void placeAutocomplete(String query) async {
    Uri uri =
        Uri.https('maps.googleapis.com', '/maps/api/place/autocomplete/json', {
      "input": query,
      'key': 'AIzaSyDuA0YY1zQE7nyC-sj8i8s2VKt9WRDnGh4',
    });
    String? response = await get_method.fetchUrl(uri);

    if (response != null) {
      CompleteResponse result =
          CompleteResponse.parseAutocompleteResult(response);
      if (result.predictions != null) {
        setState(() {
          placePrediction = result.predictions!;
        });
      }
    }
  }

  final Completer<GoogleMapController> _controller = Completer();
  TextEditingController _searchCon = TextEditingController();

  Set<Marker> _markers = Set<Marker>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(36.09826133580664, 129.387749655962),
    zoom: 14.4746,
  );

  Future<void> goToPlace(LatLng latlng) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latlng, zoom: 13)));
  }

  void _setMarker(Map<String, dynamic> place, i) {
    final double lat = place['latitude'];
    final double lng = place['longitude'];
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('marker$i'),
          position: LatLng(lat, lng),
          onTap: () {
            bottom_popup(context);
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        onPressed: () {
          Get.to(() => creating_party());
        },
        backgroundColor: Colors.grey,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      onChanged: (value) {
                        placeAutocomplete(value);
                        _isWriting = value.length > 0;
                      },
                      controller: _searchCon,
                      decoration: const InputDecoration(
                        hintText: "Search",
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        var place =
                            await places_api().get_place_id(_searchCon.text);
                        goToPlace(LatLng(
                            place['places'][0]['location']['latitude'],
                            place['places'][0]['location']['longitude']));
                      },
                      icon: Icon(Icons.search)),
                ],
              ),
            ),
            Expanded(
                child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: _markers,
            )),
            if (_isWriting)
              Expanded(
                  child: ListView.builder(
                      itemCount: placePrediction.length,
                      itemBuilder: (context, index) => LocationListTile(
                            press: () async {
                              var IndexLoc = await GetLocation()
                                  .GetLocByID(placePrediction[index].placeId);
                              goToPlace(LatLng(IndexLoc['location']['latitude'],
                                  IndexLoc['location']['longitude']));
                            },
                            location: placePrediction[index].description!,
                          ))),
          ],
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
                      Get.to(() => party_list());
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
                      Get.to(() => MyInfo());
                    }))
          ],
        ),
      ),
    );
  }
}
