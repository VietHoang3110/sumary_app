part of 'list_quote_bloc.dart';


abstract class ListQuoteState extends Equatable {

  @override
  List<Object?> get props => [];

  ListQuoteState();
}
class InitGetListQuoteState extends ListQuoteState {}

class UpdateListQuoteState extends ListQuoteState{
  List<DataQuote>? data;

  UpdateListQuoteState(this.data);
  @override
  List<Object> get props => [];
}

class LoadingGetListQuoteState extends ListQuoteState {
}


class ErrorGetListQuoteState extends ListQuoteState{
  final String msg;


  ErrorGetListQuoteState(this.msg);

  @override
  List<Object> get props => [msg];
}