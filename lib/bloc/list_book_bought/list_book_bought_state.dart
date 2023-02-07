part of 'list_book_bought_bloc.dart';


abstract class ListBookBoughtState extends Equatable {

  @override
  List<Object?> get props => [];

  ListBookBoughtState();
}
class InitGetListBookBoughtState extends ListBookBoughtState {}

class UpdateGetListBookBoughtState extends ListBookBoughtState{
  // ListProductBought data;
  List<DataProductBought> listBookBought;

  UpdateGetListBookBoughtState(this.listBookBought);
  @override
  List<Object> get props => [listBookBought];
}

class LoadingListBookboughtState extends ListBookBoughtState {
}


class ErrorGetListBookBoughtState extends ListBookBoughtState{
  final String msg;


  ErrorGetListBookBoughtState(this.msg);

  @override
  List<Object> get props => [msg];
}