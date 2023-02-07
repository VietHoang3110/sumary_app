part of 'create_ask_bloc.dart';


abstract class CreateAskState extends Equatable {

  @override
  List<Object?> get props => [];

  CreateAskState();
}
class InProgressCreateAskState extends CreateAskState {}


class FailureCreateAskState extends CreateAskState {
  final String message;
  FailureCreateAskState({required this.message});
  @override
  List<Object?> get props => [message];
}


class SuccessCreateAskState extends CreateAskState{
  final String message;
  SuccessCreateAskState({required this.message});
  @override
  List<Object?> get props => [message];
}