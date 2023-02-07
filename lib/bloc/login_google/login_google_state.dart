part of 'login_google_bloc.dart';
abstract class LoginGoogleState extends Equatable {
  const LoginGoogleState();
  @override
  List<Object> get props => [];
}
class InitLoginGoogle extends LoginGoogleState {}

class ErrorLoginGoogle extends LoginGoogleState{
  final String msg;

  ErrorLoginGoogle(this.msg);
  @override
  List<Object> get props => [msg];
}

class UpdateLoginGoogle extends LoginGoogleState{

  const UpdateLoginGoogle();
  @override
  List<Object> get props => [];
}
