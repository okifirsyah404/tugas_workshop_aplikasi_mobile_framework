import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class NetworkServices {
  final String BASE_URL = "https://api.themoviedb.org/3";
  final String? API_KEY = dotenv.env["API_KEY"];

  Future<dynamic> getMethod() async {
    var response =
        await http.get(Uri.parse("$BASE_URL/movie/popular?api_key=$API_KEY"));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print("Cannet get from rest API");
    }
  }
}
