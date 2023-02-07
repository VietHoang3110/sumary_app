part of 'content_terms_bloc.dart';

abstract class ContentTermsEvent extends Equatable {

  @override
  List<Object?> get props => [];

  ContentTermsEvent();
}


class InitContentTermsEvent extends ContentTermsEvent {

  InitContentTermsEvent();
  @override
  List<Object?> get props => [];
}
