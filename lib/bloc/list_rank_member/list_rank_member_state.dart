part of 'list_rank_member_bloc.dart';


abstract class ListRankMemberState extends Equatable {

  @override
  List<Object?> get props => [];

  ListRankMemberState();
}
class InitGetListRankMemberState extends ListRankMemberState {}

class UpdateListRankMemberState extends ListRankMemberState{
  List<DataListRank> data;

  UpdateListRankMemberState(this.data);
  @override
  List<Object> get props => [];
}

class LoadingGetListRankMemberState extends ListRankMemberState {
}


class ErrorGetListRankMemberState extends ListRankMemberState{
  final String msg;


  ErrorGetListRankMemberState(this.msg);

  @override
  List<Object> get props => [msg];
}