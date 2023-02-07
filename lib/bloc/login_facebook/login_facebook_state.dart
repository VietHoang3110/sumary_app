part of 'login_facebook_bloc.dart';
abstract class LoginFacebookState extends Equatable {
  const LoginFacebookState();
  @override
  List<Object> get props => [];
}
class InitLoginFacebook extends LoginFacebookState {}

class LoadingLoginFacebook extends LoginFacebookState {}

class ErrorLoginFacebook extends LoginFacebookState{
  final String msg;

  ErrorLoginFacebook(this.msg);
  @override
  List<Object> get props => [msg];
}

class UpdateLoginFacebook extends LoginFacebookState{

  const UpdateLoginFacebook();
  @override
  List<Object> get props => [];
}
