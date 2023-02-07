part of 'detail_product_bloc.dart';

abstract class DetailProductEvent extends Equatable {

  @override
  List<Object?> get props => [];

  DetailProductEvent();
}


class InitDetailProductEvent extends DetailProductEvent {
  String id;

  InitDetailProductEvent(this.id);

  @override
  List<Object?> get props => [id];
}
