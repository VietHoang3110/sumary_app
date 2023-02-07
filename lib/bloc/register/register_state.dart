part of 'register_bloc.dart';
class RegisterState extends Equatable {
  const RegisterState({
    this.name = const NotNull.pure(),
    this.email = const UserName.pure(),
    this.password = const Password.pure(),
    this.referrer,
    this.status = FormzStatus.pure,
    this.message = ''
  });

  final NotNull name;
  final UserName email;
  final Password password;
  final String? referrer;
  final FormzStatus status;
  final String message;

  RegisterState copyWith({
    NotNull? name,
    UserName? email,
    Password? password,
    String? referrer,
    String? message,
    FormzStatus? status,
  }) {
    return RegisterState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      referrer: referrer,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [name, email, password, status, message];
}