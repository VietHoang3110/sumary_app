part of 'list_product_by_categories_1_bloc.dart';

abstract class GetListProductByCategories1Event extends Equatable {

  @override
  List<Object?> get props => [];

  GetListProductByCategories1Event();
}


class InitGetListProductByCategories1Event extends GetListProductByCategories1Event {
  String type;
  String catId1,catId2,catId3;
  int page;
  int pageSize;
  String sortBy;


  InitGetListProductByCategories1Event(
      this.type,this.sortBy,
      this.catId1, this.catId2, this.catId3, this.page, this.pageSize
      );

  @override
  List<Object?> get props => [];
}
