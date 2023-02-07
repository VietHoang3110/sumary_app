part of 'list_book_same_bloc.dart';


abstract class ListBookSameState extends Equatable {

  @override
  List<Object?> get props => [];

  ListBookSameState();
}
class InitGetListBookSameState extends ListBookSameState {}

class UpdateGetListBookSameState extends ListBookSameState{

  List<DataProductSame> data;

  UpdateGetListBookSameState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingListBookSameState extends ListBookSameState {
}


class ErrorGetListBookSameState extends ListBookSameState{
  final String msg;


  ErrorGetListBookSameState(this.msg);

  @override
  List<Object> get props => [msg];
}