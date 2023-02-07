part of 'get_content_file_pdf_bloc.dart';


abstract class ContentFileState extends Equatable {

  @override
  List<Object?> get props => [];

  ContentFileState();
}
class InitContentFileState extends ContentFileState {}

class UpdateContentFileState extends ContentFileState{
  String data;

  UpdateContentFileState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingContentFileState extends ContentFileState {
}


class ErrorContentFileState extends ContentFileState{
  final String msg;


  ErrorContentFileState(this.msg);

  @override
  List<Object> get props => [msg];
}