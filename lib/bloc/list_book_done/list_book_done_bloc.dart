

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/widgets/loading_api.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/models/model_generator/list_book_done.dart';
import '../../src/models/model_generator/list_book_reading.dart';
import '../../src/src_index.dart';

part 'list_book_done_event.dart';
part 'list_book_done_state.dart';


class ListBookDoneBloc extends Bloc<ListBookDoneEvent, ListBookDoneState>{
  final UserRepository userRepository;

  ListBookDoneBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetListBookDoneState());

  @override
  Stream<ListBookDoneState> mapEventToState(ListBookDoneEvent event) async* {
    if (event is InitGetListBookDoneEvent) {
      yield* _getListBookDone();
    }
  }

  Stream<ListBookDoneState> _getListBookDone() async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingListBookDoneState();
      final response = await userRepository.getListBookDone();
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        yield UpdateGetListBookDoneState(response.data);
      }
      else
        yield ErrorGetListBookDoneState(response.message ?? "");
    } catch (e) {
      yield ErrorGetListBookDoneState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static ListBookDoneBloc of(BuildContext context) => BlocProvider.of<ListBookDoneBloc>(context);
}