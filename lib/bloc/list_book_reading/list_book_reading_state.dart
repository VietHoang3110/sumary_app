
part of 'list_book_reading_bloc.dart';


abstract class ListBookReadingState extends Equatable {

  @override
  List<Object?> get props => [];

  ListBookReadingState();
}
class InitGetListBookReadingState extends ListBookReadingState {}

class UpdateGetListBookReadingState extends ListBookReadingState{
  // ListProductBought data;
  List<DataProductReading> data;

  UpdateGetListBookReadingState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingListBookReadingState extends ListBookReadingState {
}


class ErrorGetListBookReadingState extends ListBookReadingState{
  final String msg;


  ErrorGetListBookReadingState(this.msg);

  @override
  List<Object> get props => [msg];
}