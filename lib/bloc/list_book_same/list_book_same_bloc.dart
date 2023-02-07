
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/list_book_saved.dart';
import 'package:sumary_app/widgets/loading_api.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/models/model_generator/list_book_same.dart';
import '../../src/src_index.dart';

part 'list_book_same_event.dart';
part 'list_book_same_state.dart';


class ListBookSameBloc extends Bloc<ListBookSameEvent, ListBookSameState>{
  final UserRepository userRepository;

  ListBookSameBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetListBookSameState());

  @override
  Stream<ListBookSameState> mapEventToState(ListBookSameEvent event) async* {
    if (event is InitGetListBookSameEvent) {
      yield* _getListBookSame(event.id,event.page,event.pageSize);
    }
  }


  Stream<ListBookSameState> _getListBookSame(String id, int page, int pageSize) async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingListBookSameState();
      final response = await userRepository.getListBookSame(id, page, pageSize);
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        yield UpdateGetListBookSameState(response.data!.records!);
      }
      else
        yield ErrorGetListBookSameState(response.message ?? "");
    } catch (e) {
      yield ErrorGetListBookSameState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static ListBookSameBloc of(BuildContext context) => BlocProvider.of<ListBookSameBloc>(context);
}