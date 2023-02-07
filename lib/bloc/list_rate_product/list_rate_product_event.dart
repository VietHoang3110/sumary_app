part of 'list_rate_product_bloc.dart';

abstract class GetListRateProductEvent extends Equatable {

  @override
  List<Object?> get props => [];

  GetListRateProductEvent();


}


class InitGetListRateProductEvent extends GetListRateProductEvent {
  String id;
  int page;
  int pageSize;


  InitGetListRateProductEvent(this.id, this.page, this.pageSize);

  @override
  List<Object?> get props => [];
}
