import 'package:flutterrxdart/src/home/model/movie_popular_entity.dart';
import 'package:flutterrxdart/src/network/base_network.dart';

class MovieDataSource {

  static MovieDataSource instance = MovieDataSource();

  Future<Map<String, dynamic>> loadPopularMovies() {
    return BaseNetwork.get("movie/popular");
  }

  String loadImagePoster(String imageUrl) {
    return BaseNetwork.baseImageUrl + imageUrl;
  }

  String loadImageBackdrop(String imageUrl) {
    return BaseNetwork.baseBackdropUrl + imageUrl;
  }
}
