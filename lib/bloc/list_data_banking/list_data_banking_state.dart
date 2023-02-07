part of 'list_data_banking_bloc.dart';


abstract class ListDataBankingState extends Equatable {

  @override
  List<Object?> get props => [];

  const ListDataBankingState();
}
class InitGetListDataBankingState extends ListDataBankingState {}

class UpdateGetListDataBankingState extends ListDataBankingState{
  List<DataBanking> data;

  UpdateGetListDataBankingState(this.data);

  @override
  List<Object> get props => [];
}

class LoadingGetListDataBankingState extends ListDataBankingState {
}


class ErrorGetListDataBankingState extends ListDataBankingState{
  final String msg;


  const ErrorGetListDataBankingState(this.msg);

  @override
  List<Object> get props => [msg];
}