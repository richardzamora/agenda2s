import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../agenda2.dart';

class AgApiClient {
  static Future<String> post(String endpoint, Map<String, dynamic> body,
      {Map<String, String>? aditionalHeadders}) async {
    String baseApi = env['BASE_URL']!;
    Map<String, String> headders = {'Content-Type': 'application/json'};
    if (aditionalHeadders != null) {
      headders.addAll(aditionalHeadders);
    }
    final response = await http.Client().post(Uri.parse('$baseApi$endpoint'),
        body: json.encode(body), headers: headders);
    if (response.statusCode == 200) {
      return response.body;
    }
    throw AppError(message: response.body, errorCode: response.statusCode);
  }
}
