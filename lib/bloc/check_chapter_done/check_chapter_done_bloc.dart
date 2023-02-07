import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sumary_app/api_resfull/user_repository.dart';
import 'package:sumary_app/src/src_index.dart';

part 'check_chapter_done_event.dart';
part 'check_chapter_done_state.dart';

class CheckChapterDoneBloc extends Bloc<CheckChapterDoneEvent, CheckChapterDoneState> {
  final UserRepository userRepository;

  CheckChapterDoneBloc({required this.userRepository})
      : super(InProgressCheckChapterDoneState());

  @override
  void onTransition(Transition<CheckChapterDoneEvent, CheckChapterDoneState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<CheckChapterDoneState> mapEventToState(CheckChapterDoneEvent event) async* {
    if (event is DoneChapterSubmitted) {
      try{
        yield InProgressCheckChapterDoneState();
        // if (state.status.isValidated) {
        var response = await userRepository.checkChapterDone(id: event.id, chapter: event.chapter);
        if (response.statusCode == BASE_URL.SUCCESS_200) {
          yield SuccessCheckChapterDoneState(message:  response.message!);
        } else {
          yield FailureCheckChapterDoneState(message: response.message!);
          // yield state.copyWith(status: FormzStatus.submissionFailure, message: response.message);
        }
        // }
      }catch(e){
        // yield state.copyWith(message: MESSAGES.CONNECT_ERROR);
        throw e;
      }
    }
  }
  static CheckChapterDoneBloc of(BuildContext context) => BlocProvider.of<CheckChapterDoneBloc>(context);
}
