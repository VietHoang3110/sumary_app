part of 'list_history_affiliate_bloc.dart';


abstract class ListHistoryAffiliateState extends Equatable {

  @override
  List<Object?> get props => [];

  ListHistoryAffiliateState();
}
class InitGetListHistoryAffiliateState extends ListHistoryAffiliateState {}

class UpdateGetListHistoryAffiliateState extends ListHistoryAffiliateState{
  List<DataHistoryAffiliate> data;

  UpdateGetListHistoryAffiliateState(this.data);

  @override
  List<Object> get props => [data];
}

class LoadingGetListHistoryAffiliateState extends ListHistoryAffiliateState {
}


class ErrorGetListHistoryAffiliateState extends ListHistoryAffiliateState{
  final String msg;


  ErrorGetListHistoryAffiliateState(this.msg);

  @override
  List<Object> get props => [msg];
}