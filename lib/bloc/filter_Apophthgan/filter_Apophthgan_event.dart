part of 'filter_Apophthgan_bloc.dart';

abstract class FilterApophthganEvent extends Equatable {

  @override
  List<Object?> get props => [];

  FilterApophthganEvent();
}


class InitFilterApophthganEvent extends FilterApophthganEvent {
  final String mood;
  final String reason;

  InitFilterApophthganEvent(this.mood, this.reason);

  @override
  List<Object?> get props => [mood,reason];
}
