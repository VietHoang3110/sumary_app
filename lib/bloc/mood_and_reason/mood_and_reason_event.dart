part of 'mood_and_reason_bloc.dart';

abstract class MoodAndReasonEvent extends Equatable {

  @override
  List<Object?> get props => [];

  MoodAndReasonEvent();
}


class InitMoodAndReasonEvent extends MoodAndReasonEvent {

  InitMoodAndReasonEvent();

  @override
  List<Object?> get props => [];
}
