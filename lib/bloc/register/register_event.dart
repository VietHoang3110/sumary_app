part of 'register_bloc.dart';
abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class FullNameRegisterChanged extends RegisterEvent {
  const FullNameRegisterChanged({required this.name});

  final String name;

  @override
  List<Object> get props => [name];
}

class FullNameRegisterUnfocused extends RegisterEvent {}

class EmailRegisterChanged extends RegisterEvent {
  const EmailRegisterChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class EmailRegisterUnfocused extends RegisterEvent {}

class PasswordRegisterChanged extends RegisterEvent {
  const PasswordRegisterChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class ReferrerChanged extends RegisterEvent {
  const ReferrerChanged({required this.referrer});

  final String referrer;

  @override
  List<Object> get props => [referrer];
}

class PasswordRegisterUnfocused extends RegisterEvent {}

class RegisterFormSubmitted extends RegisterEvent {
  RegisterFormSubmitted({required this.referrer});

  final String referrer;

  @override
  List<Object> get props => [referrer];
}