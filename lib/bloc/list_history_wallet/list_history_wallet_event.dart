part of 'list_history_wallet_bloc.dart';

abstract class ListHistoryWalletEvent extends Equatable {

  @override
  List<Object?> get props => [];

  ListHistoryWalletEvent();
}


class InitGetListHistoryWalletEvent extends ListHistoryWalletEvent {
  String type;
  int page;
  int pageSize;


  InitGetListHistoryWalletEvent(this.type,this.page, this.pageSize);

  @override
  List<Object?> get props => [];
}
