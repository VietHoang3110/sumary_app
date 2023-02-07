

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/api_resfull/LocalStorage.dart';
import 'package:sumary_app/src/src_index.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/models/model_generator/detail_productt.dart';


part 'detail_product_event.dart';
part 'detail_product_state.dart';

class DetailProductBloc extends Bloc<DetailProductEvent, DetailProductState>{
  final UserRepository userRepository;

  DetailProductBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetDetailProductState());
  LocalStorage storage = LocalStorage();
  @override
  Stream<DetailProductState> mapEventToState(DetailProductEvent event) async* {
    if (event is InitDetailProductEvent) {
      yield* _getDetailProduct(event.id);
    }
  }
  Stream<DetailProductState> _getDetailProduct(String id) async* {
    // LoadingApi().pushLoading();
    var connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.none){
      var data = storage.getStorageByKey(id);
      if(data != null) {
        DataDetailProduct res = DataDetailProduct.fromJson(data);
        yield UpdateGetDetailProductState(res, res.book!.file!, res.book!.voice!);
      } else {
        yield ErrorGetDetailProductState(MESSAGES.CONNECT_ERROR);
      }
    } else {
      try {
        final response = await userRepository.getDetailProduct(id);
        if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
          yield UpdateGetDetailProductState(response.data!,response.data!.book!.file!,response.data!.book!.voice!);
        }
        else
          yield ErrorGetDetailProductState(response.message??"");
      } catch (e) {
        yield ErrorGetDetailProductState(MESSAGES.CONNECT_ERROR);
        throw e;
      }
    }
    // LoadingApi().popLoading();
  }


  static DetailProductBloc of(BuildContext context) => BlocProvider.of<DetailProductBloc>(context);
}