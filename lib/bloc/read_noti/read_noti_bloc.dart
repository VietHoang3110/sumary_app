import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sumary_app/api_resfull/user_repository.dart';
import 'package:sumary_app/src/src_index.dart';

part 'read_noti_event.dart';
part 'read_noti_state.dart';

class ReadNotiBloc extends Bloc<ReadNotiEvent, ReadNotiState> {
  final UserRepository userRepository;

  ReadNotiBloc({required this.userRepository})
      : super(InProgressReadNotiState());

  @override
  void onTransition(Transition<ReadNotiEvent, ReadNotiState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<ReadNotiState> mapEventToState(ReadNotiEvent event) async* {
    if (event is ReadNotiEventSubmitted) {
      try{
        yield InProgressReadNotiState();
        var response = await userRepository.readNotification(event.id);
        if (response.statusCode == BASE_URL.SUCCESS_200) {
          yield SuccessReadNotiState(message:  response.message!);
        } else {
          yield FailureReadNotiState(message: response.message!);
        }
      }catch(e){
        throw e;
      }
    }
  }
  static ReadNotiBloc of(BuildContext context) => BlocProvider.of<ReadNotiBloc>(context);
}
