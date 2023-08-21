import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class places_api {
  final String key = 'AIzaSyDb07Vf1svXpIzmxKzzqskSkDARb5Nzeco';

  Future<String> get_place_id(String input) async {
    final String url = 'https://places.googleapis.com/v1/places:searchText';

    var response = await http.post(Uri.parse(url),
        headers: {
          "Content-Type": 'application/json',
          'X-Goog-Api-Key': 'AIzaSyDb07Vf1svXpIzmxKzzqskSkDARb5Nzeco',
          'X-Goog-FieldMask': 'places.displayName,places.formattedAddress',
        },
        body: convert.jsonEncode({'textQuery': '$input'}));

    if (response.statusCode == 200) {
      final responseBody = convert.jsonDecode(response.body);
      print(responseBody);
    } else {
      print('Request failed with status: ${response.statusCode}');
    }

    // print(placeId);

    return response.body;
  }

  // Future<String> get_place_id(String input) async {}
}
