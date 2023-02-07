import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/list_issue.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/messages.dart';
import '../../src/models/model_generator/list_history_wallet.dart';
import '../../widgets/loading_api.dart';

part 'list_history_wallet_event.dart';
part 'list_history_wallet_state.dart';

class ListHistoryWalletBloc extends Bloc<ListHistoryWalletEvent, ListHistoryWalletState>{
  final UserRepository userRepository;

  ListHistoryWalletBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetListHistoryWalletState());

  @override
  Stream<ListHistoryWalletState> mapEventToState(ListHistoryWalletEvent event) async* {
    if (event is InitGetListHistoryWalletEvent) {
      yield* _getListHistoryWallet(type:event.type,page:event.page,pageSize:event.pageSize);
    }
  }

  List<DataHistoryWallet> listHistoryWallet=[];

  Stream<ListHistoryWalletState> _getListHistoryWallet({required String type,required int page, required int pageSize }) async* {
    // LoadingApi().pushLoading();
    // yield InitGetListHistoryWalletState();
    try {
      if(page==1){
        yield LoadingGetListHistoryWalletState();
      }
      final response = await userRepository.getListHistoryWallet(type,page, pageSize);
      if(response.statusCode == BASE_URL.SUCCESS_200){
        // yield UpdateGetListHistoryWalletState(response.data!.records!);
        if(page == 1){
          listHistoryWallet=response.data!.records!;
          yield UpdateGetListHistoryWalletState(response.data!.records!);
        }
        else{
          listHistoryWallet=[...listHistoryWallet,...response.data!.records!];
          yield UpdateGetListHistoryWalletState(listHistoryWallet);
        }
      }
      else
        yield ErrorGetListHistoryWalletState(response.message ?? '');
    } catch (e) {
      yield ErrorGetListHistoryWalletState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    // LoadingApi().popLoading();
  }


  static ListHistoryWalletBloc of(BuildContext context) => BlocProvider.of<ListHistoryWalletBloc>(context);
}