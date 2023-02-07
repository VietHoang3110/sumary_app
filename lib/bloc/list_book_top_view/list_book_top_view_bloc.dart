import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/list_top_view.dart';
import 'package:sumary_app/widgets/loading_api.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/src_index.dart';

part 'list_book_top_view_state.dart';
part 'list_book_top_view_event.dart';


class ListBookTopViewBloc extends Bloc<ListBookTopViewEvent, ListBookTopViewState>{
  final UserRepository userRepository;

  ListBookTopViewBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetListBookTopViewState());

  @override
  Stream<ListBookTopViewState> mapEventToState(ListBookTopViewEvent event) async* {
    if (event is InitGetListBookTopViewEvent) {
      yield* _getListBookTopView();
    }
  }

  Stream<ListBookTopViewState> _getListBookTopView() async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingListBookTopViewState();
      final response = await userRepository.getListBookTopView();
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        yield UpdateGetListBookTopViewState(response.data);
      }
      else
        yield ErrorGetListBookTopViewState(response.message ?? "");
    } catch (e) {
      yield ErrorGetListBookTopViewState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static ListBookTopViewBloc of(BuildContext context) => BlocProvider.of<ListBookTopViewBloc>(context);
}