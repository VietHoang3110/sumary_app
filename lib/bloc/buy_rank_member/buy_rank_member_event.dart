part of 'buy_rank_member_bloc.dart';

abstract class BuyRankMemberEvent extends Equatable {

  @override
  List<Object?> get props => [];

  BuyRankMemberEvent();
}



class BuyRankMemberSubmitted extends BuyRankMemberEvent {
  BuyRankMemberSubmitted({
    required this.mid,
  });

  final String mid;

  @override
  List<Object> get props => [mid];
}
