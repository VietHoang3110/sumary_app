

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/search_popular.dart';
import 'package:sumary_app/src/src_index.dart';

import '../../api_resfull/user_repository.dart';



part 'search_popular_event.dart';
part 'search_popular_state.dart';

class SearchPopularBloc extends Bloc<SearchPopularEvent, SearchPopularState>{
  final UserRepository userRepository;

  SearchPopularBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitSearchPopularState());

  @override
  Stream<SearchPopularState> mapEventToState(SearchPopularEvent event) async* {
    if (event is InitSearchPopularEvent) {
      yield* _getSearchPopular();
    }
  }

  Stream<SearchPopularState> _getSearchPopular() async* {
    // LoadingApi().pushLoading();
    try {
      final response = await userRepository.getSearchPopular();
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        yield UpdateSearchPopularState(response.data!);
      }
      else
        yield ErrorSearchPopularState(response.message??"");
    } catch (e) {
      yield ErrorSearchPopularState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    // LoadingApi().popLoading();
  }


  static SearchPopularBloc of(BuildContext context) => BlocProvider.of<SearchPopularBloc>(context);
}