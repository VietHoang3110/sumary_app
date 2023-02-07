part of 'forgot_password_otp_bloc.dart';
// class ForgotPasswordOTPState extends Equatable {
//   const ForgotPasswordOTPState({
//     this.otp = const OTPNumber.pure(),
//     this.status = FormzStatus.pure,
//     this.message = ''
//   });
//
//   final OTPNumber otp;
//   final FormzStatus status;
//   final String message;
//
//   ForgotPasswordOTPState copyWith({
//     OTPNumber? otp,
//     FormzStatus? status,
//     String? message
//   }) {
//     return ForgotPasswordOTPState(
//       otp: otp ?? this.otp,
//       status: status ?? this.status,
//       message: message ?? this.message,
//     );
//   }
//
//   @override
//   List<Object> get props => [ otp, status, message];
// }

abstract class ForgotPasswordOTPState extends Equatable {
  const ForgotPasswordOTPState();
  @override
  List<Object?> get props => [];
}

class InProgressForgotPasswordOTPState extends ForgotPasswordOTPState{
}

class FailureForgotPasswordOTPState extends ForgotPasswordOTPState{
  final String message;
  FailureForgotPasswordOTPState({required this.message});
  @override
  List<Object?> get props => [message];
}

class SuccessForgotPasswordOTPState extends ForgotPasswordOTPState{
  final String message;
  SuccessForgotPasswordOTPState({required this.message});
  @override
  List<Object?> get props => [message];
}


////////resend otp
class InProgressResendOtpState extends ForgotPasswordOTPState{
}

class FailureResendOtpState extends ForgotPasswordOTPState{
  final String message;
  FailureResendOtpState({required this.message});
  @override
  List<Object?> get props => [message];
}

class SuccessResendOtpState extends ForgotPasswordOTPState{
  final String message;
  SuccessResendOtpState({required this.message});
  @override
  List<Object?> get props => [message];
}

