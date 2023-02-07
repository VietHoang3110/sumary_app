part of 'get_content_file_pdf_bloc.dart';

abstract class ContentFileEvent extends Equatable {

  @override
  List<Object?> get props => [];

  ContentFileEvent();
}


class InitContentFileEvent extends ContentFileEvent {
  String name;
  bool? isSave;


  InitContentFileEvent(
      this.name,
      {this.isSave = false}
      );

  @override
  List<Object?> get props => [];
}


