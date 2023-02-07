part of 'login_google_bloc.dart';
abstract class LoginGoogleEvent extends Equatable {

  const LoginGoogleEvent();

  @override
  List<Object> get props => [];
}

class LoginGoogleSubmitted extends LoginGoogleEvent {

  final String token;
  final String token_device;

  const LoginGoogleSubmitted({
    required this.token,
    required this.token_device
  });

  @override
  List<Object> get props => [token,token_device];

}

