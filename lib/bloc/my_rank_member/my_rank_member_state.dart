part of 'my_rank_member_bloc.dart';


abstract class MyRankState extends Equatable {

  @override
  List<Object?> get props => [];

  MyRankState();
}
class InitGetMyRankState extends MyRankState {}

class UpdateGetMyRankState extends MyRankState{
  DataRankMember data;

  UpdateGetMyRankState(this.data);
  @override
  List<Object> get props => [];
}

class LoadingMyRankState extends MyRankState {
}


class ErrorGetMyRankState extends MyRankState{
  final String msg;


  ErrorGetMyRankState(this.msg);

  @override
  List<Object> get props => [msg];
}