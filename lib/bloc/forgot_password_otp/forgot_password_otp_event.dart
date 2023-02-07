part of 'forgot_password_otp_bloc.dart';
abstract class ForgotPasswordOTPEvent extends Equatable {
  const ForgotPasswordOTPEvent();

  @override
  List<Object> get props => [];
}

class OtpCodeForgotPasswordOTPChanged extends ForgotPasswordOTPEvent {
  const OtpCodeForgotPasswordOTPChanged({required this.otp});

  final String otp;

  @override
  List<Object> get props => [otp];
}

class OtpCodeForgotPasswordOTPUnfocused extends ForgotPasswordOTPEvent {}

class FormForgotPasswordOTPSubmitted extends ForgotPasswordOTPEvent {
  const FormForgotPasswordOTPSubmitted({required this.otp});

  final String otp;

  @override
  List<Object> get props => [otp];
}

class OTPResend extends ForgotPasswordOTPEvent {
}
