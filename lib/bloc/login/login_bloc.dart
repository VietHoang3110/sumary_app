import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:formz/formz.dart';
import 'package:equatable/equatable.dart';
import 'package:sumary_app/api_resfull/dio_provider.dart';
import 'package:sumary_app/api_resfull/user_repository.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/storages/event_repository_storage.dart';
import 'package:sumary_app/storages/share_local.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final EventRepositoryStorage localRepository;

  LoginBloc({required this.userRepository, required this.localRepository})
      : super( LoginState(
      email: UserName.pure(),
      password: Password.pure(),
      message:'' ,
      status: FormzStatus.invalid
  ));

  @override
  void onTransition(Transition<LoginEvent, LoginState> transition) {
    super.onTransition(transition);
  }


  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailChanged) {
      final email = UserName.dirty(event.email);
      yield state.copyWith(
        email: email.valid ? email : UserName.pure(event.email),
        status: Formz.validate([email, state.password]),
      );
    } else if (event is PasswordChanged) {
      final password = Password.dirty(event.password);
      yield state.copyWith(
        password: password.valid ? password : Password.pure(event.password),
        status: Formz.validate([state.email, password]),
      );

    } else if (event is EmailUnfocused) {
      final email = UserName.dirty(state.email.value);
      yield state.copyWith(
        email: email,
        status: Formz.validate([email, state.password]),
      );
    } else if (event is PasswordUnfocused) {
      final password = Password.dirty(state.password.value);
      yield state.copyWith(
        password: password,
        status: Formz.validate([state.email, password]),
      );
    } else if (event is FormSubmitted) {
      try{
        print('email: ${state.email.value}, pass: ${state.password.value}');
        if (state.status.isValidated) {
          yield state.copyWith(status: FormzStatus.submissionInProgress);
          FirebaseMessaging messaging = FirebaseMessaging.instance;
          final tokenFirebase = await messaging.getToken() as String;
          var response = await userRepository.loginApp(email: state.email.value, password: state.password.value, token_firebase: tokenFirebase);
          if (response.statusCode == BASE_URL.SUCCESS_200) {
            await localRepository.saveUser(jsonEncode(response));
            await shareLocal.putString(PreferencesKey.TOKEN, response.data!.token);
            await shareLocal.putString(PreferencesKey.FIRST_TIME, "0");
            await shareLocal.putString(PreferencesKey.LOGIN_TYPE, "Email");
            await shareLocal.putString(dotenv.env[PreferencesKey.TOKEN]!, response.data!.token);
            DioProvider.instance(token: response.data!.token);
            yield state.copyWith(status: FormzStatus.submissionSuccess, message: response.message);
          } else {
            yield state.copyWith(status: FormzStatus.submissionFailure, message: response.message);
          }
        }
      }catch(e){
        yield state.copyWith(status: FormzStatus.submissionFailure, message: MESSAGES.CONNECT_ERROR);
        print('lỗi iii: $e');
        throw e;
      }
    }
  }
  static LoginBloc of(BuildContext context) => BlocProvider.of<LoginBloc>(context);
}