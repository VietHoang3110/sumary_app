part of 'save_quote_bloc.dart';

abstract class SaveQuoteEvent extends Equatable {

  @override
  List<Object?> get props => [];

  SaveQuoteEvent();
}



class SaveQuoteSubmitted extends SaveQuoteEvent {
  SaveQuoteSubmitted({
    required this.id,
  });

  final String id;

  @override
  List<Object> get props => [id];
}
