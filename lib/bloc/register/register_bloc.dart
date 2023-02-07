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

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository userRepository;
  final EventRepositoryStorage localRepository;

  RegisterBloc({required this.userRepository, required this.localRepository})
      : super( const RegisterState(
      name: NotNull.pure(),
      email: UserName.pure(),
      password: Password.pure(),
      status: FormzStatus.pure,
      message: ''
  ));

  @override
  void onTransition(Transition<RegisterEvent, RegisterState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is EmailRegisterChanged) {
      final email = UserName.dirty(event.email);
      yield state.copyWith(
        email: email.valid ? email : UserName.pure(event.email),
        status: Formz.validate([state.name, email, state.password]),
      );
    } else if (event is PasswordRegisterChanged) {
      final password = Password.dirty(event.password);
      yield state.copyWith(
        password: password.valid ? password : Password.pure(event.password),
        status: Formz.validate([state.name, state.email, password]),
      );
    } else if (event is FullNameRegisterChanged) {
      final name = NotNull.dirty(event.name);
      yield state.copyWith(
        name: name.valid ? name : NotNull.pure(event.name),
        status: Formz.validate([name, state.email, state.password]),
      );

    } else if (event is FullNameRegisterUnfocused) {
      final name = NotNull.dirty(state.name.value);
      yield state.copyWith(
        name: name,
        status: Formz.validate([name, state.email, state.password]),
      );
    } else if (event is EmailRegisterUnfocused) {
      final email = UserName.dirty(state.email.value);
      yield state.copyWith(
        email: email,
        status: Formz.validate([state.name, email, state.password]),
      );
    } else if (event is PasswordRegisterUnfocused) {
      final password = Password.dirty(state.password.value);
      yield state.copyWith(
        password: password,
        status: Formz.validate([state.name, state.email, password]),
      );
    }else if (event is PasswordRegisterUnfocused) {
      final password = Password.dirty(state.password.value);
      yield state.copyWith(
        password: password,
        status: Formz.validate([state.name, state.email, password]),
      );
    }
    else if (event is RegisterFormSubmitted) {
      try{
        if (state.status.isValidated) {
          yield state.copyWith(status: FormzStatus.submissionInProgress);
          var response = await userRepository.registerApp(name: state.name.value, email: state.email.value, password: state.password.value,referrer: event.referrer);
          if (response.statusCode == BASE_URL.SUCCESS_200) {
            await shareLocal.putString(PreferencesKey.TOKEN, response.data!.token);
            await shareLocal.putString(dotenv.env[PreferencesKey.TOKEN]!, response.data!.token);
            DioProvider.instance(token: response.data!.token);
            yield state.copyWith(status: FormzStatus.submissionSuccess, message: response.message);
          } else {
            yield state.copyWith(status: FormzStatus.submissionFailure, message: response.message);
          }
        }
      }catch(e){
        yield state.copyWith(status: FormzStatus.submissionFailure, message: MESSAGES.CONNECT_ERROR);
        throw e;
      }
    }
  }
  static RegisterBloc of(BuildContext context) => BlocProvider.of<RegisterBloc>(context);
}