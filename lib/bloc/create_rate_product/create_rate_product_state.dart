part of 'create_rate_product_bloc.dart';


abstract class CreateRateState extends Equatable {

  @override
  List<Object?> get props => [];

  CreateRateState();
}
class InProgressCreateRateState extends CreateRateState {}


class FailureCreateRateState extends CreateRateState {
  final String message;
  FailureCreateRateState({required this.message});
  @override
  List<Object?> get props => [message];
}


class SuccessCreateRateState extends CreateRateState{
  final String message;
  SuccessCreateRateState({required this.message});
  @override
  List<Object?> get props => [message];
}