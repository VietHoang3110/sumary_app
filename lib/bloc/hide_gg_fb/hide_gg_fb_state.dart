part of 'hide_gg_fb_bloc.dart';


abstract class HideGGFBState extends Equatable {

  @override
  List<Object?> get props => [];

  HideGGFBState();
}
class InitGetHideGGFBState extends HideGGFBState {}

class UpdateGetHideGGFBState extends HideGGFBState{
  HideGGFB data;

  UpdateGetHideGGFBState(this.data);
  @override
  List<Object> get props => [];
}

class LoadingHideGGFBState extends HideGGFBState {
}


class ErrorGetHideGGFBState extends HideGGFBState{
  final String msg;


  ErrorGetHideGGFBState(this.msg);

  @override
  List<Object> get props => [msg];
}