
part of 'list_book_done_bloc.dart';


abstract class ListBookDoneState extends Equatable {

  @override
  List<Object?> get props => [];

  ListBookDoneState();
}
class InitGetListBookDoneState extends ListBookDoneState {}

class UpdateGetListBookDoneState extends ListBookDoneState{
  List<ListProductDone> data;

  UpdateGetListBookDoneState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingListBookDoneState extends ListBookDoneState {
}


class ErrorGetListBookDoneState extends ListBookDoneState{
  final String msg;


  ErrorGetListBookDoneState(this.msg);

  @override
  List<Object> get props => [msg];
}