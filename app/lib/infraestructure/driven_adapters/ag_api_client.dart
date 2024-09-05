import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../agenda2.dart';

class AgApiClient {
  static Future<String> post(String endpoint, Map<String, dynamic> body,
      {Map<String, String>? aditionalHeadders, String? securityToken}) async {
    String baseApi = env['BASE_URL']!;
    Map<String, String> headders = {
      HttpHeaders.contentTypeHeader: 'application/json'
    };
    if (aditionalHeadders != null) {
      headders.addAll(aditionalHeadders);
    }
    if (securityToken != null) {
      headders
          .addAll({HttpHeaders.authorizationHeader: 'Bearer $securityToken'});
    }
    final response = await http.Client().post(Uri.parse('$baseApi$endpoint'),
        body: json.encode(body), headers: headders);
    if (response.statusCode == 200) {
      return response.body;
    }
    throw AppError(message: response.body, errorCode: response.statusCode);
  }

  static Future<String> get(String endpoint,
      {Map<String, String>? aditionalHeadders, String? securityToken}) async {
    String baseApi = env['BASE_URL']!;
    Map<String, String> headders = {
      HttpHeaders.contentTypeHeader: 'application/json'
    };
    if (aditionalHeadders != null) {
      headders.addAll(aditionalHeadders);
    }
    if (securityToken != null) {
      headders
          .addAll({HttpHeaders.authorizationHeader: 'Bearer $securityToken'});
    }
    final response = await http.Client()
        .get(Uri.parse('$baseApi$endpoint'), headers: headders);
    if (response.statusCode == 200) {
      return response.body;
    }
    throw AppError(message: response.body, errorCode: response.statusCode);
  }
}
