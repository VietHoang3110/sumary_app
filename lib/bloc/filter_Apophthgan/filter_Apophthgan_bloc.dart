import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/src_index.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/models/model_generator/filter_apophthgan.dart';


part 'filter_Apophthgan_event.dart';
part 'filter_Apophthgan_state.dart';

class FilterApophthganBloc extends Bloc<FilterApophthganEvent, FilterApophthganState>{
  final UserRepository userRepository;

  FilterApophthganBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitFilterApophthganState());

  @override
  Stream<FilterApophthganState> mapEventToState(FilterApophthganEvent event) async* {
    if (event is InitFilterApophthganEvent) {
      yield* _getMoodAndReason(event.mood,event.reason);
    }
  }

  Stream<FilterApophthganState> _getMoodAndReason(String mood,String reason) async* {
    // LoadingApi().pushLoading();
    try {
      final response = await userRepository.getApophthgan(mood,reason);
      yield LoadingFilterApophthganState();
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        yield UpdateFilterApophthganState(response.data!);
      }
      else
        yield ErrorFilterApophthganState(response.message??"");
    } catch (e) {
      yield ErrorFilterApophthganState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    // LoadingApi().popLoading();
  }


  static FilterApophthganBloc of(BuildContext context) => BlocProvider.of<FilterApophthganBloc>(context);
}