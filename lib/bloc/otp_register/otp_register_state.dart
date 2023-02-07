part of 'otp_register_bloc.dart';


abstract class OtpRegisterState extends Equatable {
  const OtpRegisterState();
  @override
  List<Object?> get props => [];
}

class InProgressResisterOTPState extends OtpRegisterState{
}

class FailureResisterOTPState extends OtpRegisterState{
  final String message;
  FailureResisterOTPState({required this.message});
  @override
  List<Object?> get props => [message];
}

class SuccessResisterOTPState extends OtpRegisterState{
  final String message;
  SuccessResisterOTPState({required this.message});
  @override
  List<Object?> get props => [message];
}


////////resend otp
class InProgressResendOtpRegisterState extends OtpRegisterState{
}

class FailureResendOtpRegisterState extends OtpRegisterState{
  final String message;
  FailureResendOtpRegisterState({required this.message});
  @override
  List<Object?> get props => [message];
}

class SuccessResendOtpRegisterState extends OtpRegisterState{
  final String message;
  SuccessResendOtpRegisterState({required this.message});
  @override
  List<Object?> get props => [message];
}


