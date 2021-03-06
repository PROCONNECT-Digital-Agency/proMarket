import 'dart:convert';

import 'package:promarket/config/global_config.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> passwordResetRequest(
    String phone, String password) async {
  String url = "$GLOBAL_URL/client/reset";

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json"
  };

  final client = new http.Client();

  Map<String, String> body = {"phone": phone, "password": password};

  final response = await client.post(Uri.parse(url),
      headers: headers, body: json.encode(body));

  Map<String, dynamic> responseJson = {};
  print(body);

  try {
    if (response.statusCode == 200)
      responseJson = json.decode(response.body) as Map<String, dynamic>;
  } on FormatException catch (e) {
    print(e);
  }

  return responseJson;
}
