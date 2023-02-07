
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/loading_api.dart';

import '../../api_resfull/user_repository.dart';

part 'unread_notifi_event.dart';
part 'unread_notifi_state.dart';

class UnreadNotifiBloc extends Bloc<GetUnreadNotifiEvent, UnreadNotifiState>{
  final UserRepository userRepository;

  UnreadNotifiBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitUnreadNotifiState());

  @override
  Stream<UnreadNotifiState> mapEventToState(GetUnreadNotifiEvent event) async* {
    if (event is InitGetUnreadNotifiEvent) {
      yield* _getUnreadNotifi();
    }
  }
  Stream<UnreadNotifiState> _getUnreadNotifi() async* {
    // LoadingApi().pushLoading();
    try {
      yield LoadingUnreadNotifiState();
      final response = await userRepository.getUnreadNotifi();
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        yield UpdateUnreadNotifiState(response.data);
      }
      else
        yield ErrorUnreadNotifiState(response.message ?? "");
    } catch (e) {
      yield ErrorUnreadNotifiState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    // LoadingApi().popLoading();
  }
  static UnreadNotifiBloc of(BuildContext context) => BlocProvider.of<UnreadNotifiBloc>(context);
}