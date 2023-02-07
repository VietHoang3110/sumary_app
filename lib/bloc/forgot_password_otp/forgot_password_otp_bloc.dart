import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:formz/formz.dart';
import 'package:equatable/equatable.dart';
import 'package:sumary_app/api_resfull/user_repository.dart';
import 'package:sumary_app/src/src_index.dart';

import '../../api_resfull/api.dart';
import '../../storages/storages.dart';

part 'forgot_password_otp_event.dart';
part 'forgot_password_otp_state.dart';

class ForgotPasswordOTPBloc extends Bloc<ForgotPasswordOTPEvent, ForgotPasswordOTPState> {
  final UserRepository userRepository;

  ForgotPasswordOTPBloc({required this.userRepository})
      : super(InProgressForgotPasswordOTPState());

  @override
  void onTransition(Transition<ForgotPasswordOTPEvent, ForgotPasswordOTPState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<ForgotPasswordOTPState> mapEventToState(ForgotPasswordOTPEvent event) async* {
   if (event is FormForgotPasswordOTPSubmitted) {
      try{
        yield InProgressForgotPasswordOTPState();
        // if (state.status.isValidated) {
          var response = await userRepository.otpForgotPass(otp: event.otp);
          if (response.statusCode == BASE_URL.SUCCESS_200) {
            await shareLocal.putString(PreferencesKey.TOKEN, response.data!.token);
            await shareLocal.putString(dotenv.env[PreferencesKey.TOKEN]!, response.data!.token);
            DioProvider.instance(token: response.data!.token);
            yield SuccessForgotPasswordOTPState(message:  response.message!);
          } else {
            yield FailureForgotPasswordOTPState(message: response.message!);
            // yield state.copyWith(status: FormzStatus.submissionFailure, message: response.message);
          }
        // }
      }catch(e){
        // yield state.copyWith(message: MESSAGES.CONNECT_ERROR);
        throw e;
      }
    }
   if (event is OTPResend) {
          yield InProgressResendOtpState();
          var response = await userRepository.resendOtpForgotPass();
          if (response.statusCode == BASE_URL.SUCCESS_200) {
            yield SuccessResendOtpState(message:  MESSAGES.OTP_RESEND);
          } else {
            yield FailureResendOtpState(message: response.message!);
          }
    }
  }

  static ForgotPasswordOTPBloc of(BuildContext context) => BlocProvider.of<ForgotPasswordOTPBloc>(context);
}
