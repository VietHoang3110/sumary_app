import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/list_history_appellation_received.dart';
import 'package:sumary_app/src/models/model_generator/list_issue.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/messages.dart';
import '../../src/models/model_generator/list_history_recharge.dart';
import '../../src/models/model_generator/list_history_wallet.dart';

part 'list_history_appellation_event.dart';
part 'list_history_appellation_state.dart';

class ListHistoryAppellationBloc extends Bloc<ListHistoryAppellationEvent, ListHistoryAppellationState>{
  final UserRepository userRepository;

  ListHistoryAppellationBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetListHistoryRechargeState());

  @override
  Stream<ListHistoryAppellationState> mapEventToState(ListHistoryAppellationEvent event) async* {
    if (event is InitGetListHistoryAppellationEvent) {
      yield* _getListHistoryAppellation(type:event.type,page:event.page,pageSize:event.pageSize);
    }
  }

  List<DataHistoryAppellation> listHistoryAppellation=[];

  Stream<ListHistoryAppellationState> _getListHistoryAppellation({required String type,required int page, required int pageSize }) async* {
    // LoadingApi().pushLoading();
    try {
      if(page==1){
        yield InitGetListHistoryRechargeState();
      }
      final response = await userRepository.getListHistoryAppellation(type,page, pageSize);
      if(response.statusCode == BASE_URL.SUCCESS_200){
        if(page == 1){
          listHistoryAppellation=response.data!.records!;
          yield UpdateGetListHistoryAppellationState(response.data!.records!);
        }
        else{
          listHistoryAppellation=[...listHistoryAppellation,...response.data!.records!];
          yield UpdateGetListHistoryAppellationState(listHistoryAppellation);
        }
      }
      else
        yield ErrorGetListHistoryAppellationState(response.message ?? '');
    } catch (e) {
      yield ErrorGetListHistoryAppellationState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    // LoadingApi().popLoading();
  }


  static ListHistoryAppellationBloc of(BuildContext context) => BlocProvider.of<ListHistoryAppellationBloc>(context);
}