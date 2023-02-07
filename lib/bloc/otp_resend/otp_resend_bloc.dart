// import 'dart:async';
// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:formz/formz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:sumary_app/api_resfull/user_repository.dart';
// import 'package:sumary_app/src/models/model_generator/otp_resend.dart';
// import 'package:sumary_app/src/src_index.dart';
//
// import '../../api_resfull/api.dart';
//
//
// part 'otp_resend_event.dart';
// part 'otp_resend_state.dart';
//
// class OTPResendBloc extends Bloc<OtpResendEvent, OtpResendState> {
//   final UserRepository userRepository;
//
//   OTPResendBloc({required this.userRepository})
//       : super(const OtpResendState());
//
//   @override
//   void onTransition(Transition<OtpResendEvent, OtpResendState> transition) {
//     super.onTransition(transition);
//   }
//
//   @override
//   Stream<OtpResendState> mapEventToState(OtpResendEvent event) async* {
//     if (event is ResendOTPSubmitted) {
//       try{
//         yield state.copyWith(status: FormzStatus.submissionInProgress);
//         if (state.status.isValidated) {
//           yield state.copyWith(status: FormzStatus.submissionSuccess);
//         }
//       }catch(e){
//         yield state.copyWith(status: FormzStatus.submissionFailure, message: MESSAGES.CONNECT_ERROR);
//         throw e;
//       }
//     }
//   }
//   static OTPResendBloc of(BuildContext context) => BlocProvider.of<OTPResendBloc>(context);
// }
