import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/api_resfull/user_repository.dart';
import 'package:sumary_app/src/src_index.dart';

part 'like_rate_event.dart';
part 'like_rate_state.dart';

class LikeRateBloc extends Bloc<LikeRateEvent, LikeRateState> {
  final UserRepository userRepository;

  LikeRateBloc({required this.userRepository})
      : super(InProgressLikeRateState());

  @override
  void onTransition(Transition<LikeRateEvent, LikeRateState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<LikeRateState> mapEventToState(LikeRateEvent event) async* {
    if (event is LikeRateSubmitted) {
      try{
        yield InProgressLikeRateState();
        // if (state.status.isValidated) {
        var response = await userRepository.likeRate(id: event.id);
        if (response.statusCode == BASE_URL.SUCCESS_200) {
          yield SuccessLikeRateState(message:  response.message!);
        } else {
          yield SuccessLikeRateState(message: response.message!);
          // yield state.copyWith(status: FormzStatus.submissionFailure, message: response.message);
        }
        // }
      }catch(e){
        yield FailureLikeRateState(message: MESSAGES.CONNECT_ERROR);
        throw e;
      }
    }
  }

  static LikeRateBloc of(BuildContext context) => BlocProvider.of<LikeRateBloc>(context);
}
