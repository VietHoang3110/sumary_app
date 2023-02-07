
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/list_top_view.dart';
import 'package:sumary_app/widgets/loading_api.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/src_index.dart';

part 'list_book_recommend_event.dart';
part 'list_book_recommend_state.dart';


class ListBookRecommendBloc extends Bloc<ListBookRecommendEvent, ListBookRecommendState>{
  final UserRepository userRepository;

  ListBookRecommendBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetListBookRecommendState());

  @override
  Stream<ListBookRecommendState> mapEventToState(ListBookRecommendEvent event) async* {
    if (event is InitGetListBookRecommendEvent) {
      yield* _getListBookRecommend();
    }
  }

  Stream<ListBookRecommendState> _getListBookRecommend() async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingListBookRecommendState();
      final response = await userRepository.getListBookRecommend();
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        yield UpdateGetListBookRecommendState(response.data);
      }
      else
        yield ErrorGetListBookRecommendState(response.message ?? "");
    } catch (e) {
      yield ErrorGetListBookRecommendState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static ListBookRecommendBloc of(BuildContext context) => BlocProvider.of<ListBookRecommendBloc>(context);
}