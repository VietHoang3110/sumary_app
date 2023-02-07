part of 'list_armorial_bloc.dart';

abstract class ListArmorialEvent extends Equatable {

  @override
  List<Object?> get props => [];

  ListArmorialEvent();
}


class InitGetListArmorialEvent extends ListArmorialEvent {
  String keyword;
  int page;
  int pageSize;


  InitGetListArmorialEvent(
      this.keyword,
      this.page,
      this.pageSize
      );

  @override
  List<Object?> get props => [];
}


