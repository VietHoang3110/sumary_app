part of 'read_noti_bloc.dart';


abstract class ReadNotiState extends Equatable {

  @override
  List<Object?> get props => [];

  ReadNotiState();
}
class InProgressReadNotiState extends ReadNotiState {}


class FailureReadNotiState extends ReadNotiState {
  final String message;
  FailureReadNotiState({required this.message});
  @override
  List<Object?> get props => [message];
}


class SuccessReadNotiState extends ReadNotiState{
  final String message;
  SuccessReadNotiState({required this.message});
  @override
  List<Object?> get props => [message];
}