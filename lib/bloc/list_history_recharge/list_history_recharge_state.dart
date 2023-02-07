part of 'list_history_recharge_bloc.dart';


abstract class ListHistoryRechargeState extends Equatable {

  @override
  List<Object?> get props => [];

  ListHistoryRechargeState();
}
class InitGetListHistoryRechargeState extends ListHistoryRechargeState {}

class UpdateGetListHistoryRechargeState extends ListHistoryRechargeState{
  List<DataHistoryRecharge> data;

  UpdateGetListHistoryRechargeState(this.data);

  @override
  List<Object> get props => [data];
}

class LoadingGetListHistoryRechargeState extends ListHistoryRechargeState {
}


class ErrorGetListHistoryRechargeState extends ListHistoryRechargeState{
  final String msg;


  ErrorGetListHistoryRechargeState(this.msg);

  @override
  List<Object> get props => [msg];
}