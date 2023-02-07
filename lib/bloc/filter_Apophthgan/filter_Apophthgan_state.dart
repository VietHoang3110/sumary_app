part of 'filter_Apophthgan_bloc.dart';


abstract class FilterApophthganState extends Equatable {

  @override
  List<Object?> get props => [];

  FilterApophthganState();
}
class InitFilterApophthganState extends FilterApophthganState {}

class UpdateFilterApophthganState extends FilterApophthganState{

  List<ApophthganFilter> data;


  UpdateFilterApophthganState(this.data);

  @override
  List<Object> get props => [data];

}

class LoadingFilterApophthganState extends FilterApophthganState {
}


class ErrorFilterApophthganState extends FilterApophthganState{
  final String msg;


  ErrorFilterApophthganState(this.msg);

  @override
  List<Object> get props => [msg];
}