import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sumary_app/api_resfull/user_repository.dart';
import 'package:sumary_app/src/src_index.dart';

part 'buy_rank_member_event.dart';
part 'buy_rank_member_state.dart';

class BuyRankMemberBloc extends Bloc<BuyRankMemberEvent, BuyRankMemberState> {
  final UserRepository userRepository;

  BuyRankMemberBloc({required this.userRepository})
      : super(InProgressBuyRankMemberState());

  @override
  void onTransition(Transition<BuyRankMemberEvent, BuyRankMemberState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<BuyRankMemberState> mapEventToState(BuyRankMemberEvent event) async* {
    if (event is BuyRankMemberSubmitted) {
      try{
        yield InProgressBuyRankMemberState();
        // if (state.status.isValidated) {
        var response = await userRepository.buyRankMember(mid: event.mid);
        if (response.statusCode == BASE_URL.SUCCESS_200) {
          yield SuccessBuyRankMemberState(message:  response.message!);
        } else {
          yield FailureBuyRankMemberState(message: response.message!);
          // yield state.copyWith(status: FormzStatus.submissionFailure, message: response.message);
        }
        // }
      }catch(e){
        yield FailureBuyRankMemberState(message: MESSAGES.CONNECT_ERROR);
        throw e;
      }
    }
  }

  static BuyRankMemberBloc of(BuildContext context) => BlocProvider.of<BuyRankMemberBloc>(context);
}
