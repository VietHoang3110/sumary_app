part of 'list_history_affiliate_bloc.dart';

abstract class ListHistoryAffiliateEvent extends Equatable {

  @override
  List<Object?> get props => [];

  ListHistoryAffiliateEvent();
}


class InitGetListHistoryAffiliateEvent extends ListHistoryAffiliateEvent {
  String type;
  int page;
  int pageSize;


  InitGetListHistoryAffiliateEvent(this.type,this.page, this.pageSize);

  @override
  List<Object?> get props => [type,page,pageSize];
}
