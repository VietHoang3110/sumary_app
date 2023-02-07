part of 'save_quote_bloc.dart';


abstract class SaveQuoteState extends Equatable {

  @override
  List<Object?> get props => [];

  SaveQuoteState();
}
class InProgressSaveQuoteState extends SaveQuoteState {
}


class FailureSaveQuoteState extends SaveQuoteState {
  final String message;
  FailureSaveQuoteState({required this.message});
  @override
  List<Object?> get props => [message];
}


class SuccessSaveQuoteState extends SaveQuoteState{
  final String message;
  SuccessSaveQuoteState({required this.message});
  @override
  List<Object?> get props => [message];
}