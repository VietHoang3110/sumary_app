part of 'search_popular_bloc.dart';


abstract class SearchPopularState extends Equatable {

  @override
  List<Object?> get props => [];

  SearchPopularState();
}
class InitSearchPopularState extends SearchPopularState {}

class UpdateSearchPopularState extends SearchPopularState{

  DataSearchPopular data;


  UpdateSearchPopularState(this.data,
      // this.total,this.page
      );

  @override
  List<Object> get props => [data,
    // total,page
  ];

}

class LoadingSearchPopularState extends SearchPopularState {
}


class ErrorSearchPopularState extends SearchPopularState{
  final String msg;


  ErrorSearchPopularState(this.msg);

  @override
  List<Object> get props => [msg];
}