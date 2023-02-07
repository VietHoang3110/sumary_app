import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/messages.dart';
import '../../src/models/model_generator/category_select.dart';
import '../../src/models/model_generator/list_category.dart';

part 'fitlter_category_event.dart';
part 'fitlter_category_state.dart';

class CategorySelectBloc extends Bloc<CategorySelectEvent, CategorySelectState>{
  final UserRepository userRepository;

  CategorySelectBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitCategorySelectState());

  @override
  Stream<CategorySelectState> mapEventToState(CategorySelectEvent event) async* {
    if (event is InitCategorySelectEvent) {
      yield* _getCategories();
    }
  }
  Stream<CategorySelectState> _getCategories() async* {
    // LoadingApi().pushLoading();
    try {
      final response = await userRepository.getCategorySelect();
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        yield UpdateCategorySelectState(response.data!);
      }
      else
        yield ErrorCategorySelectState(response.message ?? '');
    } catch (e) {
      yield ErrorCategorySelectState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    // LoadingApi().popLoading();
  }


  static CategorySelectBloc of(BuildContext context) => BlocProvider.of<CategorySelectBloc>(context);
}