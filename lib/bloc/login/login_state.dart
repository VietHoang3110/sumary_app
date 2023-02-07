part of 'login_bloc.dart';
class LoginState extends Equatable {
  final UserName email;
  final Password password;
  final FormzStatus status;
  final String message;
  LoginState({
    required this.email,
    required this.password,
    required this.status,
    required this.message ,
  });

  LoginState copyWith({
    UserName? email,
    Password? password,
    String? message,
    FormzStatus? status,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [email, password, status, message];
}