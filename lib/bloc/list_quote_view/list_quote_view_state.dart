part of 'list_quote_view_bloc.dart';


abstract class ListQuoteViewState extends Equatable {

  @override
  List<Object?> get props => [];

  ListQuoteViewState();
}
class InitGetListQuoteViewState extends ListQuoteViewState {}

class UpdateListQuoteViewState extends ListQuoteViewState{
  List<DataQuote>? data;

  UpdateListQuoteViewState(this.data);
  @override
  List<Object> get props => [];
}

class LoadingGetListQuoteViewState extends ListQuoteViewState {
}


class ErrorGetListQuoteViewState extends ListQuoteViewState{
  final String msg;


  ErrorGetListQuoteViewState(this.msg);

  @override
  List<Object> get props => [msg];
}