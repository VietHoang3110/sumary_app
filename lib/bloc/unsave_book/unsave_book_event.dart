part of 'unsave_book_bloc.dart';

abstract class UnsaveBookEvent extends Equatable {

  @override
  List<Object?> get props => [];

  UnsaveBookEvent();
}



class UnsaveBookSubmitted extends UnsaveBookEvent {
  UnsaveBookSubmitted({
    required this.id,
    required this.data
  });

  final String id;
  final DataDetailProduct data;

  @override
  List<Object> get props => [id];
}
