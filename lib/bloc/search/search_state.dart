part of 'search_bloc.dart';


abstract class SearchState extends Equatable {

  @override
  List<Object?> get props => [];

  SearchState();
}
class InitGetDataSearchState extends SearchState {}

class UpdateGetDataSearchState extends SearchState{


  // int total;
  // int page;
  DataSearch data;


  UpdateGetDataSearchState(this.data,
      // this.total,this.page
      );

  @override
  List<Object> get props => [data,
    // total,page
  ];

}

class LoadingDataSearchState extends SearchState {
}


class ErrorGetDataSearchState extends SearchState{
  final String msg;


  ErrorGetDataSearchState(this.msg);

  @override
  List<Object> get props => [msg];
}