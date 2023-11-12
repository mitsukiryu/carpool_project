import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AutocompletePrediction {
  final String? description;

  final StructuredFormatting? structuredFormatting;

  final String? placeId;

  final String? reference;

  AutocompletePrediction({
    this.description,
    this.structuredFormatting,
    this.placeId,
    this.reference,
  });

  factory AutocompletePrediction.fromJson(Map<String, dynamic> json) {
    return AutocompletePrediction(
      description: json['description'] as String?,
      placeId: json['place_id'] as String?,
      reference: json['reference'] as String?,
      structuredFormatting: json['structured_formatting'] != null
          ? StructuredFormatting.fromJson(json['structured_formatting'])
          : null,
    );
  }
}

class StructuredFormatting {
  final String? mainText;

  final String? secondaryText;

  StructuredFormatting({this.mainText, this.secondaryText});

  factory StructuredFormatting.fromJson(Map<String, dynamic> json) {
    return StructuredFormatting(
      mainText: json['main_text'] as String?,
      secondaryText: json['secondary_text'] as String?,
    );
  }
}

class GetLocation {
  Future<Map<String, dynamic>> GetLocByID(String? id) async {
    final String url = "https://places.googleapis.com/v1/places/$id";
    var response = await http.get(
      Uri.parse(url),
      headers: {
        "Content-Type": 'application/json',
        'X-Goog-Api-Key': 'mapAPIKey',
        'X-Goog-FieldMask': 'displayName,formattedAddress',
      },
    );
    Map<String, dynamic> placejson = convert.jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(placejson);
    } else {
      print('Request failed: ${response.statusCode}');
    }

    return placejson;
  }
}
