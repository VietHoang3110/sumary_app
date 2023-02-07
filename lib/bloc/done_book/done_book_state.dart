part of 'done_book_bloc.dart';


abstract class DoneBookState extends Equatable {

  @override
  List<Object?> get props => [];

  DoneBookState();
}
class InProgressDoneBookState extends DoneBookState {}


class FailureDoneBookState extends DoneBookState {
  final String message;
  FailureDoneBookState({required this.message});
  @override
  List<Object?> get props => [message];
}


class SuccessDoneBookState extends DoneBookState{
  final String message;
  SuccessDoneBookState({required this.message});
  @override
  List<Object?> get props => [message];
}