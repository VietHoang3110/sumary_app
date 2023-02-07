part of 'list_issue_bloc.dart';

abstract class ListIssueEvent extends Equatable {

  @override
  List<Object?> get props => [];

  ListIssueEvent();
}


class InitGetListIssueEvent extends ListIssueEvent {
  int page;
  int pageSize;
  String keyword;

  InitGetListIssueEvent(this.page, this.pageSize, this.keyword);

  @override
  List<Object?> get props => [];
}
