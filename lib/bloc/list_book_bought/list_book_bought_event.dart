part of 'list_book_bought_bloc.dart';

abstract class ListBookboughtEvent extends Equatable {

  @override
  List<Object?> get props => [];

  ListBookboughtEvent();
}


class InitGetListBookBoughtEvent extends ListBookboughtEvent {
  String keyword;
  int page;
  int pageSize;


  InitGetListBookBoughtEvent(
      this.keyword,
      this.page,
      this.pageSize
      );

  @override
  List<Object?> get props => [];
}


