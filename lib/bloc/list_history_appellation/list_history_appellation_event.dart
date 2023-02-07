part of 'list_history_appellation_bloc.dart';

abstract class ListHistoryAppellationEvent extends Equatable {

  @override
  List<Object?> get props => [];

  ListHistoryAppellationEvent();
}


class InitGetListHistoryAppellationEvent extends ListHistoryAppellationEvent {
  String type;
  int page;
  int pageSize;


  InitGetListHistoryAppellationEvent(this.type,this.page, this.pageSize);

  @override
  List<Object?> get props => [];
}
