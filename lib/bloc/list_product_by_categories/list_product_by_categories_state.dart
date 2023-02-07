part of 'list_product_by_categories_bloc.dart';


abstract class ListProductByCategoriesState extends Equatable {

  @override
  List<Object?> get props => [];

  ListProductByCategoriesState();
}
class InitGetListProductByCategoriesState extends ListProductByCategoriesState {}

class UpdateGetListProductByCategoriesState extends ListProductByCategoriesState{
  List<DataProduct> data;

  UpdateGetListProductByCategoriesState(this.data);

  @override
  List<Object> get props => [];
}

class LoadingListProductByCategoriesState extends ListProductByCategoriesState {
}


class ErrorGetListProductByCategoriesState extends ListProductByCategoriesState{
  final String msg;


  ErrorGetListProductByCategoriesState(this.msg);

  @override
  List<Object> get props => [msg];
}