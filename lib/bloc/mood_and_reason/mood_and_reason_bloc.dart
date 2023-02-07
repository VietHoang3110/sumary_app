

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/mood_reason.dart';
import 'package:sumary_app/src/src_index.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/models/model_generator/detail_productt.dart';


part 'mood_and_reason_event.dart';
part 'mood_and_reason_state.dart';

class MoodAndReasonBloc extends Bloc<MoodAndReasonEvent, MoodAndReasonState>{
  final UserRepository userRepository;

  MoodAndReasonBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitMoodAndReasonState());

  @override
  Stream<MoodAndReasonState> mapEventToState(MoodAndReasonEvent event) async* {
    if (event is InitMoodAndReasonEvent) {
      yield* _getMoodAndReason();
    }
  }
  Stream<MoodAndReasonState> _getMoodAndReason() async* {
    // LoadingApi().pushLoading();
    try {
      final response = await userRepository.getMoodAndReason();
      yield LoadingMoodAndReasonState();
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        yield UpdateMoodAndReasonState(response.data);
      }
      else
        yield ErrorMoodAndReasonState(response.message??"");
    } catch (e) {
      yield ErrorMoodAndReasonState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    // LoadingApi().popLoading();
  }


  static MoodAndReasonBloc of(BuildContext context) => BlocProvider.of<MoodAndReasonBloc>(context);
}