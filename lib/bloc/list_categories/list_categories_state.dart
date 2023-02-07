part of 'list_categories_bloc.dart';


abstract class ListCategotiesState extends Equatable {

  @override
  List<Object?> get props => [];

  ListCategotiesState();
}
class InitGetListCategotiesState extends ListCategotiesState {}

class UpdateGetListCategotiesState extends ListCategotiesState{
  List<List<DataCategory>> dataCategory;

  UpdateGetListCategotiesState(this.dataCategory);

  @override
  List<Object> get props => [dataCategory];
}

class LoadingListCategotiesState extends ListCategotiesState {
}


class ErrorGetListCategotiesState extends ListCategotiesState{
  final String msg;


  ErrorGetListCategotiesState(this.msg);

  @override
  List<Object> get props => [msg];
}