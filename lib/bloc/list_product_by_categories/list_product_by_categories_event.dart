part of 'list_product_by_categories_bloc.dart';

abstract class GetListProductByCategoriesEvent extends Equatable {

  @override
  List<Object?> get props => [];

  GetListProductByCategoriesEvent();
}


class InitGetListProductByCategoriesEvent extends GetListProductByCategoriesEvent {
  String catId1,catId2,catId3;
  int page;
  int pageSize;


  InitGetListProductByCategoriesEvent(
      this.catId1, this.catId2, this.catId3, this.page, this.pageSize
      );

  @override
  List<Object?> get props => [];
}
