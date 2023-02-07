import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sumary_app/api_resfull/user_repository.dart';
import 'package:sumary_app/src/src_index.dart';

part 'create_ask_event.dart';
part 'create_ask_state.dart';

class CreateAskBloc extends Bloc<CreateAskEvent, CreateAskState> {
  final UserRepository userRepository;

  CreateAskBloc({required this.userRepository})
      : super(InProgressCreateAskState());

  @override
  void onTransition(Transition<CreateAskEvent, CreateAskState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<CreateAskState> mapEventToState(CreateAskEvent event) async* {
    if (event is CreateAskSubmitted) {
      try{
        yield InProgressCreateAskState();
        // if (state.status.isValidated) {
        var response = await userRepository.createAsk(id: event.id, name: event.name, question: event.question);
        if (response.statusCode == BASE_URL.SUCCESS_200) {
          yield SuccessCreateAskState(message:  response.message!);
        } else {
          yield FailureCreateAskState(message: response.message!);
          // yield state.copyWith(status: FormzStatus.submissionFailure, message: response.message);
        }
        // }
      }catch(e){
        // yield state.copyWith(message: MESSAGES.CONNECT_ERROR);
        throw e;
      }
    }
  }
  static CreateAskBloc of(BuildContext context) => BlocProvider.of<CreateAskBloc>(context);
}
