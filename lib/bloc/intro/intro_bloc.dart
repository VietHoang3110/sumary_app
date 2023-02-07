

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/src_index.dart';

import '../../api_resfull/user_repository.dart';


part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState>{
  final UserRepository userRepository;

  IntroBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitIntroState());

  @override
  Stream<IntroState> mapEventToState(IntroEvent event) async* {
    if (event is InitIntroEvent) {
      yield* _getIntro();
    }
  }
  Stream<IntroState> _getIntro() async* {
    try {
      yield LoadingIntroState();
      final response = await userRepository.getFirstIntro();
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        yield UpdateIntroState(response.data);
      }
      else
        yield ErrorIntroState(response.message??"");
    } catch (e) {
      yield ErrorIntroState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    // LoadingApi().popLoading();
  }


  static IntroBloc of(BuildContext context) => BlocProvider.of<IntroBloc>(context);
}