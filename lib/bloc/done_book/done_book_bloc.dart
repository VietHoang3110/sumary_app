import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sumary_app/api_resfull/user_repository.dart';
import 'package:sumary_app/src/src_index.dart';

part 'done_book_event.dart';
part 'done_book_state.dart';

class DoneBookBloc extends Bloc<DoneBookEvent, DoneBookState> {
  final UserRepository userRepository;

  DoneBookBloc({required this.userRepository})
      : super(InProgressDoneBookState());

  @override
  void onTransition(Transition<DoneBookEvent, DoneBookState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<DoneBookState> mapEventToState(DoneBookEvent event) async* {
    if (event is DoneBookSubmitted) {
      try{
        yield InProgressDoneBookState();
        // if (state.status.isValidated) {
        var response = await userRepository.doneBook(id: event.id);
        if (response.statusCode == BASE_URL.SUCCESS_200) {
          yield SuccessDoneBookState(message:  response.message!);
        } else {
          yield FailureDoneBookState(message: response.message!);
          // yield state.copyWith(status: FormzStatus.submissionFailure, message: response.message);
        }
        // }
      }catch(e){
        // yield state.copyWith(message: MESSAGES.CONNECT_ERROR);
        throw e;
      }
    }
  }
  static DoneBookBloc of(BuildContext context) => BlocProvider.of<DoneBookBloc>(context);
}
