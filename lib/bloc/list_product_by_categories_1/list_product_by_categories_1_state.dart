part of 'list_product_by_categories_1_bloc.dart';


abstract class ListProductByCategories1State extends Equatable {

  @override
  List<Object?> get props => [];

  ListProductByCategories1State();
}
class InitGetListProductByCategories1State extends ListProductByCategories1State {}

class UpdateGetListProductByCategories1State extends ListProductByCategories1State{
  List<DataProduct> data;

  UpdateGetListProductByCategories1State(this.data);

  @override
  List<Object> get props => [];
}

class LoadingListProductByCategories1State extends ListProductByCategories1State {
}


class ErrorGetListProductByCategories1State extends ListProductByCategories1State{
  final String msg;


  ErrorGetListProductByCategories1State(this.msg);

  @override
  List<Object> get props => [msg];
}