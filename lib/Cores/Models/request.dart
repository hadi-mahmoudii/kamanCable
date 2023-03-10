import 'dart:convert';

import 'package:http/http.dart' as http;

class ServerRequest {
  Future<dynamic> post(dynamic url, dynamic headers, dynamic body) async {
    try {
      var response = await http.post(
        Uri.parse(url),
        body: json.encode(body),
        headers: headers,
      );
      var resultData = json.decode(response.body);
      return resultData;
    } catch (e) {
      // print(e);
      return {};
    }
  }

  Future<dynamic> get(dynamic url, dynamic headers) async {
    try {
      var response = await http.get(Uri.parse(url), headers: headers);
      var resultData = json.decode(response.body);
      return resultData;
    } catch (e) {
      // print(e);
      return {};
    }
  }

  Future<dynamic> delete(dynamic url, dynamic headers) async {
    try {
      var response = await http.delete(Uri.parse(url), headers: headers);
      var resultData = json.decode(response.body);
      return resultData;
    } catch (e) {
      // print(e);
      return {};
    }
  }
}
