
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/rate_product.dart';
import 'package:sumary_app/src/src_index.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../detail_product/detail_product_bloc.dart';

part 'list_rate_product_event.dart';
part 'list_rate_product_state.dart';

class ListRateProductBloc extends Bloc<GetListRateProductEvent, ListRateProductState>{
  final UserRepository userRepository;

  ListRateProductBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetListRateProductState());

  @override
  Stream<ListRateProductState> mapEventToState(GetListRateProductEvent event) async* {
    if (event is InitGetListRateProductEvent) {
      yield* _getListRateProduct(event.id,event.page,event.pageSize);
    }
  }
  Stream<ListRateProductState> _getListRateProduct(String id, int page, int pageSize) async* {
    // LoadingApi().pushLoading();
    try {
      yield LoadingDetailProductState();
      final response = await userRepository.getRateProduct(id, page, pageSize);
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        yield UpdateGetListRateProductState(response.data!.records!);
      }
      else
        yield ErrorGetListRateProductState(response.message ?? "");
    } catch (e) {
      yield ErrorGetListRateProductState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    // LoadingApi().popLoading();
  }


  static ListRateProductBloc of(BuildContext context) => BlocProvider.of<ListRateProductBloc>(context);
}