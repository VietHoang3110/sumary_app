
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/list_book_bought.dart';
import 'package:sumary_app/src/models/model_generator/list_book_saved.dart';
import 'package:sumary_app/widgets/loading_api.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/src_index.dart';

part 'list_book_bought_event.dart';
part 'list_book_bought_state.dart';


class ListBookBoughtBloc extends Bloc<ListBookboughtEvent, ListBookBoughtState>{
  final UserRepository userRepository;

  ListBookBoughtBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetListBookBoughtState());

  @override
  Stream<ListBookBoughtState> mapEventToState(ListBookboughtEvent event) async* {
    if (event is InitGetListBookBoughtEvent) {
      yield* _getListProductsBought(event.keyword,event.page,event.pageSize);
    }
  }

  List<DataProductBought> listBookBought=[];

  Stream<ListBookBoughtState> _getListProductsBought(String keyword, int page, int pageSize) async* {
    LoadingApi().pushLoading();
    try {
      if(page==1){
        yield LoadingListBookboughtState();
      }
      final response = await userRepository.getListProductsBought(keyword,page, pageSize);
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        if(page==1){
          listBookBought=response.data.records;
          yield UpdateGetListBookBoughtState(response.data.records);
        }
        else{
          listBookBought=[...listBookBought,...response.data.records];
          yield UpdateGetListBookBoughtState(listBookBought);
        }
      }
      else
        yield ErrorGetListBookBoughtState(response.message ?? "");
    } catch (e) {
      yield ErrorGetListBookBoughtState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static ListBookBoughtBloc of(BuildContext context) => BlocProvider.of<ListBookBoughtBloc>(context);
}