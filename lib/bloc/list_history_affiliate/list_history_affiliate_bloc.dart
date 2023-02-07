import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/list_history_affiliate.dart';
import 'package:sumary_app/src/models/model_generator/list_issue.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/messages.dart';
import '../../src/models/model_generator/list_history_recharge.dart';
import '../../src/models/model_generator/list_history_wallet.dart';
import '../../widgets/loading_api.dart';

part 'list_history_affiliate_event.dart';
part 'list_history_affiliate_state.dart';

class ListHistoryAffiliateBloc extends Bloc<ListHistoryAffiliateEvent, ListHistoryAffiliateState>{
  final UserRepository userRepository;

  ListHistoryAffiliateBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetListHistoryAffiliateState());

  @override
  Stream<ListHistoryAffiliateState> mapEventToState(ListHistoryAffiliateEvent event) async* {
    if (event is InitGetListHistoryAffiliateEvent) {
      yield* _getListHistoryAffiliate(type:event.type,page:event.page,pageSize:event.pageSize);
    }
  }

  List<DataHistoryAffiliate> listHistoryAffiliate=[];

  Stream<ListHistoryAffiliateState> _getListHistoryAffiliate({required String type,required int page, required int pageSize }) async* {
    // LoadingApi().pushLoading();
    try {
      // yield InitGetListHistoryAffiliateState();
      if(page==1){
        yield InitGetListHistoryAffiliateState();
      }
      final response = await userRepository.getListHistoryAffiliate(type,page, pageSize);
      if(response.statusCode == BASE_URL.SUCCESS_200){
        // yield UpdateGetListHistoryAffiliateState(response.data!.records!);
        if(page == 1){
          listHistoryAffiliate=response.data!.records!;
          yield UpdateGetListHistoryAffiliateState(response.data!.records!);
        }
        else{
          listHistoryAffiliate=[...listHistoryAffiliate,...response.data!.records!];
          yield UpdateGetListHistoryAffiliateState(listHistoryAffiliate);
        }
      }
      else
        yield ErrorGetListHistoryAffiliateState(response.message ?? '');
    } catch (e) {
      yield ErrorGetListHistoryAffiliateState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    // LoadingApi().popLoading();
  }


  static ListHistoryAffiliateBloc of(BuildContext context) => BlocProvider.of<ListHistoryAffiliateBloc>(context);
}