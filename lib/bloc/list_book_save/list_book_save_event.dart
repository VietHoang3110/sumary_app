part of 'list_book_save_bloc.dart';

abstract class ListBookSaveEvent extends Equatable {

  @override
  List<Object?> get props => [];

  ListBookSaveEvent();
}


class InitGetListBookSaveEvent extends ListBookSaveEvent {
  String keyword;
  int page;
  int pageSize;


  InitGetListBookSaveEvent(
      this.keyword,
      this.page,
      this.pageSize
      );

  @override
  List<Object?> get props => [];
}


