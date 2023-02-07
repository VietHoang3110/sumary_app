part of 'like_quote_bloc.dart';


abstract class LikeQuoteState extends Equatable {

  @override
  List<Object?> get props => [];

  LikeQuoteState();
}
class InProgressLikeQuoteState extends LikeQuoteState {
}


class FailureLikeQuoteState extends LikeQuoteState {
  final String message;
  FailureLikeQuoteState({required this.message});
  @override
  List<Object?> get props => [message];
}


class SuccessLikeQuoteState extends LikeQuoteState{
  final String message;
  SuccessLikeQuoteState({required this.message});
  @override
  List<Object?> get props => [message];
}