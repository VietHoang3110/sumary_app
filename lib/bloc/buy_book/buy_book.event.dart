part of 'buy_book_bloc.dart';

abstract class BuyBookEvent extends Equatable {

  @override
  List<Object?> get props => [];

  BuyBookEvent();
}



class BuyBookSubmitted extends BuyBookEvent {
  BuyBookSubmitted({
    required this.id,
    required this.payment_type,
  });

  final String id;
  final String payment_type;

  @override
  List<Object> get props => [payment_type];
}
