part of 'list_notification_bloc.dart';


abstract class ListNotificationState extends Equatable {

  @override
  List<Object?> get props => [];

  ListNotificationState();
}
class InitGetListNotificationState extends ListNotificationState {}

class UpdateGetListNotificationState extends ListNotificationState{

 List<DataNotification> dataNotification;


 UpdateGetListNotificationState(this.dataNotification);

  @override
  List<Object> get props => [dataNotification];
}

class LoadingListNotificationState extends ListNotificationState {
}


class ErrorGetListNotificationState extends ListNotificationState{
  final String msg;


  ErrorGetListNotificationState(this.msg);

  @override
  List<Object> get props => [msg];
}
class ReadNotifiState extends ListNotificationState{

}