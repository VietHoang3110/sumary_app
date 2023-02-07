
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/rate_product.dart';
import 'package:sumary_app/src/src_index.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../detail_product/detail_product_bloc.dart';

part 'list_rate_product_view_event.dart';
part 'list_rate_product_view_state.dart';

class ListRateProductViewBloc extends Bloc<GetListRateProductViewEvent, ListRateProductViewState>{
  final UserRepository userRepository;

  ListRateProductViewBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetListRateProductViewState());

  @override
  Stream<ListRateProductViewState> mapEventToState(GetListRateProductViewEvent event) async* {
    if (event is InitGetListRateProductViewEvent) {
      yield* _getListRateProductView(event.id,event.page,event.pageSize);
    }
  }
  Stream<ListRateProductViewState> _getListRateProductView(String id, int page, int pageSize) async* {
    // LoadingApi().pushLoading();
    try {
      yield LoadingDetailProductViewState();
      final response = await userRepository.getRateProductView(id, page, pageSize);
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        yield UpdateGetListRateProductViewState(response.data!.records!);
      }
      else
        yield ErrorGetListRateProductViewState(response.message ?? "");
    } catch (e) {
      yield ErrorGetListRateProductViewState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    // LoadingApi().popLoading();
  }


  static ListRateProductViewBloc of(BuildContext context) => BlocProvider.of<ListRateProductViewBloc>(context);
}