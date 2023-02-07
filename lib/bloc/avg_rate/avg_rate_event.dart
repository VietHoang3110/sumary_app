part of 'avg_rate_bloc.dart';

abstract class AvgRateEvent extends Equatable {

  @override
  List<Object?> get props => [];

  AvgRateEvent();
}


class InitAvgRateEvent extends AvgRateEvent {
  String id;

  InitAvgRateEvent(this.id);

  @override
  List<Object?> get props => [id];
}


