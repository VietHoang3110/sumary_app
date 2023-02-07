part of 'check_chapter_done_bloc.dart';

abstract class CheckChapterDoneEvent extends Equatable {

  @override
  List<Object?> get props => [];

  CheckChapterDoneEvent();
}



class DoneChapterSubmitted extends CheckChapterDoneEvent {
  DoneChapterSubmitted({
    required this.id,
    required this.chapter,
  });

  final String id;
  final int chapter;

  @override
  List<Object> get props => [id, chapter];
}
