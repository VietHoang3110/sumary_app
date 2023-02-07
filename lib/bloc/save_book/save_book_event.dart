part of 'save_book_bloc.dart';

abstract class SaveBookEvent extends Equatable {

  @override
  List<Object?> get props => [];

  SaveBookEvent();
}



class SaveBookSubmitted extends SaveBookEvent {
  SaveBookSubmitted({
    required this.id,
    required this.data
  });

  final String id;
  final DataDetailProduct data;

  @override
  List<Object> get props => [id, data];
}
