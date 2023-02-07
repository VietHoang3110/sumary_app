part of 'my_armorial_bloc.dart';


abstract class MyArmorialState extends Equatable {

  @override
  List<Object?> get props => [];

  MyArmorialState();
}
class InitGetMyArmorialState extends MyArmorialState {}

class UpdateGetMyArmorialState extends MyArmorialState{
  YourArmorial data;

  UpdateGetMyArmorialState(this.data);
  @override
  List<Object> get props => [];
}

class LoadingMyArmorialState extends MyArmorialState {
}


class ErrorGetMyArmorialState extends MyArmorialState{
  final String msg;


  ErrorGetMyArmorialState(this.msg);

  @override
  List<Object> get props => [msg];
}