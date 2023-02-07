import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sumary_app/api_resfull/user_repository.dart';
import 'package:sumary_app/src/src_index.dart';

part 'buy_book.event.dart';
part 'buy_book_state.dart';

class BuyBookBloc extends Bloc<BuyBookEvent, BuyBookState> {
  final UserRepository userRepository;

  BuyBookBloc({required this.userRepository})
      : super(InProgressBuyBookState());

  @override
  void onTransition(Transition<BuyBookEvent, BuyBookState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<BuyBookState> mapEventToState(BuyBookEvent event) async* {
    if (event is BuyBookSubmitted) {
      try{
        yield InProgressBuyBookState();
        var response = await userRepository.buyBook(id: event.id, payment_type: event.payment_type);
        if (response.statusCode == BASE_URL.SUCCESS_200) {
          yield SuccessBuyBookState(message:  response.message!);
        } else {
          yield FailureBuyBookState(message: response.message!);
        }
      }catch(e){
        yield FailureBuyBookState(message: MESSAGES.CONNECT_ERROR);
        throw e;
      }
    }
  }
  static BuyBookBloc of(BuildContext context) => BlocProvider.of<BuyBookBloc>(context);
}
