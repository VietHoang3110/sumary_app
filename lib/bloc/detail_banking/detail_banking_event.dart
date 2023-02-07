part of 'detail_banking_bloc.dart';

abstract class DetailDataBankingEvent extends Equatable {

  @override
  List<Object?> get props => [];

  DetailDataBankingEvent();
}


class InitDetailDataBankingEvent extends DetailDataBankingEvent {
  String id;

  InitDetailDataBankingEvent(this.id);

  @override
  List<Object?> get props => [id];
}
