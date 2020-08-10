import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutterrxdart/src/home/data_source/movie_data_source.dart';
import 'package:flutterrxdart/src/home/model/movie_latest_entity.dart';
import 'package:flutterrxdart/src/home/model/movie_now_playing_entity.dart';
import 'package:flutterrxdart/src/home/model/movie_popular_entity.dart';
import 'package:flutterrxdart/src/home/model/movie_top_rated_entity.dart';
import 'package:flutterrxdart/src/home/model/movie_upcoming_entity.dart';
import 'package:flutterrxdart/src/network/network_error.dart';
import 'package:meta/meta.dart';

part 'movie_event.dart';

part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieState.initial<MoviePopularEntity>());

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    print("MovieBloc - current event = ${event.status}");

    switch (event.status) {
      case MovieEventStatus.POPULARS:
        yield MovieState.onLoading<MoviePopularEntity>();
        try {
          final data = await MovieDataSource.instance.loadMovies("popular");
          print("PopularBloc - populars data : $data ");

          if (data["results"] == null) {
            yield MovieState.onError<MoviePopularEntity>(
                data["status_message"]);
          } else {
            yield MovieState.onSuccess<MoviePopularEntity>(
                MoviePopularEntity().fromJson(data));
          }
        } on NetworkError {
          yield MovieState.onError<MoviePopularEntity>("Network Error");
        }
        break;

      case MovieEventStatus.TOP_RATED:
        yield MovieState.onLoading<MovieTopRatedEntity>();
        try {
          final data = await MovieDataSource.instance.loadMovies(event.param);
          print("MovieBloc - movie toprated data : $data ");

          if (data["results"] == null) {
            yield MovieState.onError<MovieTopRatedEntity>(
                data["status_message"]);
          } else {
            yield MovieState.onSuccess<MovieTopRatedEntity>(
                MovieTopRatedEntity().fromJson(data));
          }
        } on NetworkError {
          yield MovieState.onError<MovieTopRatedEntity>("Network Error");
        }
        break;

      case MovieEventStatus.NOW_PLAYING:
        yield MovieState.onLoading<MovieNowPlayingEntity>();
        try {
          final data = await MovieDataSource.instance.loadMovies(event.param);
          print("MovieBloc - movie nowplaying data : $data ");

          if (data["results"] == null) {
            yield MovieState.onError<MovieNowPlayingEntity>(
                data["status_message"]);
          } else {
            yield MovieState.onSuccess<MovieNowPlayingEntity>(
                MovieNowPlayingEntity().fromJson(data));
          }
        } on NetworkError {
          yield MovieState.onError<MovieNowPlayingEntity>("Network Error");
        }
        break;

      case MovieEventStatus.LATEST:
        yield MovieState.onLoading<MovieLatestEntity>();
        try {
          final data = await MovieDataSource.instance.loadMovies(event.param);
          print("MovieBloc - movie latest data : $data ");

          if (data.containsKey("success") != null && data["success"] == false) {
            yield MovieState.onError<MovieLatestEntity>(data["status_message"]);
          } else {
            yield MovieState.onSuccess<MovieLatestEntity>(
                MovieLatestEntity().fromJson(data));
          }
        } on NetworkError {
          yield MovieState.onError<MovieLatestEntity>("Network Error");
        }
        break;

      case MovieEventStatus.UPCOMING:
        yield MovieState.onLoading<MovieUpcomingEntity>();
        try {
          final data = await MovieDataSource.instance.loadMovies(event.param);
          print("MovieBloc - movie upcoming data : $data ");

          if (data["results"] == null) {
            yield MovieState.onError<MovieUpcomingEntity>(
                data["status_message"]);
          } else {
            yield MovieState.onSuccess<MovieUpcomingEntity>(
                MovieUpcomingEntity().fromJson(data));
          }
        } on NetworkError {
          yield MovieState.onError<MovieUpcomingEntity>("Network Error");
        }
        break;
    }
  }
}
