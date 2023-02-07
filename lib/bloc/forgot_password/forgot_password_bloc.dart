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
import '../../storages/storages.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final UserRepository userRepository;

  ForgotPasswordBloc({required this.userRepository})
      : super(const ForgotPasswordState(
      email: UserName.pure(),
      status: FormzStatus.pure,
      message: ''
  ));

  @override
  void onTransition(Transition<ForgotPasswordEvent, ForgotPasswordState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<ForgotPasswordState> mapEventToState(ForgotPasswordEvent event) async* {
    if (event is EmailForgotPasswordChanged) {
      final email = UserName.dirty(event.email);
      yield state.copyWith(
        email: email.valid ? email : UserName.pure(event.email),
        status: Formz.validate([email]),
      );
    } else if (event is EmailForgotPasswordUnfocused) {
      final email = UserName.dirty(state.email.value);
      yield state.copyWith(
        email: email,
        status: Formz.validate([email]),
      );
    }  else if (event is FormForgotPasswordSubmitted) {
      if (state.status.isValidated) {
        yield state.copyWith(status: FormzStatus.submissionInProgress);
        try{
          var response = await userRepository.forgotPass(email: state.email.value);
          if (response.statusCode == BASE_URL.SUCCESS_200) {
            await shareLocal.putString(PreferencesKey.TOKEN, response.data!.token);
            await shareLocal.putString(dotenv.env[PreferencesKey.TOKEN]!, response.data!.token);
            DioProvider.instance(token: response.data!.token);
            yield state.copyWith(status: FormzStatus.submissionSuccess, message: response.message);
          } else {
            yield state.copyWith(status: FormzStatus.submissionFailure, message: response.message);
          }
        }catch(e){
          yield state.copyWith(status: FormzStatus.submissionFailure, message: MESSAGES.CONNECT_ERROR);
          throw e;
        }
      }
    }
  }
  static ForgotPasswordBloc of(BuildContext context) => BlocProvider.of<ForgotPasswordBloc>(context);
}
