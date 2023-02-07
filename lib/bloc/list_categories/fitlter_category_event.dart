part of 'fitlter_category_bloc.dart';

abstract class CategorySelectEvent extends Equatable {

  @override
  List<Object?> get props => [];

  CategorySelectEvent();
}


class InitCategorySelectEvent extends CategorySelectEvent {

  InitCategorySelectEvent();

  @override
  List<Object?> get props => [];
}
