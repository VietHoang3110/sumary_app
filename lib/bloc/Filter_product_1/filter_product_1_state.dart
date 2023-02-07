part of 'filter_product_1_bloc.dart';


abstract class FilterProduct1State extends Equatable {

  @override
  List<Object?> get props => [];

  FilterProduct1State();
}
class InProgressFilterProduct1State extends FilterProduct1State {}


class FailureFilterProduct1State extends FilterProduct1State {
  final String message;
  FailureFilterProduct1State({required this.message});
  @override
  List<Object?> get props => [message];
}


class SuccessFilterProduct1State extends FilterProduct1State{
  final String message;
  final List<ProductFilter> data;
  SuccessFilterProduct1State({ required this.data,required this.message});
  @override
  List<Object?> get props => [message];
}