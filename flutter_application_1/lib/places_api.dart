import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class places_api {
  final String key = 'AIzaSyDuA0YY1zQE7nyC-sj8i8s2VKt9WRDnGh4';

  Future<Map<String, dynamic>> get_place_id(String input) async {
    final String url = 'https://places.googleapis.com/v1/places:searchText';

    var response = await http.post(Uri.parse(url),
        headers: {
          "Content-Type": 'application/json',
          'X-Goog-Api-Key': 'AIzaSyDuA0YY1zQE7nyC-sj8i8s2VKt9WRDnGh4',
          // 'rankPreference': 'DISTANCE',
          'X-Goog-FieldMask':
              'places.displayName,places.formattedAddress,places.location,places.photos',
        },
        body: convert.jsonEncode({'textQuery': '$input'}));

    Map<String, dynamic> placejson = convert.jsonDecode(response.body);

    var placeloc = placejson['places'][0]['location'];

    if (response.statusCode == 200) {
      print(placejson);
    } else {
      print('Request failed with status: ${response.statusCode}');
    }

    // print(placeId);

    return placejson;
  }

  // Future<String> get_place_id(String input) async {}
}
