part of 'filter_product_2_bloc.dart';

abstract class FilterProduct2Event extends Equatable {

  @override
  List<Object?> get props => [];

  FilterProduct2Event();
}


class InitFilterProduct2Event extends FilterProduct2Event {

  InitFilterProduct2Event();

  @override
  List<Object?> get props => [];
}


class FilterProduct2Submitted extends FilterProduct2Event {

  final List<String> data;
  String? id;

  FilterProduct2Submitted(this.data, this.id);
}
