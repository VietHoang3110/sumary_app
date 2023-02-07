part of 'content_FAQ_bloc.dart';


abstract class ContentFAQState extends Equatable {

  @override
  List<Object?> get props => [];

  const ContentFAQState();
}
class InitContentFAQState extends ContentFAQState {}

class UpdateContentFAQState extends ContentFAQState{

  final DataFAQ dataFAQ;

  UpdateContentFAQState(this.dataFAQ);
  @override
  List<Object> get props => [];
}

class LoadingGetListFAQState extends ContentFAQState {
}

class ErrorContentFAQState extends ContentFAQState{
  final String msg;
  const ErrorContentFAQState(this.msg);
  @override
  List<Object> get props => [msg];
}