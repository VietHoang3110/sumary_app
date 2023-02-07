

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/src_index.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/models/model_generator/detail_banking.dart';
import '../../src/models/model_generator/detail_productt.dart';


part 'detail_banking_event.dart';
part 'detail_banking_state.dart';

class DetailDataBankingBloc extends Bloc<DetailDataBankingEvent, DetailDataBankingState>{
  final UserRepository userRepository;

  DetailDataBankingBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetDetailDataBankingState());

  @override
  Stream<DetailDataBankingState> mapEventToState(DetailDataBankingEvent event) async* {
    if (event is InitDetailDataBankingEvent) {
      yield* _getDetailBanking(event.id);
    }
  }
  Stream<DetailDataBankingState> _getDetailBanking(String id) async* {
    try {
      yield LoadingGetDetailDataBankingState();
      final response = await userRepository.getDetailBanking(id);
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        yield UpdateGetDetailDataBankingState(response.data!);
      }
      else
        yield ErrorGetDetailDataBankingState(response.message??"");
    } catch (e) {
      yield ErrorGetDetailDataBankingState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    // LoadingApi().popLoading();
  }


  static DetailDataBankingBloc of(BuildContext context) => BlocProvider.of<DetailDataBankingBloc>(context);
}