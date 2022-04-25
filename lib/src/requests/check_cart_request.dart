import 'dart:convert';

import 'package:promarket/config/global_config.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> checkCartRequest(List products) async {
  String url = "$GLOBAL_URL/order/checkout";

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json"
  };

  final client = new http.Client();

  Map<String, dynamic> body = {"products": products};

  Map<String, dynamic> responseJson = {};

  final response = await client.post(Uri.parse(url),
      headers: headers, body: json.encode(body));

  try {
    if (response.statusCode == 200)
      responseJson = json.decode(response.body) as Map<String, dynamic>;
  } on FormatException catch (e) {
    print(e);
  }

  return responseJson;
}
