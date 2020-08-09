part of 'popular_bloc.dart';

class PopularState<T> {
  PopularStateStatus status;
  T data;
  String errorMessage;

  PopularState({@required this.status, this.data, this.errorMessage});

  static PopularState initial<T>() =>
      PopularState(status: PopularStateStatus.INITIAL);

  static PopularState onSuccess<T>(T data) =>
      PopularState(status: PopularStateStatus.SUCCESS, data: data);

  static PopularState onError<T>(String errorMessage) => PopularState(
      status: PopularStateStatus.ERROR, errorMessage: errorMessage);

  static PopularState onLoading<T>() =>
      PopularState(status: PopularStateStatus.LOADING);
}

enum PopularStateStatus { INITIAL, LOADING, SUCCESS, ERROR }
