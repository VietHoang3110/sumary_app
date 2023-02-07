import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sumary_app/widgets/loading_api.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/messages.dart';
import '../../src/models/model_generator/list_category.dart';
import '../../src/src_index.dart';
import '../../storages/share_local.dart';

part 'list_categories_event.dart';

part 'list_categories_state.dart';
class GetListCategoriesBloc extends Bloc<GetListCategoriesEvent, ListCategotiesState>{
  final UserRepository userRepository;

  GetListCategoriesBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetListCategotiesState());

  @override
  Stream<ListCategotiesState> mapEventToState(GetListCategoriesEvent event) async* {
    if (event is InitGetListCategoriesEvent) {
      yield* _getListCategories();
    }
  }

  // List<List<DataCategory>> listCategory=[];

  Stream<ListCategotiesState> _getListCategories() async* {
    LoadingApi().pushLoading();
    try {
        yield LoadingListCategotiesState();
      final response = await userRepository.getListCategories();
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        await shareLocal.putString(PreferencesKey.FIRST_TIME, "0");
        // yield UpdateGetListCategotiesState(response.data!.records!);
        //   listCategory=response.data!.records!;
        LoadingApi().popLoading();
          yield UpdateGetListCategotiesState(response.data!.records!);
      }
      else
        yield ErrorGetListCategotiesState(response.message ?? '');
    } catch (e) {
      yield ErrorGetListCategotiesState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    // LoadingApi().popLoading();
  }


  static GetListCategoriesBloc of(BuildContext context) => BlocProvider.of<GetListCategoriesBloc>(context);
}