part of 'list_history_advise_bloc.dart';


abstract class ListHistoryAdviseState extends Equatable {

  @override
  List<Object?> get props => [];

  ListHistoryAdviseState();
}
class InitGetListHistoryAdviseState extends ListHistoryAdviseState {}

class UpdateGetListHistoryAdviseState extends ListHistoryAdviseState{
  List<DataHistoryAdvise> data;

  UpdateGetListHistoryAdviseState(this.data);

  @override
  List<Object> get props => [data];
}

class LoadingGetListHistoryAdviseState extends ListHistoryAdviseState {
}


class ErrorGetListHistoryAdviseState extends ListHistoryAdviseState{
  final String msg;


  ErrorGetListHistoryAdviseState(this.msg);

  @override
  List<Object> get props => [msg];
}