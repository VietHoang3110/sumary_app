
part of 'unread_notifi_bloc.dart';

abstract class UnreadNotifiState extends Equatable {

  @override
  List<Object?> get props => [];

  UnreadNotifiState();
}
class InitUnreadNotifiState extends UnreadNotifiState {}

class UpdateUnreadNotifiState extends UnreadNotifiState{
  int data;


  UpdateUnreadNotifiState(this.data);

  @override
  List<Object> get props => [];

}

class LoadingUnreadNotifiState extends UnreadNotifiState {
}


class ErrorUnreadNotifiState extends UnreadNotifiState{
  final String msg;


  ErrorUnreadNotifiState(this.msg);

  @override
  List<Object> get props => [msg];
}