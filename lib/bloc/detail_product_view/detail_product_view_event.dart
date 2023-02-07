part of 'detail_product_view_bloc.dart';

abstract class DetailProductViewEvent extends Equatable {

  @override
  List<Object?> get props => [];

  DetailProductViewEvent();
}


class InitDetailProductViewEvent extends DetailProductViewEvent {
  String id;

  InitDetailProductViewEvent(this.id);

  @override
  List<Object?> get props => [id];
}
