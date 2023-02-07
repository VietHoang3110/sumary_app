part of 'filter_product_bloc.dart';

abstract class FilterProductEvent extends Equatable {

  @override
  List<Object?> get props => [];

  FilterProductEvent();
}


class InitFilterProductEvent extends FilterProductEvent {

  InitFilterProductEvent();

  @override
  List<Object?> get props => [];
}


class FilterProductSubmitted extends FilterProductEvent {

  final List<String> data;
  String? id;

  FilterProductSubmitted(this.data, this.id);
}
