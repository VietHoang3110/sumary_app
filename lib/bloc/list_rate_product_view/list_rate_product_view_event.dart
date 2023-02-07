part of 'list_rate_product_view_bloc.dart';

abstract class GetListRateProductViewEvent extends Equatable {

  @override
  List<Object?> get props => [];

  GetListRateProductViewEvent();


}


class InitGetListRateProductViewEvent extends GetListRateProductViewEvent {
  String id;
  int page;
  int pageSize;


  InitGetListRateProductViewEvent(this.id, this.page, this.pageSize);

  @override
  List<Object?> get props => [];
}
