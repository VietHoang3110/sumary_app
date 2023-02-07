part of 'reset_password_bloc.dart';

class ResetPasswordState extends Equatable {
  const ResetPasswordState({
    this.password = const Password.pure(),
    this.newPassword = const Password.pure(),
    this.repeatPassword = const ConfirmedPassword.pure(),
    this.status = FormzStatus.pure,
    this.message = ''
  });

  final Password password;
  final Password newPassword;
  final ConfirmedPassword repeatPassword;
  final FormzStatus status;
  final String message;

  ResetPasswordState copyWith({
    Password? password,
    Password? newPassword,
    ConfirmedPassword? repeatPassword,
    FormzStatus? status,
    String? message
  }) {
    return ResetPasswordState(
      password: password ?? this.password,
      newPassword: newPassword ?? this.newPassword,
      repeatPassword: repeatPassword ?? this.repeatPassword,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [password, newPassword, repeatPassword, status, message];
}
