part of 'list_quote_view_bloc.dart';

abstract class ListQuoteViewEvent extends Equatable {

  @override
  List<Object?> get props => [];

  ListQuoteViewEvent();
}


class InitGetListQuoteViewEvent extends ListQuoteViewEvent {
  String id;

  InitGetListQuoteViewEvent(this.id);

  @override
  List<Object?> get props => [];
}


