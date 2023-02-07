
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/list_product.dart';
import 'package:sumary_app/widgets/loading_api.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/models/model_generator/list_product.dart';
import '../../src/src_index.dart';

part 'list_product_by_categories_event.dart';
part 'list_product_by_categories_state.dart';


class GetListProductByCategoriesBloc extends Bloc<GetListProductByCategoriesEvent, ListProductByCategoriesState>{
  final UserRepository userRepository;

  GetListProductByCategoriesBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetListProductByCategoriesState());

  @override
  Stream<ListProductByCategoriesState> mapEventToState(GetListProductByCategoriesEvent event) async* {
    if (event is InitGetListProductByCategoriesEvent) {
      yield* _getListProducts(
          catId1: event.catId1, catId2: event.catId2,
          catId3: event.catId3, page: event.page,
          pageSize: event.pageSize,
      );
    }
  }
  Stream<ListProductByCategoriesState> _getListProducts({required String catId1, required String catId2, required String catId3, required int page, required int pageSize,}) async* {
    try {
      yield LoadingListProductByCategoriesState();
      final response = await userRepository.getListProduct(catId1, catId2, catId3, page, pageSize);
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        yield UpdateGetListProductByCategoriesState(response.data!.records);
      }
      else
        yield ErrorGetListProductByCategoriesState(response.message ?? '');
    } catch (e) {
      yield ErrorGetListProductByCategoriesState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
  }


  static GetListProductByCategoriesBloc of(BuildContext context) => BlocProvider.of<GetListProductByCategoriesBloc>(context);
}