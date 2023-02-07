import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/api_resfull/user_repository.dart';
import 'package:sumary_app/src/src_index.dart';

part 'save_quote_state.dart';
part 'save_quote_event.dart';

class SaveQuoteBloc extends Bloc<SaveQuoteEvent, SaveQuoteState> {
  final UserRepository userRepository;

  SaveQuoteBloc({required this.userRepository})
      : super(InProgressSaveQuoteState());

  @override
  void onTransition(Transition<SaveQuoteEvent, SaveQuoteState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<SaveQuoteState> mapEventToState(SaveQuoteEvent event) async* {
    if (event is SaveQuoteSubmitted) {
      try{
        yield InProgressSaveQuoteState();
        // if (state.status.isValidated) {
        var response = await userRepository.likeQuote(id: event.id);
        if (response.statusCode == BASE_URL.SUCCESS_200) {
          yield SuccessSaveQuoteState(message:  response.message!);
        } else {
          yield FailureSaveQuoteState(message: response.message!);
          // yield state.copyWith(status: FormzStatus.submissionFailure, message: response.message);
        }
        // }
      }catch(e){
        yield FailureSaveQuoteState(message: MESSAGES.CONNECT_ERROR);
        throw e;
      }
    }
  }

  static SaveQuoteBloc of(BuildContext context) => BlocProvider.of<SaveQuoteBloc>(context);
}
