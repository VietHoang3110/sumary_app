part of 'content_terms_bloc.dart';


abstract class ContentTermsState extends Equatable {

  @override
  List<Object?> get props => [];

  const ContentTermsState();
}
class InitContentTermsState extends ContentTermsState {}

class UpdateContentTermsState extends ContentTermsState{

  final DataTerms dataTerms;

  UpdateContentTermsState(this.dataTerms);
  @override
  List<Object> get props => [];
}

class LoadingGetListIssueState extends ContentTermsState {
}

class ErrorContentTermsState extends ContentTermsState{
  final String msg;
  const ErrorContentTermsState(this.msg);
  @override
  List<Object> get props => [msg];
}