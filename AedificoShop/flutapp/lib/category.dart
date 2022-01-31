import 'dart:convert';

import 'package:http/http.dart' as http;

class Category {
  String baseURL = "";
  Future<List> getAllCategory() async {
    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
