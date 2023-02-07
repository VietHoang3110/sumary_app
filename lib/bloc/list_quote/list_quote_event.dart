part of 'list_quote_bloc.dart';

abstract class ListQuoteEvent extends Equatable {

  @override
  List<Object?> get props => [];

  ListQuoteEvent();
}


class InitGetListQuoteEvent extends ListQuoteEvent {
  String id;

  InitGetListQuoteEvent(this.id);

  @override
  List<Object?> get props => [];
}


