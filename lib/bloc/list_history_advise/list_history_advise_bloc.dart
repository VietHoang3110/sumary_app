import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/list_history_affiliate.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/messages.dart';
import '../../src/models/model_generator/list_history_advise.dart';

part 'list_history_advise_event.dart';
part 'list_history_advise_state.dart';

class ListHistoryAdviseBloc extends Bloc<ListHistoryAdviseEvent, ListHistoryAdviseState>{
  final UserRepository userRepository;

  ListHistoryAdviseBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetListHistoryAdviseState());

  @override
  Stream<ListHistoryAdviseState> mapEventToState(ListHistoryAdviseEvent event) async* {
    if (event is InitGetListHistoryAdviseEvent) {
      yield* _getListHistoryAdvise(page:event.page,pageSize:event.pageSize);
    }
  }

  List<DataHistoryAdvise> listHistoryAdvise=[];

  Stream<ListHistoryAdviseState> _getListHistoryAdvise({required int page, required int pageSize }) async* {
    // LoadingApi().pushLoading();
    try {
      if(page==1){
        yield InitGetListHistoryAdviseState();
      }
      final response = await userRepository.getListHistoryAdvise(page, pageSize);
      if(response.statusCode == BASE_URL.SUCCESS_200){
        if(page == 1){
          listHistoryAdvise=response.data!.records!;
          yield UpdateGetListHistoryAdviseState(response.data!.records!);
        }
        else{
          listHistoryAdvise=[...listHistoryAdvise,...response.data!.records!];
          yield UpdateGetListHistoryAdviseState(listHistoryAdvise);
        }
      }
      else
        yield ErrorGetListHistoryAdviseState(response.message ?? '');
    } catch (e) {
      yield ErrorGetListHistoryAdviseState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    // LoadingApi().popLoading();
  }


  static ListHistoryAdviseBloc of(BuildContext context) => BlocProvider.of<ListHistoryAdviseBloc>(context);
}