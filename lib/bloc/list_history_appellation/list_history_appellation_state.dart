part of 'list_history_appellation_bloc.dart';


abstract class ListHistoryAppellationState extends Equatable {

  @override
  List<Object?> get props => [];

  ListHistoryAppellationState();
}
class InitGetListHistoryRechargeState extends ListHistoryAppellationState {}

class UpdateGetListHistoryAppellationState extends ListHistoryAppellationState{
  List<DataHistoryAppellation> data;

  UpdateGetListHistoryAppellationState(this.data);

  @override
  List<Object> get props => [data];
}

class LoadingGetListHistoryAppellationState extends ListHistoryAppellationState {
}


class ErrorGetListHistoryAppellationState extends ListHistoryAppellationState{
  final String msg;


  ErrorGetListHistoryAppellationState(this.msg);

  @override
  List<Object> get props => [msg];
}