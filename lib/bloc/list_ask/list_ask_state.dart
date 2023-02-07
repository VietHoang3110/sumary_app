part of 'list_ask_bloc.dart';


abstract class ListAskState extends Equatable {

  @override
  List<Object?> get props => [];

  ListAskState();
}
class InitGetListAskState extends ListAskState {}

class UpdateGetListAskState extends ListAskState{
  ListAsk data;

  UpdateGetListAskState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingListAskState extends ListAskState {
}


class ErrorGetListAskState extends ListAskState{
  final String msg;


  ErrorGetListAskState(this.msg);

  @override
  List<Object> get props => [msg];
}