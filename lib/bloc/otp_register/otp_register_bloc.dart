import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:formz/formz.dart';
import 'package:equatable/equatable.dart';
import 'package:sumary_app/api_resfull/user_repository.dart';
import 'package:sumary_app/src/src_index.dart';

import '../../api_resfull/dio_provider.dart';
import '../../storages/share_local.dart';

part 'otp_register_event.dart';
part 'otp_register_state.dart';

class OTPRegisterBloc extends Bloc<OtpRegisterEvent, OtpRegisterState> {
  final UserRepository userRepository;

  OTPRegisterBloc({required this.userRepository})
      : super(InProgressResisterOTPState());

  @override
  void onTransition(Transition<OtpRegisterEvent, OtpRegisterState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<OtpRegisterState> mapEventToState(OtpRegisterEvent event) async* {
    if (event is RegisterOTPSubmitted) {
      try{
        yield InProgressResisterOTPState();
        // if (state.status.isValidated) {
        var response = await userRepository.otpRegisterApp(otp: event.otp);
        if (response.statusCode == BASE_URL.SUCCESS_200) {
          yield SuccessResisterOTPState(message:  response.message!);
        } else {
          yield FailureResisterOTPState(message: response.message!);
          // yield state.copyWith(status: FormzStatus.submissionFailure, message: response.message);
        }
        // }
      }catch(e){
        // yield state.copyWith(message: MESSAGES.CONNECT_ERROR);
        throw e;
      }
    }
    if (event is OTPResendRegister) {
      yield InProgressResendOtpRegisterState();
      var response = await userRepository.resendOtpRegisterPass();
      if (response.statusCode == BASE_URL.SUCCESS_200) {
        yield SuccessResendOtpRegisterState(message:  MESSAGES.OTP_RESEND);
      } else {
        yield FailureResendOtpRegisterState(message: response.message!);
      }
    }
  }
  static OTPRegisterBloc of(BuildContext context) => BlocProvider.of<OTPRegisterBloc>(context);
}
