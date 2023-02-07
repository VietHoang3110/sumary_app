// ignore: import_of_legacy_library_into_null_safe
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';


import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/messages.dart';
import '../../src/models/validate_form/confirm_password.dart';
import '../../src/models/validate_form/password.dart';
part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final UserRepository userRepository;

  ResetPasswordBloc({required this.userRepository})
      : super(const ResetPasswordState(
      password: Password.pure(),
      newPassword: Password.pure(),
      repeatPassword: ConfirmedPassword.pure(),
      status: FormzStatus.pure,
      message: ''
  ));

  @override
  void onTransition(Transition<ResetPasswordEvent, ResetPasswordState> transition) {
    super.onTransition(transition);
  }
  String repeatPass="";
  String oldPass="";
  @override

  Stream<ResetPasswordState> mapEventToState(ResetPasswordEvent event) async* {

    if (event is NewPasswordResetChanged) {
      final newPassword = Password.pure(event.newPassword);
      yield state.copyWith(
        newPassword: newPassword.valid ? newPassword : Password.pure(event.newPassword),
        status: Formz.validate([newPassword, state.repeatPassword]),
      );
    }

    else if (event is RepeatPasswordResetChanged) {
      repeatPass = event.repeatPassword;
      final repeatPassword = ConfirmedPassword.dirty(
        password: state.newPassword.value,
        value:  event.repeatPassword,
      );

      yield state.copyWith(
        repeatPassword: repeatPassword,
        status: Formz.validate([state.newPassword, repeatPassword]),
      );
    }

    else if (event is NewPasswordResetUnfocused) {
      final newPassword = Password.dirty(state.newPassword.value);
      yield state.copyWith(
        newPassword: newPassword,
        status: Formz.validate([newPassword, state.repeatPassword]),
      );
    }

    else if (event is RepeatPasswordResetUnfocused) {
      final repeatPassword = ConfirmedPassword.dirty(password:state.newPassword.value,value: repeatPass);
      yield state.copyWith(
        repeatPassword: repeatPassword,
        status: Formz.validate([state.newPassword, repeatPassword]),
      );
    }

    else if (event is FormResetPasswordSubmitted) {
      if (state.status.isValidated) {
        yield state.copyWith(status: FormzStatus.submissionInProgress);
        try{
          var response = await userRepository.resetPass(password: state.password.value, newPassword: state.newPassword.value);
          if (response.statusCode == BASE_URL.SUCCESS_200) {
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
  static ResetPasswordBloc of(BuildContext context) => BlocProvider.of<ResetPasswordBloc>(context);
}
