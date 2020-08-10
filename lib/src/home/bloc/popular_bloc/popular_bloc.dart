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
    print("PopularBloc - current event = $event ");
    switch (event.status) {
      case PopularEventStatus.DEFAULT:
        yield PopularState.onLoading<MoviePopularEntity>();
        try {
          final populars = await MovieDataSource.instance.loadMovies("popular");
          print("PopularBloc - populars data : $populars ");

          if (populars["success"] == false) {
            yield PopularState.onError<MoviePopularEntity>(
                populars["status_message"]);
          } else {
            yield PopularState.onSuccess<MoviePopularEntity>(
                MoviePopularEntity().fromJson(populars));
          }
        } on NetworkError {
          yield PopularState.onError<MoviePopularEntity>("Network Error");
        }
        break;

      case PopularEventStatus.DETAIL:
        break;
    }
  }
}
