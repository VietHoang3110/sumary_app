part of 'filter_product_1_bloc.dart';

abstract class FilterProduct1Event extends Equatable {

  @override
  List<Object?> get props => [];

  FilterProduct1Event();
}


class InitFilterProduct1Event extends FilterProduct1Event {

  InitFilterProduct1Event();

  @override
  List<Object?> get props => [];
}


class FilterProduct1Submitted extends FilterProduct1Event {

  final List<String> data;
  String? id;

  FilterProduct1Submitted(this.data, this.id);
}
