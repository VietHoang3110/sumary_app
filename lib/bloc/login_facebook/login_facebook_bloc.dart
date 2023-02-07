import 'dart:async';
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../api_resfull/dio_provider.dart';
import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/messages.dart';
import '../../src/preferences_key.dart';
import '../../storages/event_repository_storage.dart';
import '../../storages/share_local.dart';


part 'login_facebook_event.dart';
part 'login_facebook_state.dart';

class LoginFacebookBloc extends Bloc<LoginFacebookEvent, LoginFacebookState> {
  final UserRepository userRepository;
  final EventRepositoryStorage localRepository;

  LoginFacebookBloc( {required this.userRepository,required this.localRepository}) : super(InitLoginFacebook());

  @override
  void onTransition(Transition<LoginFacebookEvent, LoginFacebookState> transition) {
    super.onTransition(transition);
  }
  @override
  Stream<LoginFacebookState> mapEventToState(LoginFacebookEvent event) async* {
    if(event is LoginFacebookSubmitted){
      yield* _mapLoginFaceBookState( token: event.token);
    }
  }
  Stream<LoginFacebookState> _mapLoginFaceBookState({required String token}) async*{
    try{
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      final tokenFirebase = await messaging.getToken() as String;
      final response = await userRepository.loginAppFacebook(token: token, token_device: tokenFirebase);
      if(response.statusCode == BASE_URL.SUCCESS_200){
        print('aaaaa1 ${response.data.token}');
        await localRepository.saveUser(jsonEncode(response));
        await shareLocal.putString(PreferencesKey.TOKEN, response.data.token);
        await shareLocal.putString(dotenv.env[PreferencesKey.TOKEN]!, response.data.token);
        await shareLocal.putString(PreferencesKey.LOGIN_TYPE, "Facebook");
        DioProvider.instance(token: response.data.token);
        yield const UpdateLoginFacebook();
      } else {
        yield ErrorLoginFacebook(response.message ?? 'Có lỗi xảy ra');
      }
    }
    catch(e){
      yield ErrorLoginFacebook(MESSAGES.CONNECT_ERROR);
      throw e;
    }
  }


  static LoginFacebookBloc of(BuildContext context) => BlocProvider.of<LoginFacebookBloc>(context);
}