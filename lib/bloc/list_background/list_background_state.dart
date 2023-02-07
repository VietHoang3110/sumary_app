part of 'list_background_bloc.dart';


abstract class ListBackgroundState extends Equatable {

  @override
  List<Object?> get props => [];

  ListBackgroundState();
}
class InitGetListBackgroundState extends ListBackgroundState {}

class UpdateGetListBackgroundState extends ListBackgroundState{

  List<DataBackground> data;

  UpdateGetListBackgroundState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingListBackgroundState extends ListBackgroundState {
}


class ErrorGetListBackgroundState extends ListBackgroundState{
  final String msg;


  ErrorGetListBackgroundState(this.msg);

  @override
  List<Object> get props => [msg];
}