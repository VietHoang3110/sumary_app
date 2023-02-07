part of 'create_ask_bloc.dart';

abstract class CreateAskEvent extends Equatable {

  @override
  List<Object?> get props => [];

  CreateAskEvent();
}



class CreateAskSubmitted extends CreateAskEvent {
  CreateAskSubmitted({
    required this.id,
    required this.name,
    required this.question,
  });

  final String id;
  final String name;
  final String question;

  @override
  List<Object> get props => [id, name, question];
}
