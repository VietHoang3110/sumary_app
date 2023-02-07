part of 'list_history_wallet_bloc.dart';


abstract class ListHistoryWalletState extends Equatable {

  @override
  List<Object?> get props => [];

   ListHistoryWalletState();
}
class InitGetListHistoryWalletState extends ListHistoryWalletState {}

class UpdateGetListHistoryWalletState extends ListHistoryWalletState{
  List<DataHistoryWallet> dataHistoryWallet;

  UpdateGetListHistoryWalletState(this.dataHistoryWallet);

  @override
  List<Object> get props => [dataHistoryWallet];
}

class LoadingGetListHistoryWalletState extends ListHistoryWalletState {
}


class ErrorGetListHistoryWalletState extends ListHistoryWalletState{
  final String msg;


   ErrorGetListHistoryWalletState(this.msg);

  @override
  List<Object> get props => [msg];
}