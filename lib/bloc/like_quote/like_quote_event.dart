part of 'like_quote_bloc.dart';

abstract class LikeQuoteEvent extends Equatable {

  @override
  List<Object?> get props => [];

  LikeQuoteEvent();
}



class LikeQuoteSubmitted extends LikeQuoteEvent {
  LikeQuoteSubmitted({
    required this.id,
  });

  final String id;

  @override
  List<Object> get props => [id];
}
