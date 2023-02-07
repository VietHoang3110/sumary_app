part of 'filter_product_bloc.dart';


abstract class FilterProductState extends Equatable {

  @override
  List<Object?> get props => [];

  FilterProductState();
}
class InProgressFilterProductState extends FilterProductState {}


class FailureFilterProductState extends FilterProductState {
  final String message;
  FailureFilterProductState({required this.message});
  @override
  List<Object?> get props => [message];
}


class SuccessFilterProductState extends FilterProductState{
  final String message;
  final List<ProductFilter> data;
  SuccessFilterProductState({ required this.data,required this.message});
  @override
  List<Object?> get props => [message];
}