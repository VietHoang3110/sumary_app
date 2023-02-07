import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/list_issue.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/messages.dart';
import '../../src/models/model_generator/list_history_recharge.dart';
import '../../src/models/model_generator/list_history_wallet.dart';

part 'list_history_recharge_event.dart';
part 'list_history_recharge_state.dart';

class ListHistoryRechargeBloc extends Bloc<ListHistoryRechargeEvent, ListHistoryRechargeState>{
  final UserRepository userRepository;

  ListHistoryRechargeBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetListHistoryRechargeState());

  @override
  Stream<ListHistoryRechargeState> mapEventToState(ListHistoryRechargeEvent event) async* {
    if (event is InitGetListHistoryRechargeEvent) {
      yield* _getListHistoryRecharge(type:event.type,page:event.page,pageSize:event.pageSize);
    }
  }

  List<DataHistoryRecharge> listHistoryRecharge=[];

  Stream<ListHistoryRechargeState> _getListHistoryRecharge({required String type,required int page, required int pageSize }) async* {
    // LoadingApi().pushLoading();
    try {
      if(page==1){
        yield InitGetListHistoryRechargeState();
      }
      final response = await userRepository.getListHistoryRecharge(type,page, pageSize);
      if(response.statusCode == BASE_URL.SUCCESS_200){
        // yield UpdateGetListHistoryRechargeState(response.data!.records!);
        if(page == 1){
          listHistoryRecharge=response.data!.records!;
          yield UpdateGetListHistoryRechargeState(response.data!.records!);
        }
        else{
          listHistoryRecharge=[...listHistoryRecharge,...response.data!.records!];
          yield UpdateGetListHistoryRechargeState(listHistoryRecharge);
        }
      }
      else
        yield ErrorGetListHistoryRechargeState(response.message ?? '');
    } catch (e) {
      yield ErrorGetListHistoryRechargeState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    // LoadingApi().popLoading();
  }


  static ListHistoryRechargeBloc of(BuildContext context) => BlocProvider.of<ListHistoryRechargeBloc>(context);
}