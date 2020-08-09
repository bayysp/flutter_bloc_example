import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutterrxdart/src/home/model/movie_popular_entity.dart';
import 'package:meta/meta.dart';

part 'movie_event.dart';

part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieState.initial<MoviePopularEntity>());

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    print("MovieBloc - current event = $event");

    switch(event.status){
      case MovieEventStatus.POPULARS:

        break;

      case MovieEventStatus.TOP_RATED:
        break;

      case MovieEventStatus.NOW_PLAYING:
        break;

      case MovieEventStatus.LATEST:
        break;

      case MovieEventStatus.UPCOMING:
        break;

    }
    
  }
}
