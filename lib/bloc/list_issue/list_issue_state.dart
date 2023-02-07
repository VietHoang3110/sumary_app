part of 'list_issue_bloc.dart';


abstract class ListIssueState extends Equatable {

  @override
  List<Object?> get props => [];

  const ListIssueState();
}
class InitGetListIssueState extends ListIssueState {}

class UpdateGetListIssueState extends ListIssueState{
  List<DataIssue> dataIssue;

  UpdateGetListIssueState(this.dataIssue);

  @override
  List<Object> get props => [];
}

class LoadingGetListIssueState extends ListIssueState {
}


class ErrorGetListIssueState extends ListIssueState{
  final String msg;


  const ErrorGetListIssueState(this.msg);

  @override
  List<Object> get props => [msg];
}