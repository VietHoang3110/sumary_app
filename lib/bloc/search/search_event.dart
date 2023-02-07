part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {

  @override
  List<Object?> get props => [];

  SearchEvent();
}

class InitDetailProductEvent extends SearchEvent {
  int page;
  int pageSize;
  String name;
  String translator;

  InitDetailProductEvent(this.page, this.pageSize, this.name, this.translator);

  @override
  List<Object?> get props => [page, pageSize, name, translator];
}
