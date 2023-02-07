part of 'list_book_recommend_bloc.dart';


abstract class ListBookRecommendState extends Equatable {

  @override
  List<Object?> get props => [];

  ListBookRecommendState();
}
class InitGetListBookRecommendState extends ListBookRecommendState {}

class UpdateGetListBookRecommendState extends ListBookRecommendState{

  List<ListTopView> data;

  UpdateGetListBookRecommendState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingListBookRecommendState extends ListBookRecommendState {
}


class ErrorGetListBookRecommendState extends ListBookRecommendState{
  final String msg;


  ErrorGetListBookRecommendState(this.msg);

  @override
  List<Object> get props => [msg];
}