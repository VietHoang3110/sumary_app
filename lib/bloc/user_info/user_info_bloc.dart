import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/messages.dart';
import '../../src/models/model_generator/user_info.dart';
import '../../widgets/loading_api.dart';

part 'user_info_event.dart';
part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState>{
  final UserRepository userRepository;

  UserInfoBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitUserInfo());

  @override
  Stream<UserInfoState> mapEventToState(UserInfoEvent event) async* {
    if (event is InitUserInfoEvent) {
      yield* _getListChance();
    }
  }
  Stream<UserInfoState> _getListChance() async* {
    LoadingApi().pushLoading();
    try {
      final response = await userRepository.getUserInfo();
      yield LoadingUserInfoState();
      if(response.statusCode == BASE_URL.SUCCESS_200){
          yield UpdateUserInfoState(response.data!);
          print("infor: ${response.data!.name.toString()}");
      } else

        yield ErrorUserInfoState(response.message ?? '');

    } catch (e) {
      yield ErrorUserInfoState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }

  static UserInfoBloc of(BuildContext context) => BlocProvider.of<UserInfoBloc>(context);
}