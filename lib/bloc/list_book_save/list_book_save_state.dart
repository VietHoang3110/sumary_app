part of 'list_book_save_bloc.dart';


abstract class ListBookSaveState extends Equatable {

  @override
  List<Object?> get props => [];

  ListBookSaveState();
}
class InitGetListBookSaveState extends ListBookSaveState {}

class UpdateGetListBookSaveState extends ListBookSaveState{
  List<DataProductSaved> listBookSave;


  UpdateGetListBookSaveState(this.listBookSave);
  @override
  List<Object> get props => [listBookSave];
}

class LoadingListBookSaveState extends ListBookSaveState {
}


class ErrorGetListBookSaveState extends ListBookSaveState{
  final String msg;


  ErrorGetListBookSaveState(this.msg);

  @override
  List<Object> get props => [msg];
}