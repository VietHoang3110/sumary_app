
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/list_ask.dart';
import 'package:sumary_app/src/models/model_generator/list_book_saved.dart';
import 'package:sumary_app/widgets/loading_api.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/models/model_generator/get_rank_member.dart';
import '../../src/src_index.dart';

part 'my_rank_member_event.dart';
part 'my_rank_member_state.dart';


class MyRankBloc extends Bloc<MyRankEvent, MyRankState>{
  final UserRepository userRepository;

  MyRankBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetMyRankState());

  @override
  Stream<MyRankState> mapEventToState(MyRankEvent event) async* {
    if (event is InitGetMyRankEvent) {
      yield* _getMyRank();
    }
  }
  Stream<MyRankState> _getMyRank() async* {
    // LoadingApi().pushLoading();
    try {
      yield LoadingMyRankState();
      final response = await userRepository.getMyRank();
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        yield UpdateGetMyRankState(response.data!);
      }
      else
        yield ErrorGetMyRankState(response.message ?? "");
    } catch (e) {
      yield ErrorGetMyRankState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    // LoadingApi().popLoading();
  }


  static MyRankBloc of(BuildContext context) => BlocProvider.of<MyRankBloc>(context);
}