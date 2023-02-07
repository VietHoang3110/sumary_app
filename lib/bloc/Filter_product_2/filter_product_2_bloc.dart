import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sumary_app/api_resfull/user_repository.dart';
import 'package:sumary_app/src/src_index.dart';

import '../../src/models/model_generator/filter_product.dart';

part 'filter_product_2_event.dart';
part 'filter_product_2_state.dart';

class FilterProduct2Bloc extends Bloc<FilterProduct2Event, FilterProduct2State> {
  final UserRepository userRepository;

  FilterProduct2Bloc({required this.userRepository})
      : super(InProgressFilterProduct2State());

  @override
  void onTransition(Transition<FilterProduct2Event,FilterProduct2State> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<FilterProduct2State> mapEventToState(FilterProduct2Event event) async* {
    if (event is FilterProduct2Submitted) {
      try{
        yield InProgressFilterProduct2State();
        var response = await userRepository.getProductFilter2(data: event.data,id: event.id!);
        if (response.statusCode == BASE_URL.SUCCESS_200) {
          yield SuccessFilterProduct2State(message:  response.message!,data: response.data!);
        } else {
          yield FailureFilterProduct2State(message: response.message!);
        }
        // }
      }catch(e){
        // yield state.copyWith(gmessage: MESSAGES.CONNECT_ERROR);
        throw e;
      }
    }
  }
  static FilterProduct2Bloc of(BuildContext context) => BlocProvider.of<FilterProduct2Bloc>(context);
}
