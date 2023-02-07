part of 'buy_book_bloc.dart';


abstract class BuyBookState extends Equatable {

  @override
  List<Object?> get props => [];

  BuyBookState();
}
class InProgressBuyBookState extends BuyBookState {}


class FailureBuyBookState extends BuyBookState {
  final String message;
  FailureBuyBookState({required this.message});
  @override
  List<Object?> get props => [message];
}


class SuccessBuyBookState extends BuyBookState{
  final String message;
  SuccessBuyBookState({required this.message});
  @override
  List<Object?> get props => [message];
}