

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/src_index.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/models/model_generator/search.dart';


part 'search_state.dart';
part 'search_event.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState>{
  final UserRepository userRepository;

  SearchBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetDataSearchState());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is InitDetailProductEvent) {
      yield* _getSearch(event.page, event.pageSize, event.name, event.translator);
    }
  }

  Stream<SearchState> _getSearch(int page,int pageSize,String name, String translator) async* {
    // LoadingApi().pushLoading();
    try {
      final response = await userRepository.getSearch(page, pageSize, name, translator);
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        yield UpdateGetDataSearchState(response.data!);
      }
      else
        yield ErrorGetDataSearchState(response.message??"");
    } catch (e) {
      yield ErrorGetDataSearchState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    // LoadingApi().popLoading();
  }


  static SearchBloc of(BuildContext context) => BlocProvider.of<SearchBloc>(context);
}