part of 'create_advise_bloc.dart';

abstract class CreateAdviseState extends Equatable {
  const CreateAdviseState();
  @override
  List<Object?> get props => [];
}

class InProgressCreateAdvideState extends CreateAdviseState{
}

class FailureCreateAdvideState extends CreateAdviseState{
  final String message;
  FailureCreateAdvideState({required this.message});
  @override
  List<Object?> get props => [message];
}

class SuccessCreateAdvideState extends CreateAdviseState{
  final String message;
  SuccessCreateAdvideState({required this.message});
  @override
  List<Object?> get props => [message];
}


