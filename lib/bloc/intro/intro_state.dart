part of 'intro_bloc.dart';


abstract class IntroState extends Equatable {

  @override
  List<Object?> get props => [];

  IntroState();
}
class InitIntroState extends IntroState {}

class UpdateIntroState extends IntroState{

  List<IntroduceData> data;
  UpdateIntroState(this.data);

  @override
  List<Object> get props => [data];

}

class LoadingIntroState extends IntroState {
}


class ErrorIntroState extends IntroState{
  final String msg;


  ErrorIntroState(this.msg);

  @override
  List<Object> get props => [msg];
}