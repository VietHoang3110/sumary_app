part of 'filter_product_2_bloc.dart';


abstract class FilterProduct2State extends Equatable {

  @override
  List<Object?> get props => [];

  FilterProduct2State();
}
class InProgressFilterProduct2State extends FilterProduct2State {}


class FailureFilterProduct2State extends FilterProduct2State {
  final String message;
  FailureFilterProduct2State({required this.message});
  @override
  List<Object?> get props => [message];
}


class SuccessFilterProduct2State extends FilterProduct2State{
  final String message;
  final List<ProductFilter> data;
  SuccessFilterProduct2State({ required this.data,required this.message});
  @override
  List<Object?> get props => [message];
}