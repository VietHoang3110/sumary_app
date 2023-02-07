part of 'list_book_top_view_bloc.dart';


abstract class ListBookTopViewState extends Equatable {

  @override
  List<Object?> get props => [];

  ListBookTopViewState();
}
class InitGetListBookTopViewState extends ListBookTopViewState {}

class UpdateGetListBookTopViewState extends ListBookTopViewState{

  List<ListTopView> data;

  UpdateGetListBookTopViewState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingListBookTopViewState extends ListBookTopViewState {
}


class ErrorGetListBookTopViewState extends ListBookTopViewState{
  final String msg;


  ErrorGetListBookTopViewState(this.msg);

  @override
  List<Object> get props => [msg];
}