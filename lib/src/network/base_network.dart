import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutterrxdart/src/home/model/movie_popular_entity.dart';

class BaseNetwork {
  static final String baseUrl = "https://api.themoviedb.org/3";
  static final String baseBackdropUrl = "https://image.tmdb.org/t/p/w780/";
  static final String baseApiKey = "05faacecb1bb8a123ad56542b1708bad";
  static final String baseImageUrl = "https://image.tmdb.org/t/p/w185/";

  static Future<Map<String, dynamic>> get(String partUrl) async {
    final fullUrl = baseUrl + "/" + partUrl + "?api_key=$baseApiKey";
    print("BaseNetwork - fullUrl : $fullUrl");

    final response = await http.get(fullUrl);
    print("BaseNetwork - response : $response");

    if (response.statusCode == 200) {
      print("BaseNetwork - status code 200, response.body : ${response.body}");
      return json.decode(response.body);
    } else {
      print("BaseNetwork  - status code not 200 : ${response.statusCode}");
      return json.decode(response.body);
    }
  }
}
