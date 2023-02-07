part of 'fitlter_category_bloc.dart';


abstract class CategorySelectState extends Equatable {

  @override
  List<Object?> get props => [];

  CategorySelectState();
}
class InitCategorySelectState extends CategorySelectState {}

class UpdateCategorySelectState extends CategorySelectState{
  List<CategoryFilter> data;

  UpdateCategorySelectState(this.data);

  @override
  List<Object> get props => [];
}

class LoadingCategorySelectState extends CategorySelectState {
}


class ErrorCategorySelectState extends CategorySelectState{
  final String msg;


  ErrorCategorySelectState(this.msg);

  @override
  List<Object> get props => [msg];
}