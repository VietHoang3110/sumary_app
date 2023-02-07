part of 'login_facebook_bloc.dart';
abstract class LoginFacebookEvent extends Equatable {

  const LoginFacebookEvent();

  @override
  List<Object> get props => [];
}

class LoginFacebookSubmitted extends LoginFacebookEvent {

  final String token;

  const LoginFacebookSubmitted({
    required this.token,
  });

  @override
  List<Object> get props => [token];

}

