import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sumary_app/api_resfull/user_repository.dart';
import 'package:sumary_app/src/src_index.dart';

import '../../api_resfull/api.dart';

part 'create_advise_event.dart';
part 'create_advise_state.dart';

class CreateAdviseBloc extends Bloc<CreateAdviseEvent, CreateAdviseState> {
  final UserRepository userRepository;

  CreateAdviseBloc({required this.userRepository})
      : super(InProgressCreateAdvideState());

  @override
  void onTransition(Transition<CreateAdviseEvent, CreateAdviseState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<CreateAdviseState> mapEventToState(CreateAdviseEvent event) async* {
    if (event is CreateAdviseSubmitted) {
      try{
        yield InProgressCreateAdvideState();
        var response = await userRepository.createAdvise(name: event.name, issueType: event.issueType, appointmentDate: event.appointmentDate,phoneNumber: event.phoneNumber, email: event.email, content: event.content, note: event.note);
        if (response.statusCode == BASE_URL.SUCCESS_200) {
          yield SuccessCreateAdvideState(message:  response.message!);
        } else {
          yield FailureCreateAdvideState(message: response.message!);
        }
      }catch(e){
        yield FailureCreateAdvideState(message: MESSAGES.CONNECT_ERROR);
        throw e;
      }
    }
  }

  static CreateAdviseBloc of(BuildContext context) => BlocProvider.of<CreateAdviseBloc>(context);
}
