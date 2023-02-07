import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/list_issue.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/messages.dart';
import '../../src/models/model_generator/list_data_banking.dart';

part 'list_data_banking_event.dart';
part 'list_data_banking_state.dart';

class ListDataBankingBloc extends Bloc<ListDataBankingEvent, ListDataBankingState>{
  final UserRepository userRepository;

  ListDataBankingBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetListDataBankingState());

  @override
  Stream<ListDataBankingState> mapEventToState(ListDataBankingEvent event) async* {
    if (event is InitGetListDataBankingEvent) {
      yield* _getListDataBanking();
    }
  }
  Stream<ListDataBankingState> _getListDataBanking() async* {
    // LoadingApi().pushLoading();
    try {
      final response = await userRepository.getListDataBanking();
      if(response.statusCode == BASE_URL.SUCCESS_200){
        yield UpdateGetListDataBankingState(response.data!);
      }
      else
        yield ErrorGetListDataBankingState(response.message ?? '');
    } catch (e) {
      yield ErrorGetListDataBankingState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    // LoadingApi().popLoading();
  }


  static ListDataBankingBloc of(BuildContext context) => BlocProvider.of<ListDataBankingBloc>(context);
}