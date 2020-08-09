import 'package:flutter/cupertino.dart';
import 'package:flutterrxdart/src/home/model/movie_popular_entity.dart';
import 'package:flutterrxdart/src/network/network_error.dart';

class ApiProcess{
  static Future _processResponse(jsonResult) async {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        if (jsonResult.containsKey("results")) {
          final product = MoviePopularEntity().fromJson(jsonResult["results"]);
          return product;
        }

        if (jsonResult["code"] != 200) {
          if (jsonResult.containsKey('message')) {
            throw NetworkError.errorMessage = jsonResult['message'];
          } else {
            throw NetworkError.errorMessage = "Something wen't wrong";
          }
        }

        return {"error": true};
      },
    );
  }
}
