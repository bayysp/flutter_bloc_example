import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutterrxdart/src/home/model/movie_popular_entity.dart';

import 'network_error.dart';

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
    return _processResponse(response);
  }

  static Future<Map<String, dynamic>> _processResponse(
      http.Response response) async {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        final body = response.body ?? "";
        if (body.isNotEmpty) {
          final jsonBody = json.decode(body);
          return jsonBody;
        } else {
          return {"error": true};
        }
      },
    );
  }
}
