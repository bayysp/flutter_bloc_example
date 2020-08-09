import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutterrxdart/src/home/data_source/movie_data_source.dart';
import 'package:flutterrxdart/src/home/model/movie_popular_entity.dart';
import 'package:flutterrxdart/src/network/network_error.dart';
import 'package:meta/meta.dart';

part 'popular_event.dart';

part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  //nanti coba dihapus bay parameter <> initial nya
  PopularBloc() : super(PopularState.initial<MoviePopularEntity>());

  @override
  Stream<PopularState> mapEventToState(
    PopularEvent event,
  ) async* {
    switch (event.status) {
      case PopularEventStatus.DEFAULT:
        print("PopularBloc - current event = $event ");
        yield PopularState.onLoading<MoviePopularEntity>();

        try {
          final populars = await MovieDataSource.instance.loadPopularMovies();
          print("PopularBloc - populars data : $populars ");

          if (populars.containsKey("results")) {
//            List<MoviePopularResult> results = [];
//            for (var resultsJson in populars["results"]) {
//              try {
//                final result = MoviePopularResult().fromJson(resultsJson);
//                results.add(result);
//              } catch (e) {
//                print("PopularBloc - error process on $e");
//              }
//            }
            final result = MoviePopularEntity().fromJson(populars);
            yield PopularState.onSuccess<MoviePopularEntity>(result);
          } else {
            yield PopularState.onError<MoviePopularEntity>(
                populars["status_message"]);
          }
        } on NetworkError {
          yield PopularState.onError<MoviePopularEntity>("Network Error");
        }
        break;

      case PopularEventStatus.DETAIL:
        break;
    }

//    if (event is PopularEventIdle) {
//      print("PopularBloc - PopularEventIdle true");
//      yield PopularFetchLoadingState();
//
//      //result is json
//      final result = await MovieDataSource.loadPopularMovies();
//
//      if (result != null) {
//        print("PopularBloc - result not null , result : $result");
//        final populars = MoviePopularEntity().fromJson(result);
//        print("PopularBloc : populars data = $populars ");
//        yield PopularFetchedState(populars);
//      } else {
//        print("PopularBloc - result null , result : $result");
//        yield PopularFetchFailedState();
//      }
//    } else {
//      print("PopularBloc - error event ");
//      yield PopularFetchFailedState();
//    }
  }
}
