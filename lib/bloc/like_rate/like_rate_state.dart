part of 'like_rate_bloc.dart';


abstract class LikeRateState extends Equatable {

  @override
  List<Object?> get props => [];

  LikeRateState();
}
class InProgressLikeRateState extends LikeRateState {
}


class FailureLikeRateState extends LikeRateState {
  final String message;
  FailureLikeRateState({required this.message});
  @override
  List<Object?> get props => [message];
}


class SuccessLikeRateState extends LikeRateState{
  final String message;
  SuccessLikeRateState({required this.message});
  @override
  List<Object?> get props => [message];
}