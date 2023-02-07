part of 'like_rate_bloc.dart';

abstract class LikeRateEvent extends Equatable {

  @override
  List<Object?> get props => [];

  LikeRateEvent();
}



class LikeRateSubmitted extends LikeRateEvent {
  LikeRateSubmitted({
    required this.id,
  });

  final String id;

  @override
  List<Object> get props => [id];
}
