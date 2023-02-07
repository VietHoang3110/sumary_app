
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/list_product.dart';
import 'package:sumary_app/widgets/loading_api.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/models/model_generator/list_product.dart';
import '../../src/src_index.dart';

part 'list_product_by_categories_1_event.dart';
part 'list_product_by_categories_1_state.dart';


class GetListProductByCategories1Bloc extends Bloc<GetListProductByCategories1Event, ListProductByCategories1State>{
  final UserRepository userRepository;

  GetListProductByCategories1Bloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetListProductByCategories1State());

  @override
  Stream<ListProductByCategories1State> mapEventToState(GetListProductByCategories1Event event) async* {
    if (event is InitGetListProductByCategories1Event) {
      yield* _getListProducts(
          catId1: event.catId1, catId2: event.catId2,
          catId3: event.catId3, page: event.page,
          pageSize: event.pageSize,
          type: event.type,
          sortBy: event.sortBy
      );
    }
  }
  Stream<ListProductByCategories1State> _getListProducts(
      {required String catId1, required String catId2, required String catId3,
        required int page, required int pageSize,
        required String type,required String sortBy}) async* {
    try {
      yield LoadingListProductByCategories1State();
      final response = await userRepository.getListProduct(catId1, catId2, catId3, page, pageSize);
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        yield UpdateGetListProductByCategories1State(response.data!.records);
      }
      else
        yield ErrorGetListProductByCategories1State(response.message ?? '');
    } catch (e) {
      yield ErrorGetListProductByCategories1State(MESSAGES.CONNECT_ERROR);
      throw e;
    }
  }


  static GetListProductByCategories1Bloc of(BuildContext context) => BlocProvider.of<GetListProductByCategories1Bloc>(context);
}