part of 'movie_bloc.dart';

class MovieState<T> {
  MovieStateStatus status;
  T data;
  String errorMessage;

  MovieState({@required this.status, this.data, this.errorMessage});

  static MovieState initial<T>() =>
      MovieState(status: MovieStateStatus.INITIAL);

  static MovieState onSuccess<T>(T data) =>
      MovieState(status: MovieStateStatus.SUCCESS, data: data);

  static MovieState onError<T>(String errorMessage) =>
      MovieState(status: MovieStateStatus.ERROR, errorMessage: errorMessage);

  static MovieState onLoading<T>() =>
      MovieState(status: MovieStateStatus.LOADING);
}

enum MovieStateStatus { INITIAL, LOADING, SUCCESS, ERROR }
