
part of 'list_rate_product_bloc.dart';

abstract class ListRateProductState extends Equatable {

  @override
  List<Object?> get props => [];

  ListRateProductState();
}
class InitGetListRateProductState extends ListRateProductState {}

class UpdateGetListRateProductState extends ListRateProductState{
  List<DataRateProduct> dataRateProduct;


  UpdateGetListRateProductState(this.dataRateProduct);

  @override
  List<Object> get props => [];

}

class LoadingDetailProductState extends ListRateProductState {
}


class ErrorGetListRateProductState extends ListRateProductState{
  final String msg;


  ErrorGetListRateProductState(this.msg);

  @override
  List<Object> get props => [msg];
}