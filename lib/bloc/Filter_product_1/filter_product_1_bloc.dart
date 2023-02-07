import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sumary_app/api_resfull/user_repository.dart';
import 'package:sumary_app/src/src_index.dart';

import '../../src/models/model_generator/filter_product.dart';

part 'filter_product_1_event.dart';
part 'filter_product_1_state.dart';

class FilterProduct1Bloc extends Bloc<FilterProduct1Event, FilterProduct1State> {
  final UserRepository userRepository;

  FilterProduct1Bloc({required this.userRepository})
      : super(InProgressFilterProduct1State());

  @override
  void onTransition(Transition<FilterProduct1Event,FilterProduct1State> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<FilterProduct1State> mapEventToState(FilterProduct1Event event) async* {
    if (event is FilterProduct1Submitted) {
      try{
        yield InProgressFilterProduct1State();
        var response = await userRepository.getProductFilter1(data: event.data,id: event.id!);
        if (response.statusCode == BASE_URL.SUCCESS_200) {
          yield SuccessFilterProduct1State(message:  response.message!,data: response.data!);
        } else {
          yield FailureFilterProduct1State(message: response.message!);
        }
        // }
      }catch(e){
        // yield state.copyWith(gmessage: MESSAGES.CONNECT_ERROR);
        throw e;
      }
    }
  }
  static FilterProduct1Bloc of(BuildContext context) => BlocProvider.of<FilterProduct1Bloc>(context);
}
