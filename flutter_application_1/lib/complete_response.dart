import 'dart:convert';

import 'package:flutter_application_1/autocomplete_prediction.dart';

class CompleteResponse {
  final String? status;
  final List<AutocompletePrediction>? predictions;

  CompleteResponse({this.status, this.predictions});

  factory CompleteResponse.fromjson(Map<String, dynamic> json) {
    return CompleteResponse(
      status: json['status'] as String,
      predictions: json['predictions'] != null
          ? json['predictions']
              .map<AutocompletePrediction>(
                  (json) => AutocompletePrediction.fromJson(json))
              .toList()
          : null,
    );
  }

  static CompleteResponse parseAutocompleteResult(String responseBody) {
    final parsed = json.decode(responseBody).cast<String, dynamic>();

    return CompleteResponse.fromjson(parsed);
  }
}
