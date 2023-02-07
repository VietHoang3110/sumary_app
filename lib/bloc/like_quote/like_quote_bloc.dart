import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/api_resfull/user_repository.dart';
import 'package:sumary_app/src/src_index.dart';

part 'like_quote_state.dart';
part 'like_quote_event.dart';

class LikeQuoteBloc extends Bloc<LikeQuoteEvent, LikeQuoteState> {
  final UserRepository userRepository;

  LikeQuoteBloc({required this.userRepository})
      : super(InProgressLikeQuoteState());

  @override
  void onTransition(Transition<LikeQuoteEvent, LikeQuoteState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<LikeQuoteState> mapEventToState(LikeQuoteEvent event) async* {
    if (event is LikeQuoteSubmitted) {
      try{
        yield InProgressLikeQuoteState();
        // if (state.status.isValidated) {
        var response = await userRepository.likeQuote(id: event.id);
        if (response.statusCode == BASE_URL.SUCCESS_200) {
          yield SuccessLikeQuoteState(message:  response.message!);
        } else {
          yield FailureLikeQuoteState(message: response.message!);
          // yield state.copyWith(status: FormzStatus.submissionFailure, message: response.message);
        }
        // }
      }catch(e){
        yield FailureLikeQuoteState(message: MESSAGES.CONNECT_ERROR);
        throw e;
      }
    }
  }

  static LikeQuoteBloc of(BuildContext context) => BlocProvider.of<LikeQuoteBloc>(context);
}
