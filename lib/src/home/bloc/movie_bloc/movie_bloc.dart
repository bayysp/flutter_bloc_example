import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutterrxdart/src/home/data_source/movie_data_source.dart';
import 'package:flutterrxdart/src/home/model/movie_popular_entity.dart';
import 'package:meta/meta.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieStateFetchingPopular());

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    print("MovieBloc - current event = $event");

    if(event is MovieEventFetchPopular){
      yield MovieStateIsLoading();

      //get movie populars in json
      final result = await MovieDataSource.instance.loadPopularMovies();

      if(result != null) {
        print("PopularBloc - result not null , result : $result");
        final populars = MoviePopularEntity().fromJson(result);
        print("PopularBloc : populars data = $populars ");
        yield MovieStatePopularFetched(populars);
      }else{
        yield MovieStateIsNotLoaded();
      }
    }else if (event is MovieEventFetchTopRated){

      yield MovieStateTopRatedFetched();

    }else if (event is MovieEventFetchNowPlaying){

      yield MovieStateNowPlayingFetched();

    }else if (event is MovieEventFetchLatest){

      yield MovieStateLatestFetched();

    }else if (event is MovieEventFetchUpcoming){

      yield MovieStateUpcomingFetched();

    }else{
      yield MovieStateIsNotLoaded();
    }
  }
}
