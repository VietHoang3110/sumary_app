part of 'done_book_bloc.dart';

abstract class DoneBookEvent extends Equatable {

  @override
  List<Object?> get props => [];

  DoneBookEvent();
}



class DoneBookSubmitted extends DoneBookEvent {
  DoneBookSubmitted({
    required this.id,
  });

  final String id;

  @override
  List<Object> get props => [id];
}
