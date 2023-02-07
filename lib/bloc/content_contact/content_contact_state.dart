part of 'content_contact_bloc.dart';


abstract class ContentContactState extends Equatable {

  @override
  List<Object?> get props => [];

  const ContentContactState();
}
class InitContentContactState extends ContentContactState {}

class UpdateContentContactState extends ContentContactState{
  final DataContact dataFAQ;
  UpdateContentContactState(this.dataFAQ);
  @override
  List<Object> get props => [];
}

class LoadingGetContentContactState extends ContentContactState {
}

class ErrorContentContactState extends ContentContactState{
  final String msg;
  const ErrorContentContactState(this.msg);
  @override
  List<Object> get props => [msg];
}