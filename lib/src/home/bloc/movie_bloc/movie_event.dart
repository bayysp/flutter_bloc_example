part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent {}

class MovieEventFetchPopular extends MovieEvent {}

class MovieEventFetchTopRated extends MovieEvent {}

class MovieEventFetchNowPlaying extends MovieEvent {}

class MovieEventFetchLatest extends MovieEvent {}

class MovieEventFetchUpcoming extends MovieEvent {}

