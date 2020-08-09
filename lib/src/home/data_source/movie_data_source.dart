import 'package:flutterrxdart/src/home/model/movie_popular_entity.dart';
import 'package:flutterrxdart/src/network/base_network.dart';

class MovieDataSource {

  static MovieDataSource instance = MovieDataSource();

  Future<Map<String, dynamic>> loadMovies(String param) {
    return BaseNetwork.get("movie/$param");
  }

  String loadImagePoster(String imageUrl) {
    return BaseNetwork.baseImageUrl + imageUrl;
  }

  String loadImageBackdrop(String imageUrl) {
    return BaseNetwork.baseBackdropUrl + imageUrl;
  }
}
