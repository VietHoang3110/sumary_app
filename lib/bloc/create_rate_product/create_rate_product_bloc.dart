import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sumary_app/api_resfull/user_repository.dart';
import 'package:sumary_app/src/src_index.dart';

part 'create_rate_product_event.dart';
part 'create_rate_product_state.dart';

class CreateRateBloc extends Bloc<CreateRateEvent, CreateRateState> {
  final UserRepository userRepository;

  CreateRateBloc({required this.userRepository})
      : super(InProgressCreateRateState());

  @override
  void onTransition(Transition<CreateRateEvent, CreateRateState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<CreateRateState> mapEventToState(CreateRateEvent event) async* {
    if (event is CreateRateSubmitted) {
      try{
        yield InProgressCreateRateState();
        // if (state.status.isValidated) {
        var response = await userRepository.createRate(voiceStar: event.voiceStar, contentStar: event.contentStar, content: event.content, id: event.id);
        if (response.statusCode == BASE_URL.SUCCESS_200) {
          yield SuccessCreateRateState(message:  response.message!);
        } else {
          yield FailureCreateRateState(message: response.message!);
          // yield state.copyWith(status: FormzStatus.submissionFailure, message: response.message);
        }
        // }
      }catch(e){
        // yield state.copyWith(message: MESSAGES.CONNECT_ERROR);
        throw e;
      }
    }
  }
  static CreateRateBloc of(BuildContext context) => BlocProvider.of<CreateRateBloc>(context);
}
