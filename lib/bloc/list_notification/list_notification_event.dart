part of 'list_notification_bloc.dart';

abstract class GetListNotificationEvent extends Equatable {

  @override
  List<Object?> get props => [];

  GetListNotificationEvent();
}

class ReadNotiEvent extends GetListNotificationEvent{
  String id;

  ReadNotiEvent(this.id);
  @override
  List<Object?> get props => [id];
}

class InitGetListNotificationEvent extends GetListNotificationEvent {
  int page;
  int pageSize;
  bool? isLoadMore;


  InitGetListNotificationEvent(this.page, this.pageSize,{this.isLoadMore});

  @override
  List<Object?> get props => [];
}
