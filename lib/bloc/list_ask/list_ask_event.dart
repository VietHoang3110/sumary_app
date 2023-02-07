part of 'list_ask_bloc.dart';

abstract class ListAskEvent extends Equatable {

  @override
  List<Object?> get props => [];

  ListAskEvent();
}


class InitGetListAskEvent extends ListAskEvent {
  String id;
  int page;
  int pageSize;


  InitGetListAskEvent(
      this.id,
      this.page,
      this.pageSize
      );

  @override
  List<Object?> get props => [];
}


