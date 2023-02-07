part of 'check_chapter_done_bloc.dart';


abstract class CheckChapterDoneState extends Equatable {

  @override
  List<Object?> get props => [];

  CheckChapterDoneState();
}
class InProgressCheckChapterDoneState extends CheckChapterDoneState {}


class FailureCheckChapterDoneState extends CheckChapterDoneState {
  final String message;
  FailureCheckChapterDoneState({required this.message});
  @override
  List<Object?> get props => [message];
}


class SuccessCheckChapterDoneState extends CheckChapterDoneState{
  final String message;
  SuccessCheckChapterDoneState({required this.message});
  @override
  List<Object?> get props => [message];
}