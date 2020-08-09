part of 'movie_bloc.dart';

class MovieEvent {
  MovieEventStatus status;
  String param;

  MovieEvent({@required this.status, @required this.param});

  static MovieEvent onPopulars() =>
      MovieEvent(status: MovieEventStatus.POPULARS, param: 'popular');

  static MovieEvent onTopRated(String movieId) =>
      MovieEvent(status: MovieEventStatus.TOP_RATED, param: 'top_rated');

  static MovieEvent onNowPlaying() =>
      MovieEvent(status: MovieEventStatus.NOW_PLAYING, param: 'now_playing');

  static MovieEvent onLatest() =>
      MovieEvent(status: MovieEventStatus.LATEST, param: 'latest');

  static MovieEvent onUpcoming() =>
      MovieEvent(status: MovieEventStatus.UPCOMING, param: 'upcoming');
}

enum MovieEventStatus { POPULARS, TOP_RATED, NOW_PLAYING, LATEST, UPCOMING}
