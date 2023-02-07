
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/list_ask.dart';
import 'package:sumary_app/src/models/model_generator/list_book_saved.dart';
import 'package:sumary_app/widgets/loading_api.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/src_index.dart';

part 'list_ask_event.dart';
part 'list_ask_state.dart';


class ListAskBloc extends Bloc<ListAskEvent, ListAskState>{
  final UserRepository userRepository;

  ListAskBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetListAskState());

  @override
  Stream<ListAskState> mapEventToState(ListAskEvent event) async* {
    if (event is InitGetListAskEvent) {
      yield* _getListAsk(event.id,event.page,event.pageSize);
    }
  }
  Stream<ListAskState> _getListAsk(String id, int page, int pageSize) async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingListAskState();
      final response = await userRepository.getListAsk(id,page, pageSize);
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        yield UpdateGetListAskState(response.data);
      }
      else
        yield ErrorGetListAskState(response.message ?? "");
    } catch (e) {
      yield ErrorGetListAskState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static ListAskBloc of(BuildContext context) => BlocProvider.of<ListAskBloc>(context);
}