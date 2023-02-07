
part of 'list_rate_product_view_bloc.dart';

abstract class ListRateProductViewState extends Equatable {

  @override
  List<Object?> get props => [];

  ListRateProductViewState();
}
class InitGetListRateProductViewState extends ListRateProductViewState {}

class UpdateGetListRateProductViewState extends ListRateProductViewState{
  List<DataRateProduct> dataRateProduct;


  UpdateGetListRateProductViewState(this.dataRateProduct);

  @override
  List<Object> get props => [];

}

class LoadingDetailProductViewState extends ListRateProductViewState {
}


class ErrorGetListRateProductViewState extends ListRateProductViewState{
  final String msg;


  ErrorGetListRateProductViewState(this.msg);

  @override
  List<Object> get props => [msg];
}