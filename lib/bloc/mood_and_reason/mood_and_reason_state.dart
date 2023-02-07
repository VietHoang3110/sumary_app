part of 'mood_and_reason_bloc.dart';


abstract class MoodAndReasonState extends Equatable {

  @override
  List<Object?> get props => [];

  MoodAndReasonState();
}
class InitMoodAndReasonState extends MoodAndReasonState {}

class UpdateMoodAndReasonState extends MoodAndReasonState{

  List<List<DataMoodAndReason>> dataMoodAndReason;


  UpdateMoodAndReasonState(this.dataMoodAndReason);

  @override
  List<Object> get props => [dataMoodAndReason];

}

class LoadingMoodAndReasonState extends MoodAndReasonState {
}


class ErrorMoodAndReasonState extends MoodAndReasonState{
  final String msg;


  ErrorMoodAndReasonState(this.msg);

  @override
  List<Object> get props => [msg];
}