part of 'content_contact_bloc.dart';

abstract class ContentContactEvent extends Equatable {

  @override
  List<Object?> get props => [];

  ContentContactEvent();
}


class InitContentContactEvent extends ContentContactEvent {

  InitContentContactEvent();
  @override
  List<Object?> get props => [];
}
