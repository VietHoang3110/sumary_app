part of 'unsave_book_bloc.dart';


abstract class UnsaveBookState extends Equatable {

  @override
  List<Object?> get props => [];

  UnsaveBookState();
}
class InProgressUnsaveBookState extends UnsaveBookState {}


class FailureUnsaveBookState extends UnsaveBookState {
  final String message;
  FailureUnsaveBookState({required this.message});
  @override
  List<Object?> get props => [message];
}


class SuccessUnsaveBookState extends UnsaveBookState{
  final String message;
  SuccessUnsaveBookState({required this.message});
  @override
  List<Object?> get props => [message];
}