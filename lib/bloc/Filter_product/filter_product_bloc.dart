import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sumary_app/api_resfull/user_repository.dart';
import 'package:sumary_app/src/src_index.dart';

import '../../src/models/model_generator/filter_product.dart';

part 'filter_product_event.dart';
part 'filter_product_state.dart';

class FilterProductBloc extends Bloc<FilterProductEvent, FilterProductState> {
  final UserRepository userRepository;

  FilterProductBloc({required this.userRepository})
      : super(InProgressFilterProductState());

  @override
  void onTransition(Transition<FilterProductEvent,FilterProductState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<FilterProductState> mapEventToState(FilterProductEvent event) async* {
    if (event is FilterProductSubmitted) {
      try{
        yield InProgressFilterProductState();
        var response = await userRepository.getProductFilter(data: event.data,id: event.id!);
        if (response.statusCode == BASE_URL.SUCCESS_200) {
          yield SuccessFilterProductState(message:  response.message!,data: response.data!);
        } else {
          yield FailureFilterProductState(message: response.message!);
        }
        // }
      }catch(e){
        // yield state.copyWith(gmessage: MESSAGES.CONNECT_ERROR);
        throw e;
      }
    }
  }
  static FilterProductBloc of(BuildContext context) => BlocProvider.of<FilterProductBloc>(context);
}
