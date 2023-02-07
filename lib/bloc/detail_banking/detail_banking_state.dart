part of 'detail_banking_bloc.dart';


abstract class DetailDataBankingState extends Equatable {

  @override
  List<Object?> get props => [];

  DetailDataBankingState();
}
class InitGetDetailDataBankingState extends DetailDataBankingState {}

class UpdateGetDetailDataBankingState extends DetailDataBankingState{

  DetailBanking data;
  UpdateGetDetailDataBankingState(this.data);

  @override
  List<Object> get props => [data];

}

class LoadingGetDetailDataBankingState extends DetailDataBankingState {
}


class ErrorGetDetailDataBankingState extends DetailDataBankingState{
  final String msg;


  ErrorGetDetailDataBankingState(this.msg);

  @override
  List<Object> get props => [msg];
}