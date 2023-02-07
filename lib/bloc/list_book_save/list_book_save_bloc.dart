
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/list_book_saved.dart';
import 'package:sumary_app/widgets/loading_api.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/src_index.dart';

part 'list_book_save_event.dart';
part 'list_book_save_state.dart';


class ListBookSaveBloc extends Bloc<ListBookSaveEvent, ListBookSaveState>{
  final UserRepository userRepository;

  ListBookSaveBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetListBookSaveState());

  @override
  Stream<ListBookSaveState> mapEventToState(ListBookSaveEvent event) async* {
    if (event is InitGetListBookSaveEvent) {
      yield* _getListProductsSave(event.keyword,event.page,event.pageSize);
    }
  }

  List<DataProductSaved> listBookSave=[];

  Stream<ListBookSaveState> _getListProductsSave(String keyword, int page, int pageSize) async* {
    LoadingApi().pushLoading();
    try {
      if(page==1){
        yield LoadingListBookSaveState();
      }
      final response = await userRepository.getListProductsSave(keyword, page, pageSize);
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        if(page==1){
          listBookSave=response.data!.records!;
          yield UpdateGetListBookSaveState(response.data!.records!);
        }
        else{
          listBookSave=[...listBookSave,...response.data!.records!];
          yield UpdateGetListBookSaveState(listBookSave);
        }
      }
      else
        yield ErrorGetListBookSaveState(response.message ?? "");
    } catch (e) {
      yield ErrorGetListBookSaveState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static ListBookSaveBloc of(BuildContext context) => BlocProvider.of<ListBookSaveBloc>(context);
}