part of 'save_book_bloc.dart';


abstract class SaveBookState extends Equatable {

  @override
  List<Object?> get props => [];

  SaveBookState();
}
class InProgressSaveBookState extends SaveBookState {
}


class FailureSaveBookState extends SaveBookState {
  final String message;
  FailureSaveBookState({required this.message});
  @override
  List<Object?> get props => [message];
}


class SuccessSaveBookState extends SaveBookState{
  final String message;
  SuccessSaveBookState({required this.message});
  @override
  List<Object?> get props => [message];
}