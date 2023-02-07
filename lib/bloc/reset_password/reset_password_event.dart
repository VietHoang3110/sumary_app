part of 'reset_password_bloc.dart';

abstract class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();

  @override
  List<Object> get props => [];
}

class NewPasswordResetChanged extends ResetPasswordEvent {
  const NewPasswordResetChanged({required this.newPassword});

  final String newPassword;

  @override
  List<Object> get props => [newPassword];
}

class NewPasswordResetUnfocused extends ResetPasswordEvent {}

class RepeatPasswordResetChanged extends ResetPasswordEvent {
  const RepeatPasswordResetChanged({required this.repeatPassword});

  final String repeatPassword;

  @override
  List<Object> get props => [repeatPassword];
}

class RepeatPasswordResetUnfocused extends ResetPasswordEvent {

}

class FormResetPasswordSubmitted extends ResetPasswordEvent {}
