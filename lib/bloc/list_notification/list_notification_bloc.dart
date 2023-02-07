
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/messages.dart';
import '../../src/models/model_generator/list_notification.dart';
import '../../widgets/loading_api.dart';

part 'list_notification_event.dart';
part 'list_notification_state.dart';

class GetListNotificationBloc extends Bloc<GetListNotificationEvent, ListNotificationState>{
  final UserRepository userRepository;

  GetListNotificationBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetListNotificationState());

  @override
  Stream<ListNotificationState> mapEventToState(GetListNotificationEvent event) async* {
    if (event is InitGetListNotificationEvent) {
      yield* _getListNotification(page:event.page,pageSize:event.pageSize,isLoadMore: event.isLoadMore);
    }
  }

  List<DataNotification> listBookNotification=[];

  Stream<ListNotificationState> _getListNotification({required int page, required int pageSize,bool? isLoadMore = false }) async* {
    // LoadingApi().pushLoading();
    try {
      if(page==1){
        yield LoadingListNotificationState();
      }
      final response = await userRepository.getListNotification(page, pageSize);
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        if(page==1){
          listBookNotification=response.data!.records!;
          yield UpdateGetListNotificationState(response.data!.records!);
        }
        else{
          listBookNotification=[...listBookNotification,...response.data!.records!];
          yield UpdateGetListNotificationState(listBookNotification);
        }
      }
      else {
        yield ErrorGetListNotificationState(response.message ?? '');
      }
    } catch (e) {
      yield ErrorGetListNotificationState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }

  static GetListNotificationBloc of(BuildContext context) => BlocProvider.of<GetListNotificationBloc>(context);
}