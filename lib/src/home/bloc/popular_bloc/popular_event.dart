part of 'popular_bloc.dart';

class PopularEvent {
  PopularEventStatus status;
  String popularId;

  PopularEvent({@required this.status, this.popularId});

  static PopularEvent onDefault() =>
      PopularEvent(status: PopularEventStatus.DEFAULT, popularId: '');

  static PopularEvent onDetail(String popularId) =>
      PopularEvent(status: PopularEventStatus.DETAIL, popularId: popularId);
}

enum PopularEventStatus {
  DEFAULT,
  DETAIL
}