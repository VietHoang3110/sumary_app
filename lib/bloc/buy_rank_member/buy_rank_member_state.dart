part of 'buy_rank_member_bloc.dart';


abstract class BuyRankMemberState extends Equatable {

  @override
  List<Object?> get props => [];

  BuyRankMemberState();
}
class InProgressBuyRankMemberState extends BuyRankMemberState {}


class FailureBuyRankMemberState extends BuyRankMemberState {
  final String message;
  FailureBuyRankMemberState({required this.message});
  @override
  List<Object?> get props => [message];
}


class SuccessBuyRankMemberState extends BuyRankMemberState{
  final String message;
  SuccessBuyRankMemberState({required this.message});
  @override
  List<Object?> get props => [message];
}