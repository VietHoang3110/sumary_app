part of 'list_history_advise_bloc.dart';

abstract class ListHistoryAdviseEvent extends Equatable {

  @override
  List<Object?> get props => [];

  ListHistoryAdviseEvent();
}


class InitGetListHistoryAdviseEvent extends ListHistoryAdviseEvent {
  int page;
  int pageSize;


  InitGetListHistoryAdviseEvent(this.page, this.pageSize);

  @override
  List<Object?> get props => [page,pageSize];
}
