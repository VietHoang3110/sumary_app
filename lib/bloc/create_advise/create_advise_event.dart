part of 'create_advise_bloc.dart';

abstract class CreateAdviseEvent extends Equatable {
  const CreateAdviseEvent();

  @override
  List<Object> get props => [];
}

class NameAdviseChanged extends CreateAdviseEvent {
  const NameAdviseChanged({required this.name});
  final String name;
  @override
  List<Object> get props => [name];
}

class PhoneAdviseChanged extends CreateAdviseEvent {
  const PhoneAdviseChanged({required this.phoneNumber});
  final int phoneNumber;
  @override
  List<Object> get props => [phoneNumber];
}

class EmailAdviseChanged extends CreateAdviseEvent {
  const EmailAdviseChanged({required this.email});
  final String email;
  @override
  List<Object> get props => [email];
}

class ContentAdviseChanged extends CreateAdviseEvent {
  const ContentAdviseChanged({required this.content});
  final String content;
  @override
  List<Object> get props => [content];
}


class CreateAdviseSubmitted extends CreateAdviseEvent {
  const CreateAdviseSubmitted({
    required this.name,
    required this.issueType,
    required this.appointmentDate,
    required this.phoneNumber,
    required this.email,
    required this.content,
    required this.note,
  });
  final String name;
  final String issueType;
  final String appointmentDate;
  final int phoneNumber;
  final String email;
  final String content;
  final String note;

  @override
  List<Object> get props => [name, issueType, appointmentDate, phoneNumber,email, content,note];
}

