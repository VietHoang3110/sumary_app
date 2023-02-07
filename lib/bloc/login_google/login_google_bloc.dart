import 'dart:async';
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sumary_app/widgets/loading_api.dart';

import '../../api_resfull/dio_provider.dart';
import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/messages.dart';
import '../../src/preferences_key.dart';
import '../../storages/event_repository_storage.dart';
import '../../storages/share_local.dart';


part 'login_google_event.dart';
part 'login_google_state.dart';

class LoginGoogleBloc extends Bloc<LoginGoogleEvent, LoginGoogleState> {
  final UserRepository userRepository;
  final EventRepositoryStorage localRepository;

  LoginGoogleBloc( {required this.userRepository,required this.localRepository}) : super(InitLoginGoogle());

  @override
  void onTransition(Transition<LoginGoogleEvent, LoginGoogleState> transition) {
    super.onTransition(transition);
  }
  @override
  Stream<LoginGoogleState> mapEventToState(LoginGoogleEvent event) async* {
    if(event is LoginGoogleSubmitted){
      // LoadingApi().pushLoading();
      try{
        yield InitLoginGoogle();
        final response = await userRepository.loginAppGoogle(token: event.token, token_device: event.token_device);
        if (response.statusCode == BASE_URL.SUCCESS_200) {
          await localRepository.saveUser(jsonEncode(response));
          await shareLocal.putString(PreferencesKey.TOKEN, response.data.token);
          await shareLocal.putString(dotenv.env[PreferencesKey.TOKEN]!, response.data.token);
          await shareLocal.putString(PreferencesKey.LOGIN_TYPE, "Google");
          DioProvider.instance(token: response.data.token);
          // LoadingApi().popLoading();
          yield UpdateLoginGoogle();
        } else {
          yield ErrorLoginGoogle(response.message ?? 'Có lỗi xảy ra');
          // yield state.copyWith(status: FormzStatus.submissionFailure, message: response.message);
        }
      }
      catch(e){
        yield ErrorLoginGoogle(MESSAGES.CONNECT_ERROR);
        throw e;
      }
    }
  }
  // Stream<LoginGoogleState> _mapLoginGoogleState({required String token,required String token_device}) async*{
  //   print('aaaaaa123465');
  //   try{
  //     yield UpdateLoginGoogle();
  //     final response = await userRepository.loginAppGoogle(token: token, token_device: token_device);
  //     if(response.statusCode == BASE_URL.SUCCESS_200){
  //       print('aaaaaa ${response.data.token}');
  //       await localRepository.saveUser(jsonEncode(response));
  //       await shareLocal.putString(PreferencesKey.TOKEN, response.data.token);
  //       await shareLocal.putString(dotenv.env[PreferencesKey.TOKEN]!, response.data.token);
  //       DioProvider.instance(token: response.data.token);
  //     } else {
  //       yield ErrorLoginGoogle(response.message ?? 'Có lỗi xảy ra');
  //     }
  //   }
  //   catch(e){
  //     yield ErrorLoginGoogle(MESSAGES.CONNECT_ERROR);
  //     throw e;
  //   }
  // }


  static LoginGoogleBloc of(BuildContext context) => BlocProvider.of<LoginGoogleBloc>(context);
}