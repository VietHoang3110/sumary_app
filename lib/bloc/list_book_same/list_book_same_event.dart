part of 'list_book_same_bloc.dart';

abstract class ListBookSameEvent extends Equatable {

  @override
  List<Object?> get props => [];

  ListBookSameEvent();
}


class InitGetListBookSameEvent extends ListBookSameEvent {
  String id;
  int page;
  int pageSize;


  InitGetListBookSameEvent(
      this.id,
      this.page,
      this.pageSize
      );

  @override
  List<Object?> get props => [id,page,pageSize];
}


