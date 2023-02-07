part of 'avg_rate_bloc.dart';


abstract class AvgRateState extends Equatable {

  @override
  List<Object?> get props => [];

  AvgRateState();
}
class InitAvgRateState extends AvgRateState {}

class UpdateAvgRateState extends AvgRateState{
  DataRate data;

  UpdateAvgRateState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingAvgRateState extends AvgRateState {
}


class ErrorAvgRateState extends AvgRateState{
  final String msg;


  ErrorAvgRateState(this.msg);

  @override
  List<Object> get props => [msg];
}