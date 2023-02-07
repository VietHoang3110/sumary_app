part of 'list_history_recharge_bloc.dart';

abstract class ListHistoryRechargeEvent extends Equatable {

  @override
  List<Object?> get props => [];

  ListHistoryRechargeEvent();
}


class InitGetListHistoryRechargeEvent extends ListHistoryRechargeEvent {
  String type;
  int page;
  int pageSize;


  InitGetListHistoryRechargeEvent(this.type,this.page, this.pageSize);

  @override
  List<Object?> get props => [];
}
