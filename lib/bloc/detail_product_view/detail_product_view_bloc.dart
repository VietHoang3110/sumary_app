

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/src_index.dart';

import '../../api_resfull/LocalStorage.dart';
import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/models/model_generator/detail_productt.dart';


part 'detail_product_view_event.dart';
part 'detail_product_view_state.dart';

class DetailProductViewBloc extends Bloc<DetailProductViewEvent, DetailProductViewState>{
  final UserRepository userRepository;

  DetailProductViewBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetDetailProductViewState());

  LocalStorage storage = LocalStorage();

  @override
  Stream<DetailProductViewState> mapEventToState(DetailProductViewEvent event) async* {
    if (event is InitDetailProductViewEvent) {
      yield* _getDetailProductView(event.id);
    }
  }
  Stream<DetailProductViewState> _getDetailProductView(String id) async* {
    // LoadingApi().pushLoading();
    var connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.none){
      var data = storage.getStorageByKey(id);
      if(data != null) {
        DataDetailProduct res = DataDetailProduct.fromJson(data);
        yield UpdateDetailProductViewState(res, res.book!.file!, res.book!.voice!);
      } else {
        yield ErrorGetDetailProductViewState(MESSAGES.CONNECT_ERROR);
      }
    } else {
      try {
        final response = await userRepository.getDetailProductView(id);
        if ((response.statusCode == BASE_URL.SUCCESS) ||
            (response.statusCode == BASE_URL.SUCCESS_200)) {
          yield UpdateDetailProductViewState(
              response.data!, response.data!.book!.file!,
              response.data!.book!.voice!);
        }
        else
          yield ErrorGetDetailProductViewState(response.message ?? "");
      } catch (e) {
        yield ErrorGetDetailProductViewState(MESSAGES.CONNECT_ERROR);
        throw e;
      }
    }
    // LoadingApi().popLoading();
  }


  static DetailProductViewBloc of(BuildContext context) => BlocProvider.of<DetailProductViewBloc>(context);
}