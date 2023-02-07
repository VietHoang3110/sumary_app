part of 'otp_register_bloc.dart';

abstract class OtpRegisterEvent extends Equatable {
  const OtpRegisterEvent();

  @override
  List<Object> get props => [];
}



class RegisterOTPSubmitted extends OtpRegisterEvent {
  const RegisterOTPSubmitted({required this.otp});

  final String otp;

  @override
  List<Object> get props => [otp];
}


class OTPResendRegister extends OtpRegisterEvent {}

