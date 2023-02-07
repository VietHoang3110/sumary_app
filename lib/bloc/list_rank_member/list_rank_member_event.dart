part of 'list_rank_member_bloc.dart';

abstract class ListRankMemberEvent extends Equatable {

  @override
  List<Object?> get props => [];

  ListRankMemberEvent();
}


class InitGetListRankMemberEvent extends ListRankMemberEvent {
  String keyword;
  int page;
  int pageSize;

  InitGetListRankMemberEvent(
      this.keyword,
      this.page,
      this.pageSize
      );

  @override
  List<Object?> get props => [];
}


