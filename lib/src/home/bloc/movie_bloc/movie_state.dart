part of 'movie_bloc.dart';

@immutable
abstract class MovieState {}

class MovieStateFetchingPopular extends MovieState {}

class MovieStateFetchingTopRated extends MovieState {}

class MovieStateFetchingNowPlaying extends MovieState {}

class MovieStateFetchingLatest extends MovieState {}

class MovieStateFetchingUpcoming extends MovieState {}

class MovieStateIsLoading extends MovieState {}

class MovieStateIsNotLoaded extends MovieState {}

class MovieStatePopularFetched extends MovieState {
  final MoviePopularEntity moviePopularEntity;

  MovieStatePopularFetched(this.moviePopularEntity);
}

class MovieStateTopRatedFetched extends MovieState {
  final String status;

  MovieStateTopRatedFetched({this.status = "toprated"});
}

class MovieStateNowPlayingFetched extends MovieState {
  final String status;

  MovieStateNowPlayingFetched({this.status = "nowplaying"});
}

class MovieStateLatestFetched extends MovieState {
  final String status;

  MovieStateLatestFetched({this.status = "latest"});
}

class MovieStateUpcomingFetched extends MovieState {
  final String status;

  MovieStateUpcomingFetched({this.status = "upcoming"});
}
